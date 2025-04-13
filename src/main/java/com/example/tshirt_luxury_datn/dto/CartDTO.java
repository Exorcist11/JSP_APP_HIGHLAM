package com.example.tshirt_luxury_datn.dto;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import com.example.tshirt_luxury_datn.entity.Cart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {
    private Long id;
    private Long userId;
    private List<CartItemDTO> cartItems;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public CartDTO(Cart cart) {
        if (cart != null) {
            this.id = cart.getId();
            this.userId = cart.getUser() != null ? cart.getUser().getId() : null;
            this.createdAt = cart.getCreatedAt();
            this.updatedAt = cart.getUpdatedAt();
            this.cartItems = cart.getCartItems() != null ? 
                cart.getCartItems().stream()
                    .map(CartItemDTO::new)
                    .collect(Collectors.toList())
                : Collections.emptyList();
        }
    }
}
