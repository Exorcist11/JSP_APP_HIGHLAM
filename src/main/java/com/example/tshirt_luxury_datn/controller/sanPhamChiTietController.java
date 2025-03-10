package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.repository.sanPhamChiTietRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class sanPhamChiTietController {

    @Autowired
    sanPhamChiTietRepository sanPhamChiTietRepo;



        @GetMapping("t-shirt-luxury/san-pham-chi-tiet")
        public String SanPhamChiTiet(Model model, HttpSession session) {

            Integer idSP = (Integer) session.getAttribute("idSPDetail");
            model.addAttribute("sauSac",sanPhamChiTietRepo.findMauSacBySanPhamId(idSP));

            return "SanPhamChiTiet/san-pham-chi-tiet";
        }





}
