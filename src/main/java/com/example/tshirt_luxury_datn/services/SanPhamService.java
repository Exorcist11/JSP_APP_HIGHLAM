package com.example.tshirt_luxury_datn.services;

import com.example.tshirt_luxury_datn.dto.SanPhamDTO;
import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SanPhamService {
    @Autowired
    private sanPhamRepository sanPhamRepository;

    public SanPhamDTO getSanPhamByID(Integer idSanPham) {
        try {
            Optional<SanPham> optionalSanPham = sanPhamRepository.findById(idSanPham);
            if (optionalSanPham.isPresent()) {
                SanPham sp = optionalSanPham.get();
                return new SanPhamDTO(
                        sp.getId(),
                        sp.getMaSanPham(),
                        sp.getTenSanPham(),
                        sp.getTrangThai(),
                        sp.getMoTa(),
                        sp.getSanPhamChiTietList());
            }
            return null;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
