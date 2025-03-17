package com.example.tshirt_luxury_datn.services;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.OrderItem;
import com.example.tshirt_luxury_datn.entity.Payment;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.repository.OrderRepository;
import com.example.tshirt_luxury_datn.repository.PaymentRepository;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;
import com.example.tshirt_luxury_datn.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

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

  public Order createOrder(OrderDTO orderDTO, HttpSession session) {
    try {
      User loggedInUser = (User) session.getAttribute("loggedInUser");

      Order order = new Order();
      order.setGuestEmail(orderDTO.getGuestEmail());
      order.setStatus("PENDING");
      order.setNotes(orderDTO.getNote());
      order.setRecipientAddress(orderDTO.getRecipientAddress());
      order.setRecipientName(orderDTO.getRecipientName());
      order.setRecipientPhone(orderDTO.getRecipientPhone());
      order.setUser(loggedInUser);
      order.setOrderDate(LocalDateTime.now());

      order.setCreatedAt(LocalDateTime.now());
      order.setUpdatedAt(LocalDateTime.now());

      List<OrderItem> orderItems = new ArrayList<>();
      double totalAmount = 0;

      for (ProductDetailDTO productDetailDTO : orderDTO.getProductItems()) {
        ProductDetail productDetail = productDetailRepository.findByProductIdAndSizeIdAndColorId(
            productDetailDTO.getProductID(), productDetailDTO.getSizeID(), productDetailDTO.getColorID()).orElse(null);
        Product product = productRepository.findById(productDetailDTO.getProductID()).orElse(null);
        System.out.println("Product ID" + productDetailDTO.getColorID() + productDetailDTO.getProductID()
            + productDetailDTO.getSizeID());
        if (productDetail == null) {
          throw new RuntimeException("Sản phẩm không tồn tại: " + productDetailDTO.getProductID());
        }

        OrderItem orderItem = new OrderItem();
        orderItem.setProductDetail(productDetail);
        orderItem.setQuantity(productDetailDTO.getQuantity());
        orderItem.setPrice(product.getPrice());
        orderItem.setStatus(true);
        orderItem.setCreatedAt(LocalDateTime.now());
        orderItem.setUpdatedAt(LocalDateTime.now());

        totalAmount += productDetailDTO.getQuantity() * product.getPrice() + 35000;
        orderItems.add(orderItem);
      }

      order.setTotalAmount(totalAmount);
      Order savedOrder = orderRepository.save(order);

      for (OrderItem orderItem : orderItems) {
        orderItem.setOrder(savedOrder);
      }

      Payment payment = new Payment();
      payment.setOrder(savedOrder);
      payment.setStatus(true);
      payment.setPaymentMethod(orderDTO.getPaymentMethod());
      payment.setPaymentDate(LocalDateTime.now());
      paymentRepository.save(payment);

      savedOrder.setOrderItems(orderItems);
      return orderRepository.save(savedOrder);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi thêm order: " + e.getMessage());
    }
  }
}
