package com.example.tshirt_luxury_datn.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DangNhapRequest {
    private String tenDangNhap;
    private String matKhau;
}
