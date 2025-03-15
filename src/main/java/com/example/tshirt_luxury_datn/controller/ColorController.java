package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import com.example.tshirt_luxury_datn.dto.ColorDTO;
import com.example.tshirt_luxury_datn.services.ColorService;

@Controller
@RequestMapping("/admin/colors")
public class ColorController {
    @Autowired
    private ColorService colorService;

    @GetMapping
    public String listColors(Model model) {
        model.addAttribute("colors", colorService.getAllColor());
        return "admin/MauSac/mau-sac";
    }

    @PostMapping("/save")
    public String createColor(@ModelAttribute("color") ColorDTO colorDTO, Model model) {
        try {
            colorService.createColor(colorDTO);
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/admin/colors";
    }

    @PostMapping("/update/{id}")
    public String updateColor(@PathVariable Long id, @ModelAttribute("color") ColorDTO colorDTO, Model model) {
        try {
            colorService.updateColor(id, colorDTO);
            model.addAttribute("success", "Cập nhật color thành công!");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/admin/colors";
    }

    @GetMapping("/delete/{id}")
    public String deleteColor(@PathVariable Long id, Model model) {
        try {
            colorService.deleteColor(id);
            model.addAttribute("success", "Xóa color thành công!");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/admin/colors";
    }
}
