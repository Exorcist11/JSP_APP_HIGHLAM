package com.example.tshirt_luxury_datn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUserId(Long userId);

    List<Order> findByCodeIgnoreCaseStartingWithOrStatusIgnoreCase(String status, String code);

    List<Order> findByCodeIgnoreCaseStartingWith(String code);

    List<Order> findByStatusIgnoreCase(String status);
}
