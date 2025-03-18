package com.example.tshirt_luxury_datn.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartItemResponse {
    private String productName;
    private double price;
    private double total;
    private String size;
    private String color;
    private Integer quantity;
}
