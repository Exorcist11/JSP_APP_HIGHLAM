package com.example.tshirt_luxury_datn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.tshirt_luxury_datn.dto.CategoryDTO;
import com.example.tshirt_luxury_datn.dto.CategoryDetailDTO;
import com.example.tshirt_luxury_datn.entity.CategoryDetail;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.CategoryDetailService;
import com.example.tshirt_luxury_datn.services.CategoryService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {
  @Autowired
  private CategoryService categoryService;

  @Autowired
  private CategoryDetailService categoryDetailService;

  @GetMapping
  public String listCategory(Model model, HttpSession session) {
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
      return "redirect:/login";
    }
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

  // Category Detail Service
  @PostMapping("/saveDetail")
  @ResponseBody
  public ResponseEntity<?> saveCategoryDetail(@RequestBody CategoryDetailDTO request) {
    try {
      CategoryDetail detail = categoryDetailService.createCategoryDetail(request);
      return ResponseEntity.ok().body(Map.of(
          "success", true,
          "detail", detail));
    } catch (RuntimeException e) {
      return ResponseEntity.badRequest().body(Map.of(
          "success", false,
          "message", e.getMessage()));
    }
  }

  @GetMapping("/{categoryId}/details")
  @ResponseBody
  public List<CategoryDetailDTO> getCategoryDetails(@PathVariable Long categoryId) {
    return categoryDetailService.getAllCategoryDetail(categoryId);
  }

  @PostMapping("/details/delete/{id}")
  @ResponseBody
  public ResponseEntity<String> deleteCategoryDetail(@PathVariable("id") Long id) {
    try {
      categoryDetailService.deleteCategoryDetail(id);

      return ResponseEntity.ok("Xóa category detail thành công");
    } catch (Exception e) {
      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
          .body("Lỗi khi xóa category detail: " + e.getMessage());
    }
  }

  @PostMapping("/updateDetail")
  @ResponseBody
  public Map<String, Object> updateDetail(@RequestBody CategoryDetailDTO detailDTO) {
    Map<String, Object> response = new HashMap<>();
    try {
      categoryDetailService.updateCategoryDetail(detailDTO);
      response.put("success", true);
    } catch (Exception e) {
      response.put("success", false);
      response.put("message", e.getMessage());
    }
    return response;
  }
}
