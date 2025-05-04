package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.tshirt_luxury_datn.dto.ColorDTO;
import com.example.tshirt_luxury_datn.entity.Color;
import com.example.tshirt_luxury_datn.repository.ColorRepository;

@Service
public class ColorService {
    @Autowired
    private ColorRepository colorRepository;

    public List<Color> getAllColor() {
        return colorRepository.findAll();
    }

    public List<Color> getAllColorStatusTrue() {
        return colorRepository.findByStatusTrue();
    }

    public Color createColor(ColorDTO colorDTO) {
        try {
            Color color = new Color();
            color.setName(colorDTO.getName());
            color.setStatus(true);
            color.setHexColor(colorDTO.getHexColor());
            return colorRepository.save(color);
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi thêm color: " + e.getMessage());
        }
    }

    public void updateColor(Long id, ColorDTO colorDTO) {
        try {
            Optional<Color> optionalColor = colorRepository.findById(id);
            if (optionalColor.isPresent()) {
                Color color = optionalColor.get();
                color.setName(colorDTO.getName());
                color.setStatus(colorDTO.getStatus());
                color.setHexColor(colorDTO.getHexColor());
                colorRepository.save(color);
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi cập nhật color: " + e.getMessage());
        }
    }

    public void deleteColor(Long id) {
        try {
            Optional<Color> color = colorRepository.findById(id);
            if (color.isPresent()) {
                Color colorDelete = color.get();
                colorDelete.setStatus(false);
                colorRepository.save(colorDelete);
            } else {
                throw new RuntimeException("Không tìm thấy color với ID: " + id);
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi xóa color: " + e.getMessage());
        }
    }
}
