package com.example.tshirt_luxury_datn.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.CategoryDetail;

@Repository
public interface CategoryDetailRepository extends JpaRepository<CategoryDetail, Long> {
    List<CategoryDetail> findByCategoryId(Long categoryId);

    List<CategoryDetail> findByStatusTrue();

    Optional<CategoryDetail> findByName(String name);

    List<CategoryDetail> findByCategoryIdAndStatusTrue(Long categoryId);
}
