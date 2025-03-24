package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.Color;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.repository.ColorRepository;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;
import com.example.tshirt_luxury_datn.repository.ProductRepository;
import com.example.tshirt_luxury_datn.repository.SizeRepository;

@Service
public class ProductDetailService {
  @Autowired
  private ProductDetailRepository detailRepository;

  @Autowired
  private ProductRepository productRepository;

  @Autowired
  private SizeRepository sizeRepository;

  @Autowired
  private ColorRepository colorRepository;

  @Autowired
  private ImageService imageService;

  public List<ProductDetail> getProductDetailByProductId(Long productId) {
    List<ProductDetail> details = detailRepository.findByProduct_Id(productId);

    if (details.isEmpty()) {
      throw new RuntimeException("Không tìm thấy ProductDetail cho product_id = " + productId);
    }
    return details;
  }

  public ProductDetail createProductDetail(ProductDetailDTO detailDTO, List<MultipartFile> images) {
    try {
      Optional<Product> productOpt = productRepository.findById(detailDTO.getProductID());
      Optional<Size> sizeOpt = sizeRepository.findById(detailDTO.getSizeID());
      Optional<Color> colorOpt = colorRepository.findById(detailDTO.getColorID());
      if (productOpt.isEmpty() || sizeOpt.isEmpty() || colorOpt.isEmpty()) {
        throw new RuntimeException("Some field is misssing");
      }
      Optional<ProductDetail> exitsingDetail = detailRepository.findByProductIdAndSizeIdAndColorId(
          detailDTO.getProductID(), detailDTO.getSizeID(), detailDTO.getColorID());

      if (exitsingDetail.isPresent()) {
        throw new RuntimeException("Product detail đã tồn tại");
      }

      ProductDetail productDetail = new ProductDetail();
      productDetail.setQuantity(detailDTO.getQuantity());
      productDetail.setStatus(true);
      productDetail.setColor(colorOpt.get());
      productDetail.setSize(sizeOpt.get());
      productDetail.setProduct(productOpt.get());

      ProductDetail savedProductDetail = detailRepository.save(productDetail);

      if (images != null && !images.isEmpty()) {
        for (MultipartFile file : images) {
          imageService.saveImage(file, productDetail);
        }
      }

      return savedProductDetail;
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi thêm product detail: " + e.getMessage());
    }
  }

  public ProductDetail updateProductDetail(Long id, ProductDetailDTO detailDTO) {
    try {
      Optional<ProductDetail> optProductDetail = detailRepository
          .findById(id);
      if (optProductDetail.isEmpty()) {
        throw new RuntimeException("Không tìm thấy product detail với ID: " + optProductDetail.get().getId());
      }
      ProductDetail productDetail = optProductDetail.get();
      productDetail.setQuantity(detailDTO.getQuantity());
      productDetail.setStatus(detailDTO.getStatus());

      return detailRepository.save(productDetail);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi cập nhật product detail: " + e.getMessage());
    }
  }

  public void deleteProductDetail(Long id) {
    try {
      Optional<ProductDetail> productDetailOpt = detailRepository.findById(id);
      if (productDetailOpt.isEmpty()) {
        throw new RuntimeException("Không tìm thấy product detail với ID: " + id);
      }
      detailRepository.deleteById(id);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi xóa product detail: " + e.getMessage());
    }
  }

}
