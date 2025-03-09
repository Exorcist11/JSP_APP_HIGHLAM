package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.hoaDonChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class hoaDonChiTietController {
    @Autowired
    hoaDonChiTietRepository hoaDonChiTietRepo;

    @GetMapping("/t-shirt-luxury/admin/hoa-don-chi-tiet")
    public String hoaDonChiTietAdmin(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("listHDCTTaiQuay", hoaDonChiTietRepo.getHoaDonChiTietByIdHoaDon(id));
        return "HoaDonChiTiet/hoa-don-chi-tiet-admin";
    }

}
