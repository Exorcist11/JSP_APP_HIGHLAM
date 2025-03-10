package com.example.tshirt_luxury_datn.services;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.SizeDTO;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.repository.sizeRepository;

@Service
public class SizeService {
    @Autowired
    private sizeRepository sizeRepository;

    public Size taoSize(SizeDTO request) {
        try {
            Size size = new Size();
            size.setMaSize("SIZE" + UUID.randomUUID().toString().replace("-", "").substring(0, 4).toUpperCase());
            size.setMoTa(request.getMoTa());
            size.setTenSize(request.getTenSize());
            size.setTrangThai(1);
            size.setNgayTao(new Date());
            size.setNgaySua(new Date());
            return sizeRepository.save(size);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
