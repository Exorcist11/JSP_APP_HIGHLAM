package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.SizeDTO;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.repository.SizeRepository;

@Service
public class SizeService {
    @Autowired
    private SizeRepository sizeRepository;

    public List<Size> getAllSize() {
        return sizeRepository.findAll();
    }

    public Size createSize(SizeDTO sizeDTO) {
        try {
            Optional<Size> existingSize = sizeRepository.findByName(sizeDTO.getName());
            if (existingSize.isPresent()) {
                throw new IllegalArgumentException("Size đã tồn tại!");
            }
            Size size = new Size();
            size.setName(sizeDTO.getName());
            size.setStatus(true);
            size.setDescription(sizeDTO.getDescription());
            return sizeRepository.save(size);
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi thêm size: " + e.getMessage());
        }
    }

    public void updateSize(Long id, SizeDTO sizeDTO) {
        try {
            Optional<Size> optionalSize = sizeRepository.findById(id);
            if (optionalSize.isPresent()) {
                Size size = optionalSize.get();
                size.setName(sizeDTO.getName());
                size.setDescription(sizeDTO.getDescription());
                size.setStatus(sizeDTO.getStatus());
                sizeRepository.save(size);
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi cập nhật size: " + e.getMessage());
        }
    }

    public void deleteSize(Long id) {
        try {
            Optional<Size> size = sizeRepository.findById(id);
            if (size.isPresent()) {
                sizeRepository.deleteById(id);
            } else {
                throw new RuntimeException("Không tìm thấy size với ID: " + id);
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi xóa size: " + e.getMessage());
        }
    }
}
