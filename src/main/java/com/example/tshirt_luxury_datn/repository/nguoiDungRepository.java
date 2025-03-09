package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.NguoiDung;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface nguoiDungRepository extends JpaRepository<NguoiDung, Integer> {
    @Query(value = "select * from nguoi_dung where ten_dang_nhap = :tenDangNhap\n", nativeQuery = true)
    NguoiDung getNguoiDung(@Param("tenDangNhap") String tenDangNhap);


    @Query(value = "SELECT TOP 1 ma_nguoi_dung FROM nguoi_dung ORDER BY ma_nguoi_dung DESC", nativeQuery = true)
    String findLastMaNguoiDung();

    @Query(value = "SELECT * FROM nguoi_dung WHERE ten_nguoi_dung LIKE %:keyWord%"
            + " AND (:idChucVu IS NULL OR id_chuc_vu = :idChucVu)", nativeQuery = true)
    List<NguoiDung> timKiemND(@Param("keyWord") String keyWord, @Param("idChucVu") Integer idChucVu);

}


