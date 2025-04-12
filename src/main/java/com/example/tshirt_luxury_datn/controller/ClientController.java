package com.example.tshirt_luxury_datn.controller;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.dto.UserDTO;
import com.example.tshirt_luxury_datn.dto.UserProfileDTP;
import com.example.tshirt_luxury_datn.entity.Cart;
import com.example.tshirt_luxury_datn.entity.Color;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.CartService;
import com.example.tshirt_luxury_datn.services.ImageService;
import com.example.tshirt_luxury_datn.services.OrderService;
import com.example.tshirt_luxury_datn.services.ProductService;
import com.example.tshirt_luxury_datn.services.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class ClientController {
  @Autowired
  private ProductService productService;

  @Autowired
  private UserService userService;

  @Autowired
  private OrderService orderService;

  @Autowired
  private CartService cartService;

  @Autowired
  private ImageService imageService;

  @GetMapping
  public String homepage(Model model, HttpSession session) {

    model.addAttribute("sanPhamList", productService.getLastestProducts());
    return "BanHang/trang-chu";
  }

  @GetMapping("/product")
  public String detailProduct(@RequestParam Long id, Model model, HttpSession session) {
    try {
      Product product = productService.getProductByID(id);
      Set<Size> uniqueSizes = product.getProductDetails().stream()
          .map(ProductDetail::getSize)
          .collect(Collectors.toSet());

      Set<Color> uniqueColors = product.getProductDetails().stream()
          .map(ProductDetail::getColor)
          .collect(Collectors.toSet());

      model.addAttribute("product", productService.getProductByID(id));
      model.addAttribute("sizes", uniqueSizes);
      model.addAttribute("colors", uniqueColors);
      model.addAttribute("images", imageService.getImageUrlsByProductId(id));

      ObjectMapper objectMapper = new ObjectMapper();
      String productDetailsJson = objectMapper.writeValueAsString(product.getProductDetails());
      if (product.getProductDetails() == null || product.getProductDetails().isEmpty()) {
        throw new RuntimeException("Danh sách productDetails rỗng hoặc null");
      }
      model.addAttribute("productDetailsJson", productDetailsJson);
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "SanPhamChiTiet/san-pham-chi-tiet";
  }

  @GetMapping("/cart/checkout")
  public String checkoutCart(Model model, HttpSession session) {
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    List<CartItemDTO> cartItems;

    // if (loggedInUser != null) {
    // Cart cart = cartService.getCartByUserId(loggedInUser.getId());
    // cartItems = cartService.getCartItems(cart);
    // } else {
    Cart cart = cartService.getOrCreateCart(session);
    cartItems = cartService.getCartItems(cart);

    if (cartItems.isEmpty()) {
      model.addAttribute("error", "Giỏ hàng trống!");
    }

    double totalPrice = cartItems.stream()
        .mapToDouble(item -> item.getPrice() * item.getQuantity())
        .sum() + 35000; // Phí vận chuyển

    model.addAttribute("cartItems", cartItems);
    model.addAttribute("totalPrice", totalPrice);

    return "BanHang/ban-hang-onl";
  }

  @GetMapping("/login")
  public String Login(Model model, HttpSession session) {
    User loggedInUser = (User) session.getAttribute("loggedInUser");

    if (loggedInUser != null) {
      return "redirect:/profile";
    }

    return "NguoiDung/login";
  }

  @GetMapping("/register")
  public String register(Model model) {
    return "NguoiDung/register";
  }

  @PostMapping("/register")
  public String saveRegister(@ModelAttribute("register") UserDTO userDTO, RedirectAttributes redirectAttributes) {
    try {
      userService.register(userDTO);
      redirectAttributes.addFlashAttribute("successMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
      return "redirect:/login";
    } catch (IllegalArgumentException e) {
      redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
    } catch (Exception e) {
      redirectAttributes.addFlashAttribute("errorMessage", "Lỗi hệ thống, vui lòng thử lại sau!");
    }
    return "redirect:/register";
  }

  @PostMapping("/login")
  public String actionLogin(@ModelAttribute("login") UserDTO loginDto, RedirectAttributes redirectAttributes,
      HttpSession session) {
    try {
      // Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      User user = userService.login(loginDto);

      cartService.syncCartOnLogin(session, user);

      session.setAttribute("loggedInUser", user);
      return "redirect:/";
    } catch (IllegalArgumentException e) {
      redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
      return "redirect:/login";
    }
  }

  @GetMapping("/logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/trang-chu";
  }

  @GetMapping("/profile")
  public String getProfile(HttpSession session, Model model) {
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
      return "redirect:/login";
    }
    model.addAttribute("profile", userService.getProfile(loggedInUser.getId()));
    return "Profile/profile";
  }

  @GetMapping("/t-shirt-luxury/admin")
  public String abc() {
    return "BanHang/abc";
  }

  @PostMapping("/updateProfile")
  public String saveProfile(HttpSession session, UserProfileDTP userProfileDTP) {
    try {
      User loggedInUser = (User) session.getAttribute("loggedInUser");
      userService.updateProfile(loggedInUser.getId(), userProfileDTP);
    } catch (Exception e) {
      System.out.print(e.getMessage());
    }
    return "redirect:/profile";
  }

  @GetMapping("/ao-nam")
  public String viewAo(Model model) {
    model.addAttribute("listProduct", productService.getAllProduct());
    return "DanhMuc/ao-nam";
  }

  @GetMapping("/history")
  public String getHistory(HttpSession session) {
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
      return "redirect:/login";
    }
    List<Order> orders = orderService.getOrderByUser(loggedInUser.getId());
    session.setAttribute("orders", orders);
    return "Profile/history";
  }

  @GetMapping("/orderDetail")
  public String getOrderDetail(@RequestParam String code, Model model) {
    Order order = orderService.getOrderByCode(code);
    model.addAttribute("order", order);
    model.addAttribute("orderItems",
        orderService.getOrderItemsByOrderId(order.getId()));
    return "Profile/orderDetail";
  }
}
