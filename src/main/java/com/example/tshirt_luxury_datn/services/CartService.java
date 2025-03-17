package com.example.tshirt_luxury_datn.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.entity.Cart;
import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.repository.CartItemsRepository;
import com.example.tshirt_luxury_datn.repository.CartRepository;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;
import com.example.tshirt_luxury_datn.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartItemsRepository cartItemsRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductDetailRepository productDetailRepository;

    public Cart getOrCreateCart(Long userID) {
        User user = userRepository.findById(userID).orElseThrow(() -> new RuntimeException("User không tồn tại!"));

        return cartRepository.findByUser(user).orElseGet(() -> {
            Cart newCart = new Cart();
            newCart.setUser(user);
            return cartRepository.save(newCart);
        });
    }

    public void addToCart(CartItemDTO request, HttpSession session) {
        try {
            User loggedInUser = (User) session.getAttribute("loggedInUser");
            Cart cart = getOrCreateCart(loggedInUser.getId());
            ProductDetail productDetail = productDetailRepository
                    .findByProductIdAndSizeIdAndColorId(request.getProductID(), request.getSizeID(),
                            request.getColorID())
                    .orElseThrow(() -> new RuntimeException("Sản phẩm không tồn tại!"));

            Optional<CartItem> existingItem = cart.getCartItems().stream()
                    .filter(item -> item.getProductDetail().getId().equals(productDetail.getId())).findFirst();

            if (existingItem.isPresent()) {
                existingItem.get().setQuantity(existingItem.get().getQuantity() + request.getQuantity());
                cartItemsRepository.save(existingItem.get());
            } else {
                CartItem cartItem = new CartItem();
                cartItem.setCart(cart);
                cartItem.setProductDetail(productDetail);
                cartItem.setQuantity(request.getQuantity());
                cartItemsRepository.save(cartItem);
            }

        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi tạo cart: " + e.getMessage());
        }
    }
}
