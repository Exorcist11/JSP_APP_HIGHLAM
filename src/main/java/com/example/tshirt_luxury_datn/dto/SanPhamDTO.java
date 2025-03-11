package com.example.tshirt_luxury_datn.dto;

import java.util.List;

import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SanPhamDTO {
    private Integer id;
    private String maSanPham;
    private String tenSanPham;
    private Integer trangThai;
    private String moTa;
    private List<SanPhamChiTiet> sanPhamChiTietList;
}
