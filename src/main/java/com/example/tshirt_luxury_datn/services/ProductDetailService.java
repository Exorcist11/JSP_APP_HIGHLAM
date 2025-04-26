package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
  private ProductDetailRepository productDetailRepository;

  @Autowired
  private ProductRepository productRepository;

  @Autowired
  private SizeRepository sizeRepository;

  @Autowired
  private ColorRepository colorRepository;

  @Autowired
  private ImageService imageService;

  public List<ProductDetailDTO> getProductDetailsByProductCode(String productCode) {
    List<ProductDetail> productDetails = productDetailRepository.findByProductCode(productCode);
    return productDetails.stream()
        .map(ProductDetailDTO::new)
        .collect(Collectors.toList());
  }

  public List<ProductDetail> findByProductId(Long productId) {
    return productDetailRepository.findByProductIdAndStatusTrue(productId);
  }

  public List<ProductDetail> getProductDetailByProductId(Long productId) {
    List<ProductDetail> details = productDetailRepository.findByProduct_Id(productId);

    if (details.isEmpty()) {
      throw new RuntimeException("Không tìm thấy ProductDetail cho product_id = " + productId);
    }
    return details;
  }

  public List<ProductDetail> getProductDetailsByProductId(Long productId) {
    return productDetailRepository.findByProductId(productId);
  }

  public Page<ProductDetail> getAllProductDetail(Pageable pageable) {
    try {
      return productDetailRepository.findAll(pageable);
    } catch (Exception e) {
      throw new RuntimeException("ERROR WHEN GET ALL PRODUCT DETAIL: " + e.getMessage());
    }
  }

  public Page<ProductDetail> searchProductDetail(String code, Pageable pageable) {
    try {
      return productDetailRepository.findByCodeContainingIgnoreCase(code, pageable);
    } catch (Exception e) {
      throw new RuntimeException("ERROR WHEN SEARCH PRODUCT DETAIL: " + e.getMessage());
    }
  }

  public ProductDetail getProductDetailById(Long id) {
    return productDetailRepository.findById(id).orElse(null);
  }

  public ProductDetail getProductDetailByCode(String code) {
    Optional<ProductDetail> productDetail = productDetailRepository.findByCode(code);
    return productDetail.orElse(null);
  }

  public ProductDetail createProductDetail(ProductDetailDTO detailDTO, List<MultipartFile> images) {
    try {
      Optional<Product> productOpt = productRepository.findById(detailDTO.getProductID());
      Optional<Size> sizeOpt = sizeRepository.findById(detailDTO.getSizeID());
      Optional<Color> colorOpt = colorRepository.findById(detailDTO.getColorID());
      if (productOpt.isEmpty() || sizeOpt.isEmpty() || colorOpt.isEmpty()) {
        throw new RuntimeException("Some field is misssing");
      }
      Optional<ProductDetail> exitsingDetail = productDetailRepository.findByProductIdAndSizeIdAndColorId(
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
      productDetail.setCode(productOpt.get().getCode() + "S" + sizeOpt.get().getId() + "C" + colorOpt.get().getId());

      ProductDetail savedProductDetail = productDetailRepository.save(productDetail);

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
      Optional<ProductDetail> optProductDetail = productDetailRepository
          .findById(id);
      if (optProductDetail.isEmpty()) {
        throw new RuntimeException("Không tìm thấy product detail với ID: " + optProductDetail.get().getId());
      }
      ProductDetail productDetail = optProductDetail.get();
      productDetail.setQuantity(detailDTO.getQuantity());
      productDetail.setStatus(detailDTO.getStatus());

      return productDetailRepository.save(productDetail);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi cập nhật product detail: " + e.getMessage());
    }
  }

  public void deleteProductDetail(Long id) {
    ProductDetail productDetail = productDetailRepository.findById(id)
        .orElseThrow(() -> new RuntimeException("Không tìm thấy sản phẩm chi tiết với ID: " + id));

    productDetail.setStatus(false);

    productDetailRepository.save(productDetail);
  }

  public void _posUpdateProductDetail(ProductDetail pd) {
    productDetailRepository.save(pd);
  }

  public ProductDetail getProductDetailByProductSizeColor(Long productId, Long sizeId, Long colorId) {
    return productDetailRepository.findByProductIdAndSizeIdAndColorId(productId, sizeId, colorId).orElse(null);
  }

}
