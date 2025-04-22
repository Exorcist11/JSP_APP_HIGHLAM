package com.example.tshirt_luxury_datn.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.enums.OrderStatus;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    long countByStatus(OrderStatus status);

    List<Order> findTop5ByOrderByOrderDateDesc();

    Page<Order> findAll(Pageable pageable);

    List<Order> findByUserId(Long userId);

    Page<Order> findByCodeIgnoreCaseStartingWithAndStatus(String code, OrderStatus status, Pageable pageable);

    Page<Order> findByCodeIgnoreCaseStartingWith(String code, Pageable pageable);

    Page<Order> findByStatus(OrderStatus status, Pageable pageable);

    Optional<Order> findByCode(String code);
}
