package com.example.tshirt_luxury_datn.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Size;
import java.util.List;

@Repository
public interface SizeRepository extends JpaRepository<Size, Long> {
    Optional<Size> findByName(String name);

    List<Size> findByStatusTrue();
}
