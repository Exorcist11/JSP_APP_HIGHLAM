package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class aoNamController {
    @GetMapping("t-shirt-luxury/ao-nam")
    public String aoNam() {
        return "DanhMuc/ao-nam";
    }
}
