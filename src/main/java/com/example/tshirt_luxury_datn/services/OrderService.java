package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.OrderItem;
import com.example.tshirt_luxury_datn.repository.OrderItemRepository;
import com.example.tshirt_luxury_datn.repository.OrderRepository;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

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
}
