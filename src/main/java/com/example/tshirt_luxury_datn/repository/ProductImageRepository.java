package com.example.tshirt_luxury_datn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.ProductImage;

import jakarta.transaction.Transactional;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage, Long> {
    ProductImage findByProductDetailId(Long productDetailId);

    List<ProductImage> findAllByProductDetailId(Long productDetailId);

    List<ProductImage> findByProductDetail_Product_Id(Long productId);

    @Transactional
    @Modifying
    @Query("DELETE FROM ProductImage pi WHERE pi.productDetail.id = :productDetailId")
    int deleteByProductDetailId(Long productDetailId);
}
