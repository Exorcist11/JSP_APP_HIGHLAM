package com.example.tshirt_luxury_datn.entity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "anh_san_pham")
public class AnhSanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma_anh_san_pham")
    private String maAnhSanPham;

    @Column(name = "ten_anh_san_pham")
    private String tenAnhSanPham;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_sua")
    private Date ngaySua;

    @Column(name = "mo_ta")
    private String moTa;
}
