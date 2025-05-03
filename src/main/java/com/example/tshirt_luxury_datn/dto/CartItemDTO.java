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
    private String imageUrl;
    private ProductDetail productDetail;

    public CartItemDTO() {
    }

    public CartItemDTO(CartItem item) {
        if (item != null && item.getProductDetail() != null) {
            ProductDetail pd = item.getProductDetail();
            this.productDetail = pd;
            this.productDetailCode = pd.getCode();
            this.productDetailId = pd.getId();

            if (pd.getProduct() != null) {
                this.productName = pd.getProduct().getName();
                this.price = pd.getProduct().getPrice();
                this.productID = pd.getProduct().getId();
            }

            if (pd.getSize() != null) {
                this.sizeName = pd.getSize().getName();
                this.sizeID = pd.getSize().getId();
            }

            if (pd.getColor() != null) {
                this.colorName = pd.getColor().getName();
                this.colorID = pd.getColor().getId();
            }

            this.quantity = item.getQuantity();
            this.imageUrl = pd.getImageUrl();
        }
    }
    
}