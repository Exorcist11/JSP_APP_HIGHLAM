package com.example.tshirt_luxury_datn.services;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.MauSacDTO;
import com.example.tshirt_luxury_datn.entity.MauSac;
import com.example.tshirt_luxury_datn.repository.mauSacRepository;

@Service
public class MauSacService {
    @Autowired
    private mauSacRepository mauSacRepository;

    public MauSac taoMoiMauSac(MauSacDTO request) {
        try {
            MauSac mauSac = new MauSac();
            mauSac.setMaMauSac("MS" + UUID.randomUUID().toString().replace("-", "").substring(0, 6).toUpperCase());
            mauSac.setTenMauSac(request.getTenMauSac());
            mauSac.setMoTa(request.getMoTa());
            mauSac.setTrangThai(1);
            mauSac.setNgayTao(new Date());
            mauSac.setNgaySua(new Date());

            return mauSacRepository.save(mauSac);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
