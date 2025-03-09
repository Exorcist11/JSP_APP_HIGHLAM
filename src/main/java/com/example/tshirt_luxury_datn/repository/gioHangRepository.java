package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.GioHang;
import com.example.tshirt_luxury_datn.entity.GioHangChiTiet;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface gioHangRepository extends JpaRepository<GioHang, Integer> {

    @Query(value = "SELECT COALESCE((SELECT TOP 1 trang_thai FROM gio_hang ORDER BY ngay_tao DESC), 0)", nativeQuery = true)
    Integer trangThaiGioHang();


    @Query(value = "UPDATE gio_hang SET trang_thai = '1' WHERE id = :idGioHang", nativeQuery = true)
    Integer updateTrangThaiGioHang(@Param("idGioHang") Integer idGioHang);


}
