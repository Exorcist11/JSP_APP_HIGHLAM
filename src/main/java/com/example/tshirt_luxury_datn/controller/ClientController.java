package com.example.tshirt_luxury_datn.controller;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.tshirt_luxury_datn.dto.CartItemDTO;
import com.example.tshirt_luxury_datn.dto.ProductDTO;
import com.example.tshirt_luxury_datn.dto.UserDTO;
import com.example.tshirt_luxury_datn.dto.UserProfileDTP;
import com.example.tshirt_luxury_datn.entity.Cart;
import com.example.tshirt_luxury_datn.entity.Color;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.entity.UserProfile;
import com.example.tshirt_luxury_datn.repository.UserProfileRepository;
import com.example.tshirt_luxury_datn.services.CartService;
import com.example.tshirt_luxury_datn.services.ImageService;
import com.example.tshirt_luxury_datn.services.OrderService;
import com.example.tshirt_luxury_datn.services.ProductService;
import com.example.tshirt_luxury_datn.services.UserProfileService;
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

  @Autowired
  private UserProfileService userProfileService;

  @Autowired
  private UserProfileRepository userProfileRepository;

  @GetMapping
  public String homepage(Model model, HttpSession session) {

    model.addAttribute("sanPhamList", productService.getLastestProducts());
    return "BanHang/trang-chu";
  }

  @GetMapping("/all-products")
  public String getAllProducts(Model model,
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(defaultValue = "10") int size) {

    Pageable pageable = PageRequest.of(page, size);
    Page<Product> productPage = productService.getAllProduct(pageable);

    // Chuyển Page<Product> → Page<ProductDTO>
    Page<ProductDTO> productDTOPage = productPage.map(ProductDTO::new);

    model.addAttribute("products", productDTOPage.getContent()); // ✅ Lấy danh sách để hiển thị
    model.addAttribute("currentPage", productDTOPage.getNumber());
    model.addAttribute("totalPages", productDTOPage.getTotalPages());
    model.addAttribute("pageSize", size);

    return "BanHang/all-products";
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

    if (loggedInUser != null) {
      Cart cart = cartService.getCartByUserId(loggedInUser.getId());
      cartItems = cartService.getCartItems(cart);
      List<UserProfile> userProfiles = userProfileRepository.findByUserId(loggedInUser.getId());
      model.addAttribute("userProfiles", userProfiles);
    } else {
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
      model.addAttribute("loggedInUser", loggedInUser);
    }
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
    List<UserProfileDTP> profiles = userProfileService.getUserProfiles(session);
    model.addAttribute("profiles", profiles);
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

  @GetMapping("/category")
  public String getProductsByCategoryOrDetail(
      @RequestParam(value = "categoryId", required = false) Long categoryId,
      @RequestParam(value = "categoryDetailId", required = false) Long categoryDetailId,
      Model model) {

    List<ProductDTO> products;
    if (categoryDetailId != null) {
      // Lấy sản phẩm theo CategoryDetail
      products = productService.getProductsByCategoryDetail(categoryDetailId);
    } else if (categoryId != null) {
      // Lấy sản phẩm theo Category
      products = productService.getProductsByCategory(categoryId);
    } else {
      // Nếu không có tham số, trả về trang mặc định hoặc thông báo lỗi
      products = List.of();
    }

    // Thêm danh sách sản phẩm vào model
    model.addAttribute("products", products);

    return "DanhMuc/san-pham-theo-danh-muc";
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

  @GetMapping("/search")
  public String searchProducts(@RequestParam(required = false) String keyword, Model model) {
    if (keyword != null && !keyword.trim().isEmpty()) {
      List<ProductDTO> products = productService.searchProductsByName(keyword);
      model.addAttribute("products", products);
      model.addAttribute("keyword", keyword);
    }
    return "Other/searchResults";
  }
}
