package com.example.tshirt_luxury_datn.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.services.CheckoutService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CheckoutController {
  @Autowired
  private CheckoutService checkoutService;

  @PostMapping("/cart/checkout")
  public String processCheckout(OrderDTO request, Model model, HttpSession session) {

    try {
      String resultUrl = checkoutService.processCheckout(request, session);
      if (resultUrl.startsWith("http")) {
        return "redirect:" + resultUrl;
      } else {
        return resultUrl;
      }
    } catch (Exception e) {
      model.addAttribute("errorMessage", "Error during checkout: " + e.getMessage());
      return "BanHang/ban-hang-onl";
    }
  }

  @PostMapping("/order/save")
  public String saveOrder(@RequestBody OrderDTO orderDTO, Model model, HttpSession session) {
    try {
      checkoutService.createOrder(orderDTO, session);
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    return "";
  }

  @GetMapping("/paymentResult")
  public String paymentReturn(@RequestParam Map<String, String> params, Model model) {
    String responseCode = params.get("vnp_ResponseCode");
    String message;

    if ("00".equals(responseCode)) {
      message = "Thanh toán thành công!";
    } else {
      message = "Thanh toán thất bại! Mã lỗi: " + responseCode;
    }

    // Đưa dữ liệu vào model để hiển thị trên JSP
    model.addAttribute("message", message);
    model.addAttribute("transactionId", params.get("vnp_TransactionNo"));
    model.addAttribute("amount", params.get("vnp_Amount"));
    model.addAttribute("orderInfo", params.get("vnp_OrderInfo"));

    return "BanHang/paymentResult"; // Trả về giao diện JSP paymentResult.jsp
  }
}
