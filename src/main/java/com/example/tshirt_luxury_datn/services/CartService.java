package com.example.tshirt_luxury_datn.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.dto.CartItemResponse;
import com.example.tshirt_luxury_datn.entity.Cart;
import com.example.tshirt_luxury_datn.entity.CartItem;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.repository.CartRepository;
import com.example.tshirt_luxury_datn.repository.UserRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductDetailService productDetailService;

    @SuppressWarnings("unchecked")
    @Transactional
    public Cart getOrCreateCart(HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            User user = (User) auth.getPrincipal();
            Cart cart = cartRepository.findByUserId(user.getId());
            if (cart == null) {
                cart = new Cart();
                cart.setUser(user);
                cart.setCartItems(new ArrayList<>());
                cartRepository.save(cart);
            }
            return cart;
        } else {
            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("userCart");

            if (cartItems == null) {
                cartItems = new ArrayList<>();
                session.setAttribute("userCart", cartItems);
            }
            System.out.println("SESSION CART: " + cartItems.size());
            Cart tempCart = new Cart();
            tempCart.setCartItems(cartItems);
            return tempCart;
        }
    }

    @Transactional
    public void addToCart(CartItemDTO request, HttpSession session) {

        try {
            Cart cart = getOrCreateCart(session);
            ProductDetail productDetail = productDetailService.getProductDetailByProductSizeColor(
                    request.getProductID(), request.getSizeID(), request.getColorID());

            List<CartItem> cartItems = cart.getCartItems();
            for (CartItem item : cartItems) {
                ProductDetail pd = item.getProductDetail();

                if (pd.getProduct().getId().equals(request.getProductID())
                        && pd.getSize().getId().equals(request.getSizeID())
                        && pd.getColor().getId().equals(request.getColorID())) {
                    item.setQuantity(item.getQuantity() + request.getQuantity());
                    if (cart.getId() != null) {
                        cartRepository.save(cart);
                    }
                    session.setAttribute("userCart", cartItems);
                    return;
                }

            }

            CartItem newItem = new CartItem();
            newItem.setCart(cart);
            newItem.setProductDetail(productDetail);
            newItem.setQuantity(request.getQuantity());

            cartItems.add(newItem);
            if (cart.getId() != null) {
                cartRepository.save(cart);
            } else {

                session.setAttribute("userCart", cartItems);
            }
        } catch (

        Exception e) {
            throw new RuntimeException("Lỗi khi thêm vào giỏ hàng:" + e.getMessage());
        }
    }

    @Transactional
    public void removeFromCart(Cart cart, Long productDetailId, HttpSession session) {
        try {
            List<CartItem> cartItems = cart.getCartItems();
            if (cartItems != null) {
                cartItems.removeIf(item -> item.getProductDetail().getId().equals(productDetailId));
                if (cart.getId() != null) {
                    cartRepository.save(cart);
                } else {
                    session.setAttribute("userCart", cartItems);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi xóa khỏi giỏ hàng: " + e.getMessage());
        }
    }

    public double caculateTotalUserCart(Cart cart) {
        return cart.getCartItems().stream()
                .mapToDouble(item -> item.getProductDetail().getProduct().getPrice() * item.getQuantity()).sum();
    }

    public List<CartItemDTO> getCartItems(Cart cart) {
        List<CartItemDTO> cartItemDTOs = new ArrayList<>();
        if (cart != null && cart.getCartItems() != null) {
            for (CartItem item : cart.getCartItems()) {
                CartItemDTO dto = new CartItemDTO(item);
                cartItemDTOs.add(dto);
            }
        }
        return cartItemDTOs;
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

    public List<CartItemDTO> pos_cartItem(List<CartItem> cart) {
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

    @SuppressWarnings("unchecked")
    @Transactional
    public void syncCartOnLogin(HttpSession session, User user) {
        List<CartItem> sessionCart = (List<CartItem>) session.getAttribute("userCart");
        Cart dbCart = cartRepository.findByUserId(user.getId());
        if (dbCart == null) {
            dbCart = new Cart();
            dbCart.setUser(user);
            dbCart.setCartItems(new ArrayList<>());
        }

        if (sessionCart != null && !sessionCart.isEmpty()) {
            for (CartItem sessionItem : sessionCart) {
                boolean exits = false;
                for (CartItem dbItem : dbCart.getCartItems()) {
                    if (dbItem.getProductDetail().getId().equals(sessionItem.getProductDetail().getId())) {
                        dbItem.setQuantity(dbItem.getQuantity() + sessionItem.getQuantity());
                        exits = true;
                        break;
                    }
                }

                if (!exits) {
                    sessionItem.setCart(dbCart);
                    dbCart.getCartItems().add(sessionItem);
                }
            }
            session.removeAttribute("userCart");
        }
        cartRepository.save(dbCart);

    }
}
