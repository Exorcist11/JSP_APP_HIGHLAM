package com.example.tshirt_luxury_datn.request;

import com.example.tshirt_luxury_datn.entity.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class sanPhamChiTietAdminRequest {
    private String maMauSac;

    private Integer soLuong;

    private Double gia;

    private MauSac mauSac;

    private Size size;

    private ChatLieu chatLieu;

    private SanPham sanPham;

    private AnhSanPham anhSanPham;

    private Integer trangThai;

    private String moTa;

    private Double khoiLuongSanPham;
}
