package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class nguoiDungChiTietController {
    @GetMapping("/t-shirt-luxury/admin/nguoi-dung-chi-tiet")
    public String nguoiDungChiTiet() {
        return "NguoiDungChiTiet/nguoi-dung-chi-tiet-admin";
    }
}
