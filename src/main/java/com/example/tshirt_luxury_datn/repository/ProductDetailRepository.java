package com.example.tshirt_luxury_datn.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.ProductDetail;

@Repository
public interface ProductDetailRepository extends JpaRepository<ProductDetail, Long> {
  List<ProductDetail> findByProduct_Id(Long productId);

  Optional<ProductDetail> findByProductIdAndSizeIdAndColorId(Long productId, Long sizeId, Long colorId);
}
