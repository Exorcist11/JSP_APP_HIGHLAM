package com.example.tshirt_luxury_datn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.CartService;
import com.example.tshirt_luxury_datn.services.ProductDetailService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class SessionController {
    @Autowired
    private CartService cartService;

    @Autowired
    private ProductDetailService productDetailService;

    @GetMapping("/api/product-details/by-product-code/{productCode}")
    public ResponseEntity<List<ProductDetailDTO>> getProductDetailsByProductCode(@PathVariable String productCode) {
        List<ProductDetailDTO> productDetails = productDetailService.getProductDetailsByProductCode(productCode);
        return ResponseEntity.ok(productDetails);
    }

    @GetMapping("/getCurrent")
    public ResponseEntity<?> getCurrentUser(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return ResponseEntity.badRequest().body("Chưa đăng nhập!");
        }

        return ResponseEntity.ok(loggedInUser);
    }

    @PostMapping("/api/updateCart")
    public ResponseEntity<String> updateCartItemQuantity(@RequestParam String code, @RequestParam Integer quantity,
            HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            cartService.updateCartItemQuantity(code, quantity, loggedInUser);
        } else {
            List<CartItem> cart = (List<CartItem>) session.getAttribute("userCart");
            cartService.pos_updateQuantity(cart, code, quantity);
            session.setAttribute("userCart", cart);
        }

        return ResponseEntity.ok("ok");
    }

}
