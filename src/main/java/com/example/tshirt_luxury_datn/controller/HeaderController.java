package com.example.tshirt_luxury_datn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.dto.CategoryDTO;
import com.example.tshirt_luxury_datn.entity.Cart;
import com.example.tshirt_luxury_datn.services.CartService;
import com.example.tshirt_luxury_datn.services.CategoryService;

import jakarta.servlet.http.HttpSession;

@ControllerAdvice
public class HeaderController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CartService cartService;

    @ModelAttribute("lst_categories")
    public List<CategoryDTO> getCategories() {
        return categoryService.getAllCategoriesWithDetails();
    }

    @ModelAttribute("cartItems")
    public List<CartItemDTO> getCartItems(HttpSession session) {
        Cart cart = cartService.getOrCreateCart(session);
        return cartService.getCartItems(cart);
    }

    @ModelAttribute("totalPrice")
    public double getTotalPrice(HttpSession session) {
        Cart cart = cartService.getOrCreateCart(session);
        return cartService.caculateTotalUserCart(cart);
    }

}
