package com.example.tshirt_luxury_datn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.CategoryDetailService;
import com.example.tshirt_luxury_datn.services.ColorService;
import com.example.tshirt_luxury_datn.services.ProductDetailService;
import com.example.tshirt_luxury_datn.services.ProductService;
import com.example.tshirt_luxury_datn.services.SizeService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/products")
public class ProductController {
  @Autowired
  private ProductService productService;

  @Autowired
  private ProductDetailService detailService;

  @Autowired
  private SizeService sizeService;

  @Autowired
  private ColorService colorService;

  @Autowired
  private CategoryDetailService categoryDetailService;

  @GetMapping
  public String listOrSearchProducts(
      @RequestParam(value = "timKiemSanPham", required = false) String timKiemSanPham,
      @RequestParam(value = "trangThai", required = false) Boolean trangThai,
      @RequestParam(value = "productID", required = false) Long productID,
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(defaultValue = "10") int size,
      Model model, HttpSession session) {
        
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
      return "redirect:/login";
    }
    Pageable pageable = PageRequest.of(page, size);

    if (productID != null) {
      // Hiển thị chi tiết sản phẩm
      model.addAttribute("colors", colorService.getAllColor());
      model.addAttribute("sizes", sizeService.getAllSize());
      model.addAttribute("product", productService.getProductByID(productID));

      try {
        List<ProductDetail> lstPD = detailService.getProductDetailByProductId(productID);

        model.addAttribute("lstPD", lstPD);
      } catch (Exception e) {
        model.addAttribute("error", e.getMessage());
        System.out.println("ERROR: " + e.getMessage());
      }
      return "admin/Product/san-pham-admin"; // Sử dụng cùng layout với trang sản phẩm
    }

    // Hiển thị danh sách sản phẩm
    Page<Product> products = (timKiemSanPham == null && trangThai == null)
        ? productService.getAllProduct(pageable)
        : productService.searchProducts(timKiemSanPham, trangThai, pageable);

    model.addAttribute("products", products.getContent());
    model.addAttribute("currentPage", products.getNumber());
    model.addAttribute("totalPages", products.getTotalPages());
    model.addAttribute("totalItems", products.getTotalElements());
    model.addAttribute("pageSize", size);
    model.addAttribute("categories", categoryDetailService.getAllCategoryDetail());
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

  @PostMapping("/detail")
  public String createProductDetail(@ModelAttribute("productDetail") ProductDetailDTO detailDTO,
      @RequestParam("images") List<MultipartFile> images, Model model) {
    try {

      detailService.createProductDetail(detailDTO, images);
      model.addAttribute("successMessage", "Thêm sản phẩm chi tiết thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/products?productID=" + detailDTO.getProductID();
  }

  @PostMapping("/updateDetail/{id}")
  public String updateProductDetail(@PathVariable Long id,
      @ModelAttribute("productDetail") ProductDetailDTO productDetailDTO,
      @RequestParam(value = "images", required = false) MultipartFile image,
      Model model) {
    try {
      detailService.updateProductDetail(id, productDetailDTO, image);
      model.addAttribute("success", "Cập nhật sản phẩm chi tiết thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/products?productID=" + productDetailDTO.getProductID();
  }

  @GetMapping("/deleteProductDetail/{id}")
  public String deleteProductDetail(@PathVariable Long id, Model model) {
    try {
      ProductDetail productDetail = detailService.getProductDetailById(id);
      Long productId = productDetail.getProduct().getId();

      detailService.deleteProductDetail(id);
      model.addAttribute("success", "Xóa sản phẩm chi tiết thành công!");

      return "redirect:/admin/products?productID=" + productId;
    } catch (Exception e) {
      model.addAttribute("error", "Lỗi khi xóa sản phẩm chi tiết: " + e.getMessage());
      return "redirect:/admin/products";
    }
  }

}
