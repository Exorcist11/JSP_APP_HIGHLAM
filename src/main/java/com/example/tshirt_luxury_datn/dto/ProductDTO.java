package com.example.tshirt_luxury_datn.dto;

import com.example.tshirt_luxury_datn.entity.Product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDTO {
  private Long id;
  private String name;
  private Double price;
  private Boolean status;
  private Long categoryId;
  private String description;
  private String imgUrl;

  public ProductDTO(Product product) {
    this.id = product.getId();
    this.name = product.getName();
    this.price = product.getPrice();
    this.status = product.getStatus();
    this.categoryId = product.getCategoryDetail().getId();
    this.description = product.getDescription();
    this.imgUrl = product.getProductDetails().isEmpty()
        ? null
        : product.getProductDetails().get(0).getFirstImageUrl();
  }

  public ProductDTO() {
  }
}
