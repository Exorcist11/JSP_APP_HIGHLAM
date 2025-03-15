package com.example.tshirt_luxury_datn.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

}
