package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "thanh_toan")
public class ThanhToan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ma_thanh_toan")
    private String maThanhToan;
    @OneToOne
    @JoinColumn(name = "id_hoa_don")
    private HoaDon hoaDon;
    @Column(name = "phuong_thuc_thanh_toan")
    private String phuongThucThanhToan;

    @Nationalized
    @Column(name = "mo_ta")
    private String moTa;
    @Column(name = "trang_thai")
    private Integer trangThai;


}
