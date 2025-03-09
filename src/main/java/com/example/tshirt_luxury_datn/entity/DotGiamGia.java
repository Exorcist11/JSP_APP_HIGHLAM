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
@Table(name = "dot_giam_gia")
public class DotGiamGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ma_dot_giam_gia")
    private String maDotGiamGia;
    @Nationalized
    @Column(name = "ten_dot_giam_gia")
    private String tenDotGiamGia;
    @Column(name = "mo_ta")
    private String moTa;
    @Column(name = "gia_tri_giam")
    private Integer giaTriGiam;
    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_bat_dau")
    private Date ngayBatDau;
    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_ket_thuc")
    private Date ngayKetThuc;
    @Column(name = "trang_thai")
    private String trangThai;
    @ManyToOne
    @JoinColumn(name = "id_danh_muc")
    private DanhMuc danhMuc;
    @Column(name = "ghi_chu")
    private String ghiChu;

}
