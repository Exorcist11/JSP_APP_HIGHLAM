package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.response.sanPhamResponse;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface sanPhamRepository extends JpaRepository<SanPham, Integer> {
    @Query(value = "SELECT * FROM san_pham ORDER BY ngay_tao DESC", nativeQuery = true)
    List<SanPham> findAllSanPhamByNgayTaoDesc();

    @Query(value = "SELECT * FROM san_pham WHERE ten_san_pham LIKE  %:keyWord% ", nativeQuery = true)
    List<SanPham> timKiem(@Param("keyWord") String keyWord);


    @Query("SELECT new com.example.tshirt_luxury_datn.response.sanPhamResponse(s.id, s.maSanPham, s.tenSanPham, s.ngayTao, " +
            " (SELECT spc.gia FROM SanPhamChiTiet spc WHERE spc.sanPham.id = s.id ORDER BY spc.ngayTao DESC LIMIT 1)) " +
            "FROM SanPham s " +
            "ORDER BY s.ngayTao DESC")
    List<sanPhamResponse> findTop4NewestSanPhamWithGia(Pageable pageable);

    @Query(value = "SELECT * FROM san_pham WHERE barcode = :barCode", nativeQuery = true)
    SanPham findSanPhamByBarcode(@Param("barCode") String barCode);


    @Query(value = "SELECT * FROM san_pham WHERE ten_san_pham LIKE %:keyWord% "
           + " AND (:trangThai IS NULL OR trang_thai = :trangThai)", nativeQuery = true)
    List<SanPham> timKiemSP(@Param("keyWord") String keyWord, @Param("trangThai") Integer trangThai);


}
