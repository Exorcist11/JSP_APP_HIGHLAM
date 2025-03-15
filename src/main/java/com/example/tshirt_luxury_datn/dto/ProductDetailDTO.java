package com.example.tshirt_luxury_datn.dto;

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
}
