package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Nationalized;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@ToString
@Table(name = "san_pham")
public class SanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma_san_pham")
    private String maSanPham;

    @Nationalized
    @Column(name = "ten_san_pham")
    private String tenSanPham;

    @ManyToOne
    @JoinColumn(name = "id_danh_muc")
    private DanhMuc danhMuc;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @Column(name = "ngay_tao", columnDefinition = "DATE")
    private Date ngayTao;

    @Column(name = "ngay_sua", columnDefinition = "DATE")
    private Date ngaySua;

    @Column(name = "mo_ta")
    private String moTa;

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<SanPhamChiTiet> sanPhamChiTietList;
}
