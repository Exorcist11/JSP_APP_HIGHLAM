package com.example.tshirt_luxury_datn.dto;

import com.example.tshirt_luxury_datn.entity.Product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDTO {
  private Long id;
  private String name;
  private String code;
  private Double price;
  private Boolean status;
  private Long categoryId;
  private String description;
  private String imgUrl;
  private Integer totalQuantity;

  public ProductDTO(Product product) {
    this.id = product.getId();
    this.name = product.getName();
    this.price = product.getPrice();
    this.code = product.getCode();
    this.status = product.getStatus();
    this.categoryId = product.getCategoryDetail().getId();
    this.description = product.getDescription();
    this.imgUrl = product.getProductDetails().isEmpty()
        ? null
        : product.getProductDetails().get(0).getFirstImageUrl();
        
    this.totalQuantity = product.getProductDetails().stream()
        .mapToInt(pd -> pd.getQuantity() != null ? pd.getQuantity() : 0)
        .sum();
  }

  public ProductDTO() {
  }
}
