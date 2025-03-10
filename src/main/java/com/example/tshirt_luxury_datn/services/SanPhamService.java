package com.example.tshirt_luxury_datn.services;

import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SanPhamService {
    @Autowired
    private ProductDetailRepository spctRepository;

    public SanPhamChiTiet getSPCTByID(Integer sanPhamId) {
        try {
            return spctRepository.findById(sanPhamId).orElse(null);
        } catch (Exception e) {
            throw new RuntimeException("error", e);
        }
    }
}
