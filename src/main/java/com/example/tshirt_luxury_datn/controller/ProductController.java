package com.example.tshirt_luxury_datn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.tshirt_luxury_datn.dto.ProductDTO;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.services.CategoryService;
import com.example.tshirt_luxury_datn.services.ProductService;

@Controller
@RequestMapping("/admin/products")
public class ProductController {
  @Autowired
  private ProductService productService;
  @Autowired
  private CategoryService categoryService;

  @GetMapping
  public String listProduct(Model model) {
    model.addAttribute("products", productService.getAllProduct());
    model.addAttribute("categories", categoryService.getAllCategory());
    return "admin/Product/san-pham-admin";
  }

  @GetMapping("/search")
  public String searchProducts(@RequestParam(value = "timKiemSanPham", required = false) String timKiemSanPham,
      @RequestParam(value = "trangThai", required = false) Boolean trangThai,
      Model model) {
    List<Product> products = productService.searchProducts(timKiemSanPham, trangThai);
    model.addAttribute("products", products);
    model.addAttribute("timKiemSanPham", timKiemSanPham);
    model.addAttribute("trangThai", trangThai);
    return "admin/Product/san-pham-admin";
  }

  @PostMapping("/save")
  public String createProduct(@ModelAttribute ProductDTO productDTO, Model model) {
    try {
      productService.createProduct(productDTO);
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/products";
  }
}
