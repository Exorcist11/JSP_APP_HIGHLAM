package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.CategoryDTO;
import com.example.tshirt_luxury_datn.dto.CategoryDetailDTO;
import com.example.tshirt_luxury_datn.entity.Category;
import com.example.tshirt_luxury_datn.entity.CategoryDetail;
import com.example.tshirt_luxury_datn.repository.CategoryDetailRepository;
import com.example.tshirt_luxury_datn.repository.CategoryRepository;

@Service
public class CategoryDetailService {
    @Autowired
    private CategoryDetailRepository categoryDetailRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    public List<CategoryDetail> getAllCategoryDetail() {
        return categoryDetailRepository.findAll();
    }

    public List<CategoryDetailDTO> getAllCategoryDetail(Long id) {
        List<CategoryDetail> list = categoryDetailRepository.findByCategoryId(id);
        return list.stream()
                .map(cd -> new CategoryDetailDTO(cd))
                .collect(Collectors.toList());
    }

    public CategoryDetail createCategoryDetail(CategoryDetailDTO request) {
        try {
            Optional<Category> category = categoryRepository.findById(request.getCategoryId());
            if (category.isEmpty()) {
                throw new RuntimeException("Not found Category ID: " + request.getCategoryId());
            }
            CategoryDetail categoryDetail = new CategoryDetail();
            categoryDetail.setName(request.getName());
            categoryDetail.setStatus(true);
            categoryDetail.setCategory(category.get());
            return categoryDetailRepository.save(categoryDetail);
        } catch (Exception e) {
            throw new RuntimeException("Error when create category detail: " + e.getMessage());
        }
    }

    public List<CategoryDTO> getAllCategoriesWithDetails() {
        List<Category> categories = categoryRepository.findAll();
        return categories.stream().map(category -> {
            CategoryDTO categoryDTO = new CategoryDTO();
            categoryDTO.setId(category.getId());
            categoryDTO.setName(category.getName());
            // Chuyển đổi danh sách CategoryDetail sang CategoryDetailDTO
            List<CategoryDetailDTO> detailDTOs = category.getCategoryDetails().stream().map(detail -> {
                CategoryDetailDTO detailDTO = new CategoryDetailDTO();
                detailDTO.setId(detail.getId());
                detailDTO.setName(detail.getName());
                return detailDTO;
            }).collect(Collectors.toList());
            categoryDTO.setCategoryDetails(detailDTOs);
            return categoryDTO;
        }).collect(Collectors.toList());
    }

    public String getCategoryNameById(Long id) {
        Optional<CategoryDetail> categoryDetail = categoryDetailRepository.findById(id);
        if (categoryDetail.isPresent()) {
            return categoryDetail.get().getName();
        } else {
            throw new RuntimeException("Không tìm thấy category detail với ID: " + id);
        }
    }

    public void deleteCategoryDetail(Long id) {
        try {
            Optional<CategoryDetail> c = categoryDetailRepository.findById(id);
            if (!c.isPresent()) {
                throw new RuntimeException("Không tìm thấy category detail với ID: " + id);
            } else {
                CategoryDetail categoryDetail = c.get();
                categoryDetail.setStatus(false);
                categoryDetailRepository.save(categoryDetail);
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi xóa category detail: " + e.getMessage());
        }
    }

    public void updateCategoryDetail(CategoryDetailDTO categoryDetailDTO) {
        try {
            CategoryDetail categoryDetail = categoryDetailRepository.findById(categoryDetailDTO.getId()).get();
            categoryDetail.setName(categoryDetailDTO.getName());
            categoryDetail.setStatus(categoryDetailDTO.getStatus());
            categoryDetailRepository.save(categoryDetail);
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi cập nhật category detail: " + e.getMessage());
        }
    }
}
