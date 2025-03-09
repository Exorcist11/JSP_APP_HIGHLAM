package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.dto.DangKyRequest;
import com.example.tshirt_luxury_datn.entity.NguoiDung;
import com.example.tshirt_luxury_datn.services.NguoiDungService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/t-shirt-luxury")
public class register {
    @Autowired
    private NguoiDungService nguoiDungService;

//    @GetMapping("/t-shirt-luxury/register")
//    public String register() {
//        return "NguoiDung/register";
//    }

    @PostMapping("/register")
    public String dangKy(@ModelAttribute("nguoiDung") DangKyRequest request, Model model) {
        try {
            String result = nguoiDungService.dangKy(request);
            model.addAttribute("message", "Đăng ký thành công!");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "NguoiDung/register";
    }

    @GetMapping("/register")
    public String showForm(Model model) {
        model.addAttribute("nguoiDung", new DangKyRequest());
        return "NguoiDung/register";
    }
}
