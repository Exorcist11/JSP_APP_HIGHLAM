package com.example.tshirt_luxury_datn.request;

import com.example.tshirt_luxury_datn.entity.*;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

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
