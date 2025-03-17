package com.example.tshirt_luxury_datn.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartDTO {
    private Long userId;
    private List<CartItemDTO> cartItems;
}
