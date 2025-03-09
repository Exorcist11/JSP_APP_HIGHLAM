package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class xemThemController {
    @GetMapping("t-shirt-luxury/xem-them")
    public String xemThem() {
        return "Other/xem-them";
    }
}
