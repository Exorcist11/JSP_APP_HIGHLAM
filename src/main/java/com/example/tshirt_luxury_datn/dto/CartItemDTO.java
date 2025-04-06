package com.example.tshirt_luxury_datn.dto;

import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.ProductDetail;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartItemDTO {
    private String productDetailCode;
    private Long productDetailId;
    private String productName;
    private Integer quantity;
    private Long sizeID;
    private Long colorID;
    private String sizeName;
    private String colorName;
    private Long productID;
    private Double price;
    private ProductDetail productDetail;

    public CartItemDTO(CartItem item) {
        ProductDetail pd = item.getProductDetail();
        this.productDetailCode = pd.getCode();
        this.productName = pd.getProduct().getName();
        this.sizeName = pd.getSize().getName();
        this.colorName = pd.getColor().getName();
        this.price = pd.getProduct().getPrice();
        this.quantity = item.getQuantity();
    }
}
