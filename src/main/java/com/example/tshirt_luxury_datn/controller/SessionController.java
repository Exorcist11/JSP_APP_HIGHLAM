package com.example.tshirt_luxury_datn.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.tshirt_luxury_datn.entity.User;

import jakarta.servlet.http.HttpSession;

@RestController
public class SessionController {
    @GetMapping("/getCurrent")
    public ResponseEntity<?> getCurrentUser(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return ResponseEntity.badRequest().body("Chưa đăng nhập!");
        }

        return ResponseEntity.ok(loggedInUser);
    }

    
}
