package com.example.tshirt_luxury_datn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query("SELECT p FROM Product p WHERE " +
            "(:timKiemSanPham IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :timKiemSanPham, '%'))) AND " +
            "(:trangThai IS NULL OR p.status = :trangThai)")
    List<Product> searchProducts(@Param("timKiemSanPham") String timKiemSanPham,
            @Param("trangThai") Boolean trangThai);

    List<Product> findTop4ByOrderByCreatedAtDesc();
}
