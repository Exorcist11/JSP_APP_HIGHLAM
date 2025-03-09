package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.dto.DangNhapRequest;
import com.example.tshirt_luxury_datn.entity.NguoiDung;
import com.example.tshirt_luxury_datn.services.NguoiDungService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequestMapping("/t-shirt-luxury")
public class login {
    @Autowired
    private NguoiDungService nguoiDungService;

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("dangNhapRequest", new DangNhapRequest());
        return "NguoiDung/login";
    }

    @PostMapping("/login")
    public String handleLogin(DangNhapRequest request, Model model, HttpSession session) {
        Optional<NguoiDung> nguoiDung = nguoiDungService.dangNhap(request);
        if (nguoiDung.isPresent()) {
            session.setAttribute("nguoiDung", nguoiDung.get());
            return "redirect:/t-shirt-luxury/trang-chu";
        } else {
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng");
            return "NguoiDung/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "BanHang/trang-chu";
    }
}
