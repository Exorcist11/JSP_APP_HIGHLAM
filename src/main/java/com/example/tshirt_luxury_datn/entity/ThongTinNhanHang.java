package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "thong_tin_nhan_hang")
public class ThongTinNhanHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ho_va_ten")
    private String hoVaTen;

    @Column(name = "dia_chi_nhan_hang")
    private String diaChiNhanHang;

    @Column(name = "so_dien_thoai")
    private String soDienThoai;

    @Column(name = "trang_thai")
    private Integer trangThai;

    @Column(name = "ghi_chu")
        private String ghiChu;


}
