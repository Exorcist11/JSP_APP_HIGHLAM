package com.example.tshirt_luxury_datn.controller;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tshirt_luxury_datn.entity.Color;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.services.ProductService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ClientController {
  @Autowired
  private ProductService productService;

  @GetMapping
  public String homepage(Model model) {
    // model.addAttribute("sanPhamList", productService.getAllProduct());
    return "BanHang/trang-chu";
  }

  @GetMapping("/product")
  public String detailProduct(@RequestParam Long id, Model model) {
    try {
      Product product = productService.getProductByID(id);
      Set<Size> uniqueSizes = product.getProductDetails().stream()
          .map(ProductDetail::getSize)
          .collect(Collectors.toSet());

      Set<Color> uniqueColors = product.getProductDetails().stream()
          .map(ProductDetail::getColor)
          .collect(Collectors.toSet());

      model.addAttribute("product", productService.getProductByID(id));
      model.addAttribute("sizes", uniqueSizes);
      model.addAttribute("colors", uniqueColors);

      ObjectMapper objectMapper = new ObjectMapper();
      String productDetailsJson = objectMapper.writeValueAsString(product.getProductDetails());
      if (product.getProductDetails() == null || product.getProductDetails().isEmpty()) {
        throw new RuntimeException("Danh sách productDetails rỗng hoặc null");
      }
      model.addAttribute("productDetailsJson", productDetailsJson);
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "SanPhamChiTiet/san-pham-chi-tiet";
  }

  @GetMapping("/cart/checkout")
  public String checkoutCart(Model mode){
    return "BanHang/ban-hang-onl";
  }
}
