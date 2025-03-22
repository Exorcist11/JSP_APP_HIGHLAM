package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.tshirt_luxury_datn.dto.CategoryDTO;
import com.example.tshirt_luxury_datn.services.CategoryService;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {
  @Autowired
  private CategoryService categoryService;

  @GetMapping
  public String listCategory(Model model) {
    model.addAttribute("categories", categoryService.getAllCategory());
    return "admin/Categories/danh-muc-admin";
  }

  @PostMapping("/save")
  public String createCategory(@ModelAttribute("category") CategoryDTO categoryDTO, Model model) {
    try {
      categoryService.createCategory(categoryDTO);
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/categories";
  }

  @PostMapping("/update/{id}")
  public String updateCategory(@PathVariable Long id, @ModelAttribute("category") CategoryDTO categoryDTO,
      Model model) {
    try {
      categoryService.updateCategory(id, categoryDTO);
      model.addAttribute("success", "Cập nhật category thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/categories";
  }

  @GetMapping("/delete/{id}")
  public String deleteCategory(@PathVariable Long id, Model model) {
    try {
      categoryService.deleteCategory(id);
      model.addAttribute("success", "Xóa category thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/categories";
  }
}
