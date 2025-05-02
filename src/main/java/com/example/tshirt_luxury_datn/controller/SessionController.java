package com.example.tshirt_luxury_datn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.example.tshirt_luxury_datn.dto.ProductDTO;
import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.CartService;
import com.example.tshirt_luxury_datn.services.ProductDetailService;
import com.example.tshirt_luxury_datn.services.ProductService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class SessionController {
    @Autowired
    private CartService cartService;

    @Autowired
    private ProductDetailService productDetailService;

    @Autowired
    private ProductService productService;

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
            @SuppressWarnings("unchecked")
            List<CartItem> cart = (List<CartItem>) session.getAttribute("userCart");
            cartService.pos_updateQuantity(cart, code, quantity);
            session.setAttribute("userCart", cart);
        }

        return ResponseEntity.ok("ok");
    }

    @GetMapping("/api/products/{productId}/inventory")
    public ResponseEntity<List<ProductDetail>> getProductInventory(@PathVariable Long productId) {
        List<ProductDetail> inventory = productDetailService.findByProductId(productId);
        return ResponseEntity.ok(inventory);
    }

    @GetMapping("/api/product/quick-buy")
    public ResponseEntity<Map<String, Object>> getQuickBuyProduct(@RequestParam Long id) {
        try {
            ProductDTO product = new ProductDTO(productService.getProductById(id));
            List<Map<String, Object>> availableSizes = productService.getAvailableSizes(id);
            List<Map<String, Object>> availableColors = productService.getAvailableColors(id);
            List<String> images = productService.getProductImages(id);

            Map<String, Object> response = new HashMap<>();
            response.put("product", product);
            response.put("sizes", availableSizes);
            response.put("colors", availableColors);
            response.put("images", images);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest()
                    .body(Map.of("error", "Không thể tải thông tin sản phẩm: " + e.getMessage()));
        }
    }
}
