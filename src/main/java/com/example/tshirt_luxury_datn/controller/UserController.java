package com.example.tshirt_luxury_datn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tshirt_luxury_datn.dto.UserDTO;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/admin/user")
public class UserController {
  @Autowired
  private UserService userService;

  @GetMapping
  public String listUser(@RequestParam(name = "keyword", required = false) String keyword, Model model,
      HttpSession session) {
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {
      return "redirect:/login";
    }
    List<User> users = userService.searchUsers(keyword);
    model.addAttribute("listUser", users);
    model.addAttribute("keyword", keyword);
    return "NguoiDung/nguoi-dung-admin";
  }

  @PostMapping("/post")
  public String createUser(UserDTO userDTO) {
    try {
      userService.createUser(userDTO);
      return "redirect:/admin/user";
    } catch (Exception e) {
      throw new RuntimeException("Error create user: " + e.getMessage());
    }
  }

  @PostMapping("/update/{id}")
  public String updateUser(@PathVariable Long id, UserDTO userDTO) {
    try {
      userService.updateUser(id, userDTO);
      return "redirect:/admin/user";
    } catch (Exception e) {
      throw new RuntimeException("Error create user: " + e.getMessage());
    }
  }

  @GetMapping("/delete/{id}")
  public String deleteUser(@PathVariable Long id, Model model) {
    try {
      userService.deleteUser(id);
      model.addAttribute("success", "Xóa user thành công!");
    } catch (Exception e) {
      model.addAttribute("error", e.getMessage());
    }
    return "redirect:/admin/user";
  }

}
