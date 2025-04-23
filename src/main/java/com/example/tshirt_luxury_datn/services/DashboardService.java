package com.example.tshirt_luxury_datn.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.enums.OrderStatus;
import com.example.tshirt_luxury_datn.repository.OrderRepository;
import com.example.tshirt_luxury_datn.repository.ProductRepository;
import com.example.tshirt_luxury_datn.repository.UserRepository;

@Service
public class DashboardService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    public long getTotalProducts() {
        return productRepository.count();
    }

    public double getTotalRevenue() {
        return orderRepository.findAll().stream()
                .filter(order -> order.getStatus().equals(OrderStatus.SUCCESS))
                .mapToDouble(Order::getTotalAmount)
                .sum();
    }

    public long getTotalCustomers() {
        return userRepository.count();
    }

    public long getTotalOrders() {
        return orderRepository.count();
    }

    public Map<String, Long> getOrderStatusStats() {
        Map<String, Long> stats = new HashMap<>();
        stats.put("PENDING", orderRepository.countByStatus(OrderStatus.PENDING));
        stats.put("CONFIRMED", orderRepository.countByStatus(OrderStatus.CONFIRMED));
        stats.put("DELIVERING", orderRepository.countByStatus(OrderStatus.DELIVERING));
        stats.put("SUCCESS", orderRepository.countByStatus(OrderStatus.SUCCESS));
        stats.put("CANCELLED", orderRepository.countByStatus(OrderStatus.CANCELLED));
        stats.put("RETURNED", orderRepository.countByStatus(OrderStatus.RETURNED));
        return stats;
    }

    public List<Order> getRecentOrders() {
        return orderRepository.findTop5ByOrderByOrderDateDesc();
    }

    // public List<Product> getTopSellingProducts() {
    // return productRepository.findTop5ByOrderItemsQuantity();
    // }
}
