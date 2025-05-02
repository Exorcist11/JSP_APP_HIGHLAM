package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.CategoryDTO;
import com.example.tshirt_luxury_datn.entity.Category;
import com.example.tshirt_luxury_datn.repository.CategoryRepository;

@Service
public class CategoryService {
  @Autowired
  private CategoryRepository categoryRepository;

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

}
