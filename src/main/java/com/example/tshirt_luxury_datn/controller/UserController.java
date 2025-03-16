package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.tshirt_luxury_datn.services.UserService;

@Controller
@RequestMapping("/admin/user")
public class UserController {
  @Autowired
  private UserService userService;

  @GetMapping
  public String listUser(Model model) {
    model.addAttribute("listUser", userService.getListUser());
    return "NguoiDung/nguoi-dung-admin";
  }
}
