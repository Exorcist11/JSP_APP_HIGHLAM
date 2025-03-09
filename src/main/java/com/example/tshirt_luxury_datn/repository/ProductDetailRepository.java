package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductDetailRepository extends JpaRepository<SanPhamChiTiet, Integer> {
    List<SanPhamChiTiet> findBySanPham_Id(Integer sanPhamId);

    @Query("SELECT spct FROM SanPhamChiTiet spct JOIN FETCH spct.sanPham WHERE spct.sanPham.id = :sanPhamId")
    List<SanPhamChiTiet> findAllBySanPham(@Param("sanPhamId") Integer sanPhamId);
}
