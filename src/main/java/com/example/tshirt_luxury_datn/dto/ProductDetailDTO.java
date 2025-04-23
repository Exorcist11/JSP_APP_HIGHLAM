package com.example.tshirt_luxury_datn.dto;

import com.example.tshirt_luxury_datn.entity.ProductDetail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDetailDTO {
  private Integer quantity;
  private Boolean status;
  private Long colorID;
  private Long productID;
  private Long sizeID;
  private String code;
  private Double price;
  private String productName;
  private String sizeName;
  private String colorName;
  private String imageUrl;
  private Long id;
  

  public ProductDetailDTO(ProductDetail pd) {
    this.id = pd.getId();
    this.code = pd.getCode();
    this.productName = pd.getProduct().getName();
    this.sizeName = pd.getSize().getName();
    this.colorName = pd.getColor().getName();
    this.quantity = pd.getQuantity();
  }

  public ProductDetailDTO() {

  }
}
