package com.example.tshirt_luxury_datn.services;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.OrderItem;
import com.example.tshirt_luxury_datn.entity.Payment;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.enums.OrderStatus;
import com.example.tshirt_luxury_datn.repository.OrderItemRepository;
import com.example.tshirt_luxury_datn.repository.OrderRepository;
import com.example.tshirt_luxury_datn.repository.PaymentRepository;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private ProductDetailService productDetailService;
    
    @Autowired
    private ProductDetailRepository productDetailRepository;

    public Page<Order> getListOrders(Pageable pageable) {
        Pageable sortedPageable = PageRequest.of(
                pageable.getPageNumber(),
                pageable.getPageSize(),
                Sort.by(Sort.Direction.DESC, "updatedAt"));
        return orderRepository.findAll(sortedPageable);
    }

    public List<Order> getOrderByUser(Long userID) {
        return orderRepository.findByUserId(userID);
    }

    public List<OrderItem> getOrderItemsByOrderId(Long orderId) {
        Objects.requireNonNull(orderId, "Order ID must not be null");
        try {
            return orderItemRepository.findByOrderId(orderId);
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order items for orderId: " + orderId, e);
        }
    }

    public Order getOrderDetail(Long OrderId) {
        try {
            Optional<Order> orderOpt = orderRepository.findById(OrderId);
            if (orderOpt.isEmpty()) {
                throw new RuntimeException("Order not found for orderId: " + OrderId);
            }
            return orderOpt.get();
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + OrderId, e);
        }
    }

    public Order changeStatusOrder(Long orderId, OrderStatus status) {
        try {
            Optional<Order> orderOpt = orderRepository.findById(orderId);
            if (orderOpt.isEmpty()) {
                throw new RuntimeException("Order not found for orderId: " + orderId);
            }
            Order order = orderOpt.get();
            if (status == OrderStatus.CONFIRMED) {
                for (OrderItem orderItem : order.getOrderItems()) {
                    ProductDetail productDetail = orderItem.getProductDetail();
                    if (productDetail.getQuantity() < orderItem.getQuantity()) {
                        throw new RuntimeException("Not enough stock for product: " + productDetail.getCode());
                    }
                    productDetail.setQuantity(productDetail.getQuantity() - orderItem.getQuantity());
                    productDetailRepository.save(productDetail);
                }
            }
            order.setStatus(status);
            return orderRepository.save(order);
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + orderId, e);
        }
    }

    public Page<Order> searchOrder(String code, OrderStatus status, Pageable pageable) {
        try {
            Pageable sortedPageable = PageRequest.of(
                    pageable.getPageNumber(),
                    pageable.getPageSize(),
                    Sort.by(Sort.Direction.DESC, "updatedAt"));

            if (code != null && !code.isEmpty() && status != null) {
                return orderRepository.findByCodeIgnoreCaseStartingWithAndStatus(code, status, sortedPageable);
            } else if (code != null && !code.isEmpty()) {
                return orderRepository.findByCodeIgnoreCaseStartingWith(code, sortedPageable);
            } else if (status != null) {
                return orderRepository.findByStatus(status, sortedPageable);
            } else {
                return orderRepository.findAll(sortedPageable);
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to search order: " + e.getMessage());
        }
    }

    public Order getOrderByID(Long id) {
        try {
            Optional<Order> orderOpt = orderRepository.findById(id);
            if (orderOpt.isEmpty()) {
                throw new RuntimeException("Order not found for orderId: " + id);
            }
            return orderOpt.get();
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + id, e);
        }
    }

    public Order getOrderByCode(String code) {
        try {
            Optional<Order> orderOpt = orderRepository.findByCode(code);
            if (orderOpt.isEmpty()) {
                throw new RuntimeException("Order not found for orderId: " + code);
            }
            return orderOpt.get();
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + code, e);
        }
    }

    public static String generateOrderCode() {
        LocalTime now = LocalTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmmss");
        String timeString = now.format(formatter);
        return "HD" + timeString;
    }

    public Order orderInStore(List<CartItem> cart, OrderDTO request) {
        try {
            if (cart == null || cart.isEmpty()) {
                throw new IllegalArgumentException("Cart null");
            }

            Order order = new Order();
            order.setOrderType("POS");
            order.setStatus(OrderStatus.SUCCESS);
            order.setTotalAmount(cart.stream()
                    .mapToDouble(item -> item.getProductDetail().getProduct().getPrice() * item.getQuantity()).sum());
            order.setCode(generateOrderCode());
            order.setRecipientAddress(request.getRecipientAddress());
            order.setRecipientPhone(request.getRecipientPhone());
            order.setRecipientName(request.getRecipientName());
            order.setGuestEmail("guest@example.com");
            order.setNotes("IN STORE");

            List<OrderItem> orderItems = cart.stream().map(cartItem -> {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrder(order);
                orderItem.setProductDetail(cartItem.getProductDetail());
                orderItem.setQuantity(cartItem.getQuantity());
                orderItem.setPrice(cartItem.getProductDetail().getProduct().getPrice());
                orderItem.setStatus(true);
                return orderItem;
            }).collect(Collectors.toList());

            order.setOrderItems(orderItems);
            Order savedOrder = orderRepository.save(order);

            Payment payment = new Payment();
            payment.setOrder(savedOrder);
            payment.setStatus(true);
            payment.setPaymentMethod(request.getPaymentMethod());
            paymentRepository.save(payment);

            for (CartItem cartItem : cart) {
                ProductDetail pd = cartItem.getProductDetail();
                pd.setQuantity(pd.getQuantity() - cartItem.getQuantity());
                productDetailService._posUpdateProductDetail(pd);
            }

            return savedOrder;

        } catch (Exception e) {
            throw new RuntimeException("Failed to create order in store");
        }
    }
}
