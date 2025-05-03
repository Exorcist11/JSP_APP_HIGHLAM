package com.example.tshirt_luxury_datn.repository;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Discount;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Long> {
    Optional<Discount> findByCode(String code);

    @Query("SELECT d FROM Discount d WHERE d.code = :code AND d.status = true AND d.startDate <= :currentTime AND d.endDate >= :currentTime")
    Optional<Discount> findActiveDiscountByCode(String code, Timestamp currentTime);

    List<Discount> findByStatusTrueAndEndDateBefore(Timestamp currentTime);

}
