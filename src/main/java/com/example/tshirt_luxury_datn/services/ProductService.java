package com.example.tshirt_luxury_datn.services;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.ProductDTO;
import com.example.tshirt_luxury_datn.entity.Category;
import com.example.tshirt_luxury_datn.entity.CategoryDetail;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.repository.CategoryDetailRepository;
import com.example.tshirt_luxury_datn.repository.CategoryRepository;
import com.example.tshirt_luxury_datn.repository.ProductRepository;

@Service
public class ProductService {
  @Autowired
  private ProductRepository productRepository;

  @Autowired
  private CategoryRepository categoryRepository;

  @Autowired
  private CategoryDetailRepository categoryDetailRepository;

  private static final Set<String> generatedCodes = new HashSet<>();
  private static final String CODE_PREFIX = "SP";
  private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  private static final Random random = new Random();

  public static String generateCode() {
    String randomPart;
    do {
      StringBuilder sb = new StringBuilder();
      for (int i = 0; i < 5; i++) {
        int randomIndex = random.nextInt(CHARACTERS.length());
        sb.append(CHARACTERS.charAt(randomIndex));
      }
      randomPart = sb.toString();
    } while (generatedCodes.contains(CODE_PREFIX + randomPart));

    String uniqueCode = CODE_PREFIX + randomPart;
    generatedCodes.add(uniqueCode);
    return uniqueCode;
  }

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

      Optional<CategoryDetail> categortDetailOpt = categoryDetailRepository.findById(productDTO.getCategoryId());
      if (categortDetailOpt.isEmpty()) {
        throw new RuntimeException("Category Detail not found");
      }

      Product product = new Product();
      product.setName(productDTO.getName());
      product.setStatus(true);
      product.setDescription(productDTO.getDescription());
      product.setPrice(productDTO.getPrice());
      product.setCategoryDetail(categortDetailOpt.get());
      product.setCode(generateCode());
      return productRepository.save(product);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi thêm product: " + e.getMessage());
    }
  }

  public void updateProduct(Long id, ProductDTO productDTO) {
    try {
      Optional<Product> optProduct = productRepository.findById(id);
      if (optProduct.isEmpty()) {
        throw new RuntimeException("Không tìm thấy product với ID: " + id);
      }

      Optional<CategoryDetail> categortDetailOpt = categoryDetailRepository.findById(productDTO.getCategoryId());
      if (categortDetailOpt.isEmpty()) {
        throw new RuntimeException("Category Detail not found");
      }
      Optional<Category> categoryOpt = categoryRepository.findById(productDTO.getCategoryId());
      if (categoryOpt.isEmpty()) {
        throw new RuntimeException("Không tìm thấy category với ID: " + productDTO.getCategoryId());
      }

      Product p = optProduct.get();
      p.setName(productDTO.getName());
      p.setDescription(productDTO.getDescription());
      p.setPrice(productDTO.getPrice());
      p.setStatus(productDTO.getStatus());
      p.setCategoryDetail(categortDetailOpt.get());
      productRepository.save(p);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi cập nhật product: " + e.getMessage());
    }
  }

  public void deleteProduct(Long id) {
    try {
      Optional<Product> productOtp = productRepository.findById(id);
      if (productOtp.isEmpty()) {
        throw new RuntimeException("Không tìm thấy product với ID: " + id);
      }
      Product p = productOtp.get();
      p.setStatus(false);
      productRepository.save(p);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi xóa color: " + e.getMessage());
    }
  }

  public List<ProductDTO> getLastestProducts() {
    List<Product> products = productRepository.findTop4ByOrderByCreatedAtDesc();
    return products.stream().map(p -> {
      ProductDTO dto = new ProductDTO();
      dto.setId(p.getId());
      dto.setName(p.getName());
      dto.setPrice(p.getPrice());
      dto.setStatus(p.getStatus());
      dto.setCategoryId(p.getCategoryDetail().getId());
      dto.setDescription(p.getDescription());
      dto.setImgUrl(p.getProductDetails().get(0).getFirstImageUrl());
      return dto;
    }).collect(Collectors.toList());
  }
}
