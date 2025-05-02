package com.example.tshirt_luxury_datn.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;
import com.example.tshirt_luxury_datn.repository.UserProfileRepository;
import com.example.tshirt_luxury_datn.services.CartService;
import com.example.tshirt_luxury_datn.services.CategoryDetailService;
import com.example.tshirt_luxury_datn.services.ColorService;
import com.example.tshirt_luxury_datn.services.OrderService;
import com.example.tshirt_luxury_datn.services.ProductService;
import com.example.tshirt_luxury_datn.services.SizeService;
import com.example.tshirt_luxury_datn.services.UserProfileService;
import com.example.tshirt_luxury_datn.services.UserService;
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
  private UserProfileService userProfileService;

  @Autowired
  private UserProfileRepository userProfileRepository;

  @Autowired
  private ProductDetailRepository productDetailRepository;

  @Autowired
  private ColorService colorService;

  @Autowired
  private SizeService sizeService;

  @Autowired
  private CategoryDetailService categoryDetailService;

  @GetMapping
  public String homepage(Model model, HttpSession session) {

    model.addAttribute("sanPhamList", productService.getLastestProducts());
    return "BanHang/trang-chu";
  }

  @GetMapping("/all-products")
  public String getAllProducts(Model model,
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(defaultValue = "10") int size,
      @RequestParam(defaultValue = "createdAt,desc") String sort,
      @RequestParam(required = false) String colors,
      @RequestParam(required = false) String sizes,
      @RequestParam(required = false) Double minPrice,
      @RequestParam(required = false) Double maxPrice) {

    // Xử lý sắp xếp
    Sort sortObj;
    if (sort.equals("price,asc")) {
      sortObj = Sort.by(Sort.Order.asc("price"));
    } else if (sort.equals("price,desc")) {
      sortObj = Sort.by(Sort.Order.desc("price"));
    } else {
      sortObj = Sort.by(Sort.Order.desc("createdAt"));
    }
    Pageable pageable = PageRequest.of(page, size, sortObj);

    // Chuyển colors thành danh sách ID
    List<Long> colorIds = colors != null && !colors.isEmpty()
        ? Arrays.stream(colors.split(","))
            .map(Long::parseLong)
            .collect(Collectors.toList())
        : null;

    // Chuyển sizes thành danh sách ID
    List<Long> sizeIds = sizes != null && !sizes.isEmpty()
        ? Arrays.stream(sizes.split(","))
            .map(Long::parseLong)
            .collect(Collectors.toList())
        : null;

    // Gọi service để lấy danh sách sản phẩm đã lọc
    Page<Product> productPage = productService.getFilteredProducts(pageable, colorIds, sizeIds, minPrice, maxPrice);

    // Chuyển Page<Product> → Page<ProductDTO>
    Page<ProductDTO> productDTOPage = productPage.map(ProductDTO::new);

    // Lấy danh sách màu sắc và kích cỡ
    List<Color> listColor = colorService.getAllColor();
    List<Size> listSize = sizeService.getAllSize();

    // Thêm các thuộc tính vào model
    model.addAttribute("products", productDTOPage.getContent());
    model.addAttribute("currentPage", productDTOPage.getNumber());
    model.addAttribute("totalPages", productDTOPage.getTotalPages());
    model.addAttribute("pageSize", size);
    model.addAttribute("sort", sort);
    model.addAttribute("colors", colors);
    model.addAttribute("sizes", sizes);
    model.addAttribute("minPrice", minPrice);
    model.addAttribute("maxPrice", maxPrice);
    model.addAttribute("listColor", listColor);
    model.addAttribute("listSize", listSize);

    return "BanHang/all-products";
  }

  @GetMapping("/product")
  public String detailProduct(@RequestParam Long id, Model model) {
    Product productEntity = productService.getProductById(id);
    ProductDTO product = new ProductDTO(productEntity);
    model.addAttribute("product", product);

    List<Map<String, Object>> availableSizes = productService.getAvailableSizes(id);
    List<Map<String, Object>> availableColors = productService.getAvailableColors(id);
    model.addAttribute("sizes", availableSizes);
    model.addAttribute("colors", availableColors);

    List<String> images = productService.getProductImages(id);
    model.addAttribute("images", images);
    return "SanPhamChiTiet/san-pham-chi-tiet";
  }

  @GetMapping("/product/quantity")
  @ResponseBody
  public Map<String, Integer> getQuantity(@RequestParam Long productId,
      @RequestParam Long sizeId,
      @RequestParam Long colorId) {
    ProductDetail productDetail = productDetailRepository
        .findByProductIdAndSizeIdAndColorIdAndStatusTrue(productId, sizeId, colorId)
        .orElse(null);

    Map<String, Integer> response = new HashMap<>();
    response.put("quantity", productDetail != null ? productDetail.getQuantity() : 0);
    return response;
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
          .sum();

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
    model.addAttribute("categoryName", categoryDetailService.getCategoryNameById(categoryDetailId));
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
