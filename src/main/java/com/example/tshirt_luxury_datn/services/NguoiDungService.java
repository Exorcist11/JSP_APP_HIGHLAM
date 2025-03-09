package com.example.tshirt_luxury_datn.services;

import com.example.tshirt_luxury_datn.dto.DangKyRequest;
import com.example.tshirt_luxury_datn.entity.ChucVu;
import com.example.tshirt_luxury_datn.entity.NguoiDung;
import com.example.tshirt_luxury_datn.repository.ChucVuRepository;
import com.example.tshirt_luxury_datn.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class NguoiDungService {
    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private ChucVuRepository chucVuRepository;
//    private final PasswordEncoder passwordEncoder;

    public String dangKy(DangKyRequest request) {
        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new RuntimeException("Email đã được sử dụng!");
        }
        if (userRepository.findByTenDangNhap(request.getTenDangNhap()).isPresent()) {
            throw new RuntimeException("Tên đăng nhập đã tồn tại");
        }
        NguoiDung nguoiDung = new NguoiDung();
        nguoiDung.setMaNguoiDung(UUID.randomUUID().toString());
        nguoiDung.setTenNguoiDung(request.getTenNguoiDung());
        nguoiDung.setTenDangNhap(request.getTenDangNhap());
        nguoiDung.setEmail(request.getEmail());
        nguoiDung.setMatKhau(request.getMatKhau());

        ChucVu cv = chucVuRepository.findById(2).orElseThrow(() -> new RuntimeException("Not Found!"));
        nguoiDung.setChucVu(cv);

        nguoiDung.setTrangThai(1);
        nguoiDung.setNgayTao(new Date());

        userRepository.save(nguoiDung);
        return "Success";

    }
}

