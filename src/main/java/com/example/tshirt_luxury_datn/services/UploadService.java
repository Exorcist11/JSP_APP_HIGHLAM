package com.example.tshirt_luxury_datn.services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.AnhDTO;
import com.example.tshirt_luxury_datn.entity.AnhSanPham;
import com.example.tshirt_luxury_datn.repository.anhSanPhamRepository;

@Service
public class UploadService {
    @Autowired
    private anhSanPhamRepository uploadImg;

    public AnhSanPham taiAnh(AnhDTO request) {
        try {
            AnhSanPham anhSP = new AnhSanPham();
            anhSP.setMaAnhSanPham(request.getMaAnhSanPham());
            anhSP.setTenAnhSanPham(request.getTenAnhSanPham());
            anhSP.setTrangThai(1);
            anhSP.setMoTa(request.getMoTa());
            anhSP.setNgayTao(new Date());
            anhSP.setNgaySua(new Date());
            
            return uploadImg.save(anhSP);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
