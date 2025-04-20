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
public class CategoryService {
  @Autowired
  private CategoryRepository categoryRepository;

  @Autowired
  private CategoryDetailRepository categoryDetailRepository;

  public List<Category> getAllCategory() {
    return categoryRepository.findAll();
  }

  public Category createCategory(CategoryDTO categoryDTO) {
    try {
      Category category = new Category();
      category.setName(categoryDTO.getName());
      category.setStatus(true);
      return categoryRepository.save(category);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi thêm category: " + e.getMessage());
    }
  }

  public void updateCategory(Long id, CategoryDTO categoryDTO) {
    try {
      Optional<Category> optionalCategory = categoryRepository.findById(id);
      if (optionalCategory.isPresent()) {
        Category category = optionalCategory.get();
        category.setName(categoryDTO.getName());
        category.setStatus(categoryDTO.getStatus());
        categoryRepository.save(category);
      }
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi cập nhật category: " + e.getMessage());
    }
  }

  public void deleteCategory(Long id) {
    try {
      Optional<Category> category = categoryRepository.findById(id);
      if (category.isPresent()) {
        Category categoryDelete = category.get();
        categoryDelete.setStatus(false);
        categoryRepository.save(categoryDelete);
      } else {
        throw new RuntimeException("Không tìm thấy category với ID: " + id);
      }
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi xóa category: " + e.getMessage());
    }
  }

  // Category Deatail

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
}
