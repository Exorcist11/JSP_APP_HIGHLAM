package com.example.tshirt_luxury_datn.dto;

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
}
