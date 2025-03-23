package com.example.tshirt_luxury_datn.services;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.DiscountDTO;
import com.example.tshirt_luxury_datn.entity.Discount;
import com.example.tshirt_luxury_datn.repository.DiscountRepository;

@Service
public class DiscountService {
    @Autowired
    private DiscountRepository discountRepository;

    public List<Discount> getAllDiscounts() {
        return discountRepository.findAll();
    }

    public Discount createDiscount(DiscountDTO discountDTO) {
        try {
            Optional<Discount> existingDiscount = discountRepository.findByCode(discountDTO.getCode());
            if (existingDiscount.isPresent()) {
                throw new RuntimeException("Discount with ID " + discountDTO.getId() + " already exists.");
            }
            Discount discount = new Discount();
            discount.setCode(discountDTO.getCode());
            discount.setPercentage(discountDTO.getPercentage());
            discount.setStartDate(Timestamp.valueOf(discountDTO.getStartDate()));
            discount.setEndDate(Timestamp.valueOf(discountDTO.getEndDate()));
            discount.setStatus(discountDTO.getStatus());
            return discountRepository.save(discount);
        } catch (Exception e) {
            throw new RuntimeException("Error creating discount:" + e.getMessage());
        }
    }

    public void deleteDiscount(Long id) {
        try {
            Optional<Discount> discount = discountRepository.findById(id);
            if (discount.isPresent()) {
                Discount discountD = discount.get();
                discountD.setStatus(false);
                discountRepository.save(discountD);
            } else {
                throw new RuntimeException("Không tìm thấy size với ID: " + id);
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi xóa size: " + e.getMessage());
        }
    }
}
