package com.example.tshirt_luxury_datn.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderItemDTO {
  private Long productDetailID;
  private Integer quantity;
  private Double price;
}
