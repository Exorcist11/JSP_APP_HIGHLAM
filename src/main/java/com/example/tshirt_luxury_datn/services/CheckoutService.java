package com.example.tshirt_luxury_datn.services;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.TimeZone;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.config.Config;
import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.Cart;
import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.OrderItem;
import com.example.tshirt_luxury_datn.entity.Payment;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.enums.OrderStatus;
import com.example.tshirt_luxury_datn.repository.OrderItemRepository;
import com.example.tshirt_luxury_datn.repository.OrderRepository;
import com.example.tshirt_luxury_datn.repository.PaymentRepository;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;
import com.example.tshirt_luxury_datn.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class CheckoutService {
  @Autowired
  private OrderRepository orderRepository;

  @Autowired
  private ProductDetailRepository productDetailRepository;

  @Autowired
  private ProductRepository productRepository;

  @Autowired
  private PaymentRepository paymentRepository;

  @Autowired
  private OrderItemRepository orderItemRepository;

  @Autowired
  private CartService cartService;

  public static String generateOrderCode() {
    LocalTime now = LocalTime.now();

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmmss");
    String timeString = now.format(formatter);
    return "HD" + timeString;
  }

  @Transactional
  public String processCheckout(OrderDTO orderDTO, HttpSession session) throws UnsupportedEncodingException {
    try {
      User loggedInUser = (User) session.getAttribute("loggedInUser");
      List<CartItem> cartItems;

      if (loggedInUser != null) {
        // Lấy giỏ hàng từ cơ sở dữ liệu khi người dùng đã đăng nhập
        Cart cart = cartService.getCartByUserId(loggedInUser.getId());
        cartItems = cart.getCartItems();
      } else {
        // Lấy giỏ hàng từ session khi người dùng chưa đăng nhập
        @SuppressWarnings("unchecked")
        List<CartItem> sessionCart = (List<CartItem>) session.getAttribute("userCart");
        cartItems = sessionCart;
      }

      if (cartItems == null || cartItems.isEmpty()) {
        throw new IllegalStateException("Giỏ hàng trống");
      }

      // Tính tổng tiền
      double totalAmount = calculateTotalAmount(cartItems) + 35000;
      System.out.println("Tổng tiền là: " + totalAmount);

      // Tạo Order
      Order order = new Order();
      order.setStatus(OrderStatus.PENDING);
      order.setOrderType(orderDTO.getTrangThai().equals("1") ? "COD" : "ONLINE");
      order.setTotalAmount(totalAmount);
      order.setCode(generateOrderCode());
      order.setGuestEmail(orderDTO.getGuestEmail());
      order.setRecipientAddress(orderDTO.getRecipientAddress());
      order.setRecipientPhone(orderDTO.getRecipientPhone());
      order.setRecipientName(orderDTO.getRecipientName());
      order.setNotes(orderDTO.getNote());
      order.setOrderItems(new ArrayList<>()); // Khởi tạo danh sách orderItems
      order.setUser(loggedInUser); // Liên kết với người dùng nếu đã đăng nhập

      // Lưu Order
      order = orderRepository.save(order);
      System.out.println("Order saved with ID: " + order.getId());

      // Tạo và lưu OrderItem
      List<OrderItem> orderItems = createOrderItems(order, cartItems);
      for (OrderItem orderItem : orderItems) {
        orderItem.setOrder(order);
        order.getOrderItems().add(orderItem); // Đồng bộ mối quan hệ
      }
      orderItemRepository.saveAll(orderItems);
      System.out.println("OrderItems saved: " + orderItems.size());

      // Tạo và lưu Payment
      String paymentUrl;
      if (orderDTO.getTrangThai().equals("1")) { // COD
        Payment payment = createPayment(order, "COD", null);
        payment.setStatus(true);
        paymentRepository.save(payment);
        System.out.println("Payment saved for COD order: " + order.getCode());

        // Giả lập các tham số như thanh toán VNPay
        String transactionNo = "COD" + new Random().nextInt(99999999);
        String orderInfo = URLEncoder.encode("Thanh toan don hang: " + order.getCode(), "UTF-8");
        String payDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String txnRef = "TXN-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        long amountVND = (long) (totalAmount * 100);

        paymentUrl = String.format(
            "redirect:/paymentResult?vnp_Amount=%d&vnp_BankCode=COD&vnp_BankTranNo=%s&vnp_CardType=COD" +
                "&vnp_OrderInfo=%s&vnp_PayDate=%s&vnp_ResponseCode=00&vnp_TmnCode=V9TZGVS9" +
                "&vnp_TransactionNo=%s&vnp_TransactionStatus=00&vnp_TxnRef=%s&vnp_SecureHash=fakehash",
            amountVND, transactionNo, orderInfo, payDate, transactionNo, txnRef);
      } else { // ONLINE (VNPay)
        Payment payment = createPayment(order, "ONLINE", generateTransactionId());
        payment.setStatus(false);
        paymentRepository.save(payment);
        System.out.println("Payment saved for VNPay order: " + order.getCode());
        paymentUrl = generateVNPayPaymentUrl(order, payment, (long) totalAmount);
      }

      // Xóa giỏ hàng chỉ khi tất cả thành công
      if (loggedInUser != null) {
        // Xóa giỏ hàng trong database nếu người dùng đã đăng nhập
        Cart cart = cartService.getCartByUserId(loggedInUser.getId());
        cartService.clearCart(cart);
      } else {
        // Xóa giỏ hàng trong session nếu chưa đăng nhập
        session.removeAttribute("userCart");
      }

      System.out.println("Cart cleared");

      return paymentUrl;

    } catch (Exception e) {
      // Ghi log chi tiết lỗi
      e.printStackTrace();
      throw new RuntimeException("Lỗi trong quá trình checkout: " + e.getMessage(), e);
    }
  }

  private double calculateTotalAmount(List<CartItem> cartItems) {
    return cartItems.stream()
        .map(cartItem -> new CartItemDTO(cartItem))
        .mapToDouble(dto -> dto.getPrice() * dto.getQuantity())
        .sum();
  }

  private String generateTransactionId() {
    return "TXN-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
  }

  private List<OrderItem> createOrderItems(Order order, List<CartItem> cartItems) {
    List<OrderItem> orderItems = new ArrayList<>();
    for (CartItem cartItem : cartItems) {
      OrderItem orderItem = new OrderItem();
      orderItem.setOrder(order);
      orderItem.setPrice(cartItem.getProductDetail().getProduct().getPrice());
      orderItem.setQuantity(cartItem.getQuantity());
      orderItem.setProductDetail(cartItem.getProductDetail());
      orderItem.setStatus(true);
      orderItems.add(orderItem);
    }
    return orderItems;
  }

  private Payment createPayment(Order order, String paymentMethod, String transactionId) {
    Payment payment = new Payment();
    payment.setOrder(order);
    payment.setPaymentMethod(paymentMethod);
    payment.setTransactionId(transactionId);
    payment.setPaymentDate(java.time.LocalDateTime.now());
    payment.setStatus(paymentMethod.equals("COD") ? false : false); // False until VNPay confirms

    return payment;
  }

  public String generateVNPayPaymentUrl(Order order, Payment payment, long total) throws UnsupportedEncodingException {
    String vnp_Version = "2.1.0";
    String vnp_Command = "pay";
    String orderType = "other";
    long amount = total * 100;
    String bankCode = "";

    String vnp_TxnRef = payment.getTransactionId();
    String vnp_IpAddr = "127.0.0.1"; // Nên thay bằng IP thật khi triển khai

    Map<String, String> vnp_Params = new HashMap<>();
    vnp_Params.put("vnp_Version", vnp_Version);
    vnp_Params.put("vnp_Command", vnp_Command);
    vnp_Params.put("vnp_TmnCode", Config.vnp_TmnCode);
    vnp_Params.put("vnp_Amount", String.valueOf(amount));
    vnp_Params.put("vnp_CurrCode", "VND");
    vnp_Params.put("vnp_BankCode", bankCode);
    vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
    vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang: " + order.getCode());
    vnp_Params.put("vnp_OrderType", orderType);
    vnp_Params.put("vnp_Locale", "vn");
    vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl); // Sửa ở đây
    vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

    Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    String vnp_CreateDate = formatter.format(cld.getTime());
    vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

    cld.add(Calendar.MINUTE, 15);
    String vnp_ExpireDate = formatter.format(cld.getTime());
    vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

    List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
    Collections.sort(fieldNames);
    StringBuilder hashData = new StringBuilder();
    StringBuilder query = new StringBuilder();

    Iterator<String> itr = fieldNames.iterator();
    while (itr.hasNext()) {
      String fieldName = itr.next();
      String fieldValue = vnp_Params.get(fieldName);
      if ((fieldValue != null) && (fieldValue.length() > 0)) {
        hashData.append(fieldName).append('=')
            .append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
        query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString())).append('=')
            .append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
        if (itr.hasNext()) {
          query.append('&');
          hashData.append('&');
        }
      }
    }

    String queryUrl = query.toString();
    String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
    queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
    String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

    System.out.println("Generated VNPay URL: " + paymentUrl); // Thêm log để debug
    return paymentUrl;
  }

  public Order createOrder(OrderDTO orderDTO, HttpSession session) {
    try {
      Optional<User> loggedInUserOpt = Optional.ofNullable((User) session.getAttribute("loggedInUser"));

      Order order = new Order();
      order.setGuestEmail(orderDTO.getGuestEmail());
      order.setStatus(OrderStatus.PENDING);
      order.setOrderType("ONLINE");
      order.setNotes(orderDTO.getNote());
      order.setRecipientAddress(orderDTO.getRecipientAddress());
      order.setRecipientName(orderDTO.getRecipientName());
      order.setRecipientPhone(orderDTO.getRecipientPhone());
      order.setUser(loggedInUserOpt.orElse(null));
      order.setCode(generateOrderCode());

      List<OrderItem> orderItems = new ArrayList<>();
      double totalAmount = 0;

      for (ProductDetailDTO productDetailDTO : orderDTO.getProductItems()) {
        ProductDetail productDetail = productDetailRepository.findByProductIdAndSizeIdAndColorId(
            productDetailDTO.getProductID(), productDetailDTO.getSizeID(), productDetailDTO.getColorID()).orElse(null);

        Product product = productRepository.findById(productDetailDTO.getProductID()).orElse(null);

        if (productDetail == null) {
          throw new RuntimeException("Sản phẩm không tồn tại: " + productDetailDTO.getProductID());
        }

        if (productDetail.getQuantity() < productDetailDTO.getQuantity()) {
          throw new RuntimeException("Số lượng không đủ cho sản phẩm: " + productDetailDTO.getProductID());
        }

        OrderItem orderItem = new OrderItem();
        orderItem.setProductDetail(productDetail);
        orderItem.setQuantity(productDetailDTO.getQuantity());
        orderItem.setPrice(product.getPrice());
        orderItem.setStatus(true);

        totalAmount += productDetailDTO.getQuantity() * product.getPrice() + 35000;
        orderItems.add(orderItem);

        productDetail.setQuantity(productDetail.getQuantity() - productDetailDTO.getQuantity());
      }

      order.setTotalAmount(totalAmount);
      Order savedOrder = orderRepository.save(order);

      for (OrderItem orderItem : orderItems) {
        orderItem.setOrder(savedOrder);
      }

      productDetailRepository.saveAll(orderItems.stream()
          .map(OrderItem::getProductDetail)
          .toList());

      Payment payment = new Payment();
      payment.setOrder(savedOrder);
      payment.setStatus(true);
      payment.setPaymentMethod(orderDTO.getPaymentMethod());
      paymentRepository.save(payment);

      savedOrder.setOrderItems(orderItems);
      return orderRepository.save(savedOrder);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi thêm order: " + e.getMessage());
    }
  }

}