package com.example.tshirt_luxury_datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequestMapping("/admin/pos")
public class PosController {
    @GetMapping
    public String PointOfSale(Model model) {
        
        return "admin/Pos/pos";
    }

}
