package com.example.tshirt_luxury_datn.response;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
@Getter
@Setter
public class sanPhamResponse {
    private Integer id;
    private String maSanPham;
    private String tenSanPham;
    private Date ngayTao;
    private Double gia;

    public sanPhamResponse(Integer id, String maSanPham, String tenSanPham, Date ngayTao, Double gia) {
        this.id = id;
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.ngayTao = ngayTao;
        this.gia = gia;
    }
}
