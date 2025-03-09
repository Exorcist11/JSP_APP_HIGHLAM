package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.ChucVu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ChucVuRepository extends JpaRepository<ChucVu, Integer> {
    Optional<ChucVu> findById(Integer cv);
}
