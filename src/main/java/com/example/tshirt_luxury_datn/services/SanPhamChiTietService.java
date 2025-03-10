package com.example.tshirt_luxury_datn.services;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.SanPhamChiTietDTO;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.repository.anhSanPhamRepository;
import com.example.tshirt_luxury_datn.repository.chatLieuRepository;
import com.example.tshirt_luxury_datn.repository.mauSacRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamChiTietAdminRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import com.example.tshirt_luxury_datn.repository.sizeRepository;

@Service
public class SanPhamChiTietService {
  @Autowired
  private sanPhamChiTietAdminRepository sanPhamChiTietRepository;
  @Autowired
  private mauSacRepository mauSacRepository;
  @Autowired
  private sizeRepository sizeRepository;
  @Autowired
  private chatLieuRepository chatLieuRepository;
  @Autowired
  private sanPhamRepository sanPhamRepository;
  @Autowired
  private anhSanPhamRepository anhSanPhamRepository;

  public SanPhamChiTiet taoMoiSanPham(SanPhamChiTietDTO request, Integer id) {
    try {
      SanPhamChiTiet spct = new SanPhamChiTiet();
      spct.setMaSanPhamChiTiet("SPCT" + UUID.randomUUID().toString().replace("-", "").substring(0, 4).toUpperCase());
      spct.setGia(request.getGia());
      spct.setKhoiLuongSanPham(request.getKhoiLuongSanPham());
      spct.setMoTa(request.getMoTa());
      spct.setNgayTao(new Date());
      spct.setNgaySua(new Date());
      spct.setSoLuong(request.getSoLuong());
      spct.setTrangThai(1);

      spct.setAnhSanPham(anhSanPhamRepository.findById(request.getIdAnhSanPham()).orElse(null));
      spct.setChatLieu(chatLieuRepository.findById(request.getIdChatLieu()).orElse(null));
      spct.setMauSac(mauSacRepository.findById(request.getIdMauSac()).orElse(null));
      spct.setSanPham(sanPhamRepository.findById(id).orElse(null));
      spct.setSize(sizeRepository.findById(request.getIdSize()).orElse(null));

      return sanPhamChiTietRepository.save(spct);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
