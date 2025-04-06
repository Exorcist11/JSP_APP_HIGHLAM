package com.example.tshirt_luxury_datn.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.dto.CartItemResponse;
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

    public List<CartItemResponse> getCartbyClientId(Long userID) {
        try {
            User user = userRepository.findById(userID).orElse(null);
            Cart cart = cartRepository.findByUser(user).orElse(null);
            if (cart == null) {
                return new ArrayList<>();
            }

            List<CartItemResponse> cartItems = cart.getCartItems().stream()
                    .map(cartItem -> new CartItemResponse(
                            cartItem.getProductDetail().getProduct().getName(),
                            cartItem.getProductDetail().getProduct().getPrice(),
                            cartItem.getProductDetail().getProduct().getPrice() * cartItem.getQuantity(),
                            cartItem.getProductDetail().getSize().getName(),
                            cartItem.getProductDetail().getColor().getName(),
                            cartItem.getQuantity(),
                            cartItem.getProductDetail().getProduct().getId(),
                            cartItem.getProductDetail().getSize().getId(),
                            cartItem.getProductDetail().getColor().getId()))
                    .collect(Collectors.toList());

            return cartItems;
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi view cart: " + e.getMessage());
        }
    }

    public void deleteCart(User user) {
        try {
            Optional<Cart> cartU = cartRepository.findByUser(user);
            if (cartU.isPresent()) {
                cartRepository.delete(cartU.get());
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi xóa size: " + e.getMessage());
        }
    }

    public List<CartItemDTO> pos_cartItem(List<CartItem> cart){
        return cart.stream().map(CartItemDTO::new).collect(Collectors.toList());
    }

    public void pos_addToCart(List<CartItem> cart, ProductDetail productDetail) {
        for (CartItem item : cart) {
            if (item.getProductDetail().getCode().equals(productDetail.getCode())) {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }
        cart.add(new CartItem(null, null, productDetail, 1));
    }

    public void pos_updateQuantity(List<CartItem> cart, String code, int quantity) {
        for (CartItem item : cart) {
            if (item.getProductDetail().getCode().equals(code)) {
                item.setQuantity(quantity);
                if (quantity <= 0) {
                    cart.remove(item);
                }
                return;
            }
        }
    }

    public void pos_removeFromCart(List<CartItem> cart, String code) {
        cart.removeIf(item -> item.getProductDetail().getCode().equals(code));
    }

    public double pos_caculateTotal(List<CartItem> cart) {
        return cart.stream()
                .mapToDouble(item -> item.getProductDetail().getProduct().getPrice() * item.getQuantity())
                .sum();
    }
}
