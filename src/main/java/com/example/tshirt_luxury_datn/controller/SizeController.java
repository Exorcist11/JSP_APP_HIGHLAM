package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.tshirt_luxury_datn.dto.SizeDTO;
import com.example.tshirt_luxury_datn.services.SizeService;

@Controller
@RequestMapping("/admin/sizes")
public class SizeController {
    @Autowired
    private SizeService sizeService;

    @GetMapping("")
    public String listSizes(Model model) {
        model.addAttribute("sizes", sizeService.getAllSize());
        return "admin/Size/size";
    }

    @PostMapping("/save")
    public String createSize(@ModelAttribute("size") SizeDTO sizeDTO, Model model) {
        try {
            sizeService.createSize(sizeDTO);
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/admin/sizes";
    }

    @PostMapping("/update/{id}")
    public String updateSize(@PathVariable Long id, @ModelAttribute("size") SizeDTO sizeDTO, Model model) {
        try {
            sizeService.updateSize(id, sizeDTO);
            model.addAttribute("success", "Cập nhật size thành công!");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/admin/sizes";
    }

    @GetMapping("/delete/{id}")
    public String deleteSize(@PathVariable Long id, Model model) {
        try {
            sizeService.deleteSize(id);
            model.addAttribute("success", "Xóa size thành công!");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/admin/sizes";
    }
}
