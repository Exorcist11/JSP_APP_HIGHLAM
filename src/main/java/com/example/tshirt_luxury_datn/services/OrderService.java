package com.example.tshirt_luxury_datn.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.repository.OrderRepository;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public List<Order> getListOrders() {
        return orderRepository.findAll();
    }
}
