package com.example.tshirt_luxury_datn.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Page<Order> findAll(Pageable pageable);

    List<Order> findByUserId(Long userId);

    Page<Order> findByCodeIgnoreCaseStartingWithOrStatusIgnoreCase(String status, String code, Pageable pageable);

    List<Order> findByCodeIgnoreCaseStartingWith(String code);

    List<Order> findByStatusIgnoreCase(String status);

    Optional<Order> findByCode(String code);
}
