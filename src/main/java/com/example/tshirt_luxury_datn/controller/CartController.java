package com.example.tshirt_luxury_datn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.dto.CartItemResponse;
import com.example.tshirt_luxury_datn.entity.Cart;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.CartService;
import com.example.tshirt_luxury_datn.services.ProductDetailService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
    @Autowired
    private CartService cartService;

    @Autowired
    private ProductDetailService productDetailService;

    @PostMapping("/saveCart")
    @ResponseBody // Quan trọng: Giúp trả về JSON thay vì tìm kiếm file JSP
    public ResponseEntity<String> addProductToCart(@RequestBody CartItemDTO cartItemDTO, HttpSession session) {
        try {
            cartService.addToCart(cartItemDTO, session);
            return ResponseEntity.ok("Sản phẩm đã được thêm vào giỏ hàng!"); // Trả về JSON
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Lỗi: " + e.getMessage()); // Trả về lỗi JSON
        }
    }

    @PostMapping("/saveCartBulk")
    @ResponseBody
    public ResponseEntity<String> addProductsToCart(@RequestBody List<CartItemDTO> cartItems, HttpSession session) {
        try {
            for (CartItemDTO item : cartItems) {
                cartService.addToCart(item, session);
            }
            return ResponseEntity.ok("Đã đồng bộ giỏ hàng!");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Lỗi: " + e.getMessage());
        }
    }

    @GetMapping("/getCart")
    @ResponseBody
    public ResponseEntity<?> getCart(HttpSession session) {
        try {
            User loggedInUser = (User) session.getAttribute("loggedInUser");

            if (loggedInUser == null) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Người dùng chưa đăng nhập.");
            }

            List<CartItemResponse> cartItems = cartService.getCartbyClientId(loggedInUser.getId());
            return ResponseEntity.ok(cartItems);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Lỗi: " + e.getMessage());
        }
    }

    @DeleteMapping("/deleteCart")
    @ResponseBody
    public ResponseEntity<?> deleteCart(HttpSession session) {
        try {
            User loggedInUser = (User) session.getAttribute("loggedInUser");

            if (loggedInUser == null) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Người dùng chưa đăng nhập!");
            }

            cartService.deleteCart(loggedInUser);
            return ResponseEntity.ok("Xóa giỏ hàng thành công!");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Lỗi khi xóa giỏ hàng: " + e.getMessage());
        }
    }

    @GetMapping("/cart")
    public String cart(HttpSession session, Model model) {

        return "BanHang/cart";
    }

    @GetMapping("/api/cart")
    @ResponseBody
    public ResponseEntity<?> getCartApi(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Người dùng chưa đăng nhập.");
        }
        List<CartItemResponse> cartItems = cartService.getCartbyClientId(loggedInUser.getId());
        return ResponseEntity.ok(cartItems);
    }

    @PostMapping("/cart/add")
    public String addToCart(
            CartItemDTO cartItemDTO,
            HttpSession session, Model model) {

        ProductDetail productDetail = productDetailService.getProductDetailByProductSizeColor(
                cartItemDTO.getProductID(), cartItemDTO.getSizeID(), cartItemDTO.getColorID());

        if (productDetail != null) {
            cartService.addToCart(cartItemDTO, session);
        }
        Cart cart = cartService.getOrCreateCart(session);
        model.addAttribute("cartItems", cartService.getCartItems(cart));
        model.addAttribute("totalPrice", cartService.caculateTotalUserCart(cart));

        return "redirect:/product?id=" + cartItemDTO.getProductID();
    }

    @PostMapping("/cart/remove")
    public String removeFromCart(@RequestParam("productDetailId") Long productDetailId, HttpSession session,
            Model model, @RequestHeader(value = "referer", required = false) String referer) {
        Cart cart = cartService.getOrCreateCart(session);
        cartService.removeFromCart(cart, productDetailId, session);
     
        // Cập nhật lại dữ liệu cho giao diện
        model.addAttribute("cartItems", cartService.getCartItems(cart));
        model.addAttribute("totalPrice", cartService.caculateTotalUserCart(cart));

        return "redirect:" + (referer != null ? referer : "/product");
    }

}
