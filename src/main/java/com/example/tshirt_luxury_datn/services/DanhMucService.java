package com.example.tshirt_luxury_datn.services;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.DanhMucDTO;
import com.example.tshirt_luxury_datn.entity.DanhMuc;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;

@Service
public class DanhMucService {
    @Autowired
    private danhMucRepository danhMucRepository;

    public String taoMoiDanhMuc(DanhMucDTO request) {
        try {
            DanhMuc danhMuc = new DanhMuc();
            danhMuc.setMaDanhMuc("DM" + UUID.randomUUID().toString().replace("-", "").substring(0, 6).toUpperCase());
            danhMuc.setTenDanhMuc(request.getTenDanhMuc());
            danhMuc.setMoTa(request.getMoTa());
            danhMuc.setTrangThai(1);
            danhMuc.setNgaySua(new Date());
            danhMuc.setNgayTao(new Date());

            danhMucRepository.save(danhMuc);
            return "Success";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
