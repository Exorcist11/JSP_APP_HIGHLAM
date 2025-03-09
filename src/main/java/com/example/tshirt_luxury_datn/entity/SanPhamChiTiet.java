package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Nationalized;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "san_pham_chi_tiet")
@ToString
public class SanPhamChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma_spct")
    private String maSanPhamChiTiet;

    @Column(name = "so_luong")
    private Integer soLuong;

    @Column(name = "gia")
    private Double gia;

    @OneToOne
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;

    @OneToOne
    @JoinColumn(name = "id_size")
    private Size size;

    @OneToOne
    @JoinColumn(name = "id_chat_lieu")
    private ChatLieu chatLieu;


    @ManyToOne
    @JoinColumn(name = "id_san_pham")
    private SanPham sanPham;

    @OneToOne
    @JoinColumn(name = "id_anh_san_pham_chi_tiet")
    private AnhSanPham anhSanPham;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_sua")
    private Date ngaySua;

    @Nationalized
    @Column(name = "mo_ta")
    private String moTa;

    @Column(name = "khoi_luong_san_pham ")
    private Double khoiLuongSanPham;
}
