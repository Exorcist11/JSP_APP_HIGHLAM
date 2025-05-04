package com.example.tshirt_luxury_datn.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Color;

@Repository
public interface ColorRepository extends JpaRepository<Color, Long> {
    List<Color> findByStatusTrue();
}
