package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.services.CheckoutService;

@Controller
public class CheckoutController {
  @Autowired
  private CheckoutService checkoutService;

  @PostMapping("/order/save")
  public String saveOrder(@RequestBody OrderDTO orderDTO, Model model) {
    try {
      checkoutService.createOrder(orderDTO);
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    return "";
  }
}
