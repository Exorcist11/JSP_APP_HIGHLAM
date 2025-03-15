package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.ProductDTO;
import com.example.tshirt_luxury_datn.entity.Category;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.repository.CategoryRepository;
import com.example.tshirt_luxury_datn.repository.ProductRepository;

@Service
public class ProductService {
  @Autowired
  private ProductRepository productRepository;

  @Autowired
  private CategoryRepository categoryRepository;

  public List<Product> getAllProduct() {
    return productRepository.findAll();
  }

  public List<Product> searchProducts(String timKiemSanPham, Boolean trangThai) {
    return productRepository.searchProducts(timKiemSanPham, trangThai);
  }

  public Product getProductByID(Long id) {
    return productRepository.findById(id).orElse(null);
  }

  public Product createProduct(ProductDTO productDTO) {
    try {
      Optional<Category> categoryOpt = categoryRepository.findById(productDTO.getCategoryId());
      if (categoryOpt.isEmpty()) {
        throw new RuntimeException("Category not found");
      }

      Product product = new Product();
      product.setName(productDTO.getName());
      product.setStatus(true);
      product.setDescription(productDTO.getDescription());
      product.setPrice(productDTO.getPrice());
      product.setCategory(categoryOpt.get());
      return productRepository.save(product);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi thêm product: " + e.getMessage());
    }
  }

  public void updateProduct(Long id, ProductDTO productDTO) {
    try {

    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi cập nhật product: " + e.getMessage());
    }
  }

  public void deleteProduct(Long id) {
    try {
      // Optional<Product> color = pro.findById(id);
      // if (color.isPresent()) {
      // colorRepository.deleteById(id);
      // } else {
      // throw new RuntimeException("Không tìm thấy color với ID: " + id);
      // }
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi xóa color: " + e.getMessage());
    }
  }
}
