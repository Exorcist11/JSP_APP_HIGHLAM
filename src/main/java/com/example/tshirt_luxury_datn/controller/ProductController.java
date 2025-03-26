package com.example.tshirt_luxury_datn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.tshirt_luxury_datn.dto.ProductDTO;
import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.services.CategoryService;
import com.example.tshirt_luxury_datn.services.ColorService;
import com.example.tshirt_luxury_datn.services.ProductDetailService;
import com.example.tshirt_luxury_datn.services.ProductService;
import com.example.tshirt_luxury_datn.services.SizeService;

@Controller
@RequestMapping("/admin/products")
public class ProductController {
  @Autowired
  private ProductService productService;

  @Autowired
  private CategoryService categoryService;

  @Autowired
  private ProductDetailService detailService;

  @Autowired
  private SizeService sizeService;

  @Autowired
  private ColorService colorService;



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

  @PostMapping("/update/{id}")
  public String updateProduct(@PathVariable Long id, @ModelAttribute("product") ProductDTO productDTO, Model model) {
    try {
      productService.updateProduct(id, productDTO);
      model.addAttribute("success", "Cập nhật size thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/products";
  }

  @GetMapping("/delete/{id}")
  public String deleteProduct(@PathVariable Long id, Model model) {
    try {
      productService.deleteProduct(id);
      model.addAttribute("success", "Xóa product thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/products";
  }

  // Action cho sản phẩm chi tiết
  @GetMapping("/{productId}")
  public String getProductDetails(@PathVariable Long productId, Model model) {
    model.addAttribute("colors", colorService.getAllColor());
    model.addAttribute("sizes", sizeService.getAllSize());
    model.addAttribute("product", productService.getProductByID(productId));
    
    try {
      List<ProductDetail> lstPD = detailService.getProductDetailByProductId(productId);
      model.addAttribute("lstPD", lstPD);
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "admin/Product/san-pham-chi-tiet-admin";
  }

  @PostMapping("/{productId}")
  public String createProductDetail(@ModelAttribute("productDetail") ProductDetailDTO detailDTO,
      @RequestParam("images") List<MultipartFile> images, Model model,
      @PathVariable Long productId) {
    try {
      detailService.createProductDetail(detailDTO, images);
      model.addAttribute("successMessage", "Thêm sản phẩm chi tiết thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/products/" + productId;
  }

  @PostMapping("/updateDetail/{id}")
  public String updateProductDetail(@PathVariable Long id,
      @ModelAttribute("productDetail") ProductDetailDTO productDetailDTO, Model model) {
    try {
      detailService.updateProductDetail(id, productDetailDTO);
      model.addAttribute("success", "Cập nhật size thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/products/" + productDetailDTO.getProductID();
  }

  @GetMapping("/deleteProductDetail/{id}")
  public String deleteProductDetail(@PathVariable Long id, Model model) {
    try {
      detailService.deleteProductDetail(id);
      model.addAttribute("success", "Xóa product thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/products";
  }

}
