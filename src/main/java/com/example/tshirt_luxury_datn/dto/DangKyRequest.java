package com.example.tshirt_luxury_datn.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DangKyRequest {
    private String tenNguoiDung;
    private String tenDangNhap;
    private String email;
    private String matKhau;
}
