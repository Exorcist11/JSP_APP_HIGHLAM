package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class login {
    @GetMapping("/t-shirt-luxury/login")
    public String login(){
        return "NguoiDung/login";
    }
}
