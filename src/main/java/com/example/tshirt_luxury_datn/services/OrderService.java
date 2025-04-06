package com.example.tshirt_luxury_datn.services;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.OrderItem;
import com.example.tshirt_luxury_datn.entity.Payment;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.repository.OrderItemRepository;
import com.example.tshirt_luxury_datn.repository.OrderRepository;
import com.example.tshirt_luxury_datn.repository.PaymentRepository;

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

    public List<Order> getListOrders() {
        return orderRepository.findAll();
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

    public Order changeStatusOrder(Long orderId, String status) {
        try {
            Optional<Order> orderOpt = orderRepository.findById(orderId);
            if (orderOpt.isEmpty()) {
                throw new RuntimeException("Order not found for orderId: " + orderId);
            }
            Order order = orderOpt.get();
            order.setStatus(status);
            return orderRepository.save(order);
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + orderId, e);
        }
    }

    public List<Order> searchOrder(String status, String code) {
        try {
            return orderRepository.findByCodeIgnoreCaseStartingWithOrStatusIgnoreCase(status, code);
        } catch (Exception e) {
            throw new RuntimeException("Failed to searcg order detail for orderId: " + e);
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
            order.setStatus("SUCCCESS");
            order.setTotalAmount(0.0);
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
