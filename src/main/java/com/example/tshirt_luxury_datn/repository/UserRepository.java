package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.NguoiDung;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<NguoiDung, Integer> {
    Optional<NguoiDung> findByEmail(String email);

    Optional<NguoiDung> findByTenDangNhap(String tenDangNhap);

    Optional<NguoiDung> findByTenDangNhapAndMatKhau(String tenDangNhap, String matKhau);
}
