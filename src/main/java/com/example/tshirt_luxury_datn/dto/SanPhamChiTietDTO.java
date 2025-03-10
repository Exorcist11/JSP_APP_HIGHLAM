package com.example.tshirt_luxury_datn.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SanPhamChiTietDTO {
  private Integer soLuong;
  private Double gia;
  private Integer idMauSac;
  private Integer idSize;
  private Integer idChatLieu;
  private Integer idSanPham;
  private Integer idAnhSanPham;
  private String moTa;
  private Double khoiLuongSanPham;
}
