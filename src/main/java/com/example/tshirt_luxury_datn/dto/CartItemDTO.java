package com.example.tshirt_luxury_datn.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartItemDTO {
    private Long productDetailId;
    private String productName;
    private Integer quantity;
    private Long sizeID;
    private Long colorID;
    private Long productID;
}
