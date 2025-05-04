package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.tshirt_luxury_datn.dto.DiscountDTO;
import com.example.tshirt_luxury_datn.entity.Discount;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.DiscountService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DiscountController {
    @Autowired
    private DiscountService discountService;

    @GetMapping("/admin/discount")
    public String listDiscount(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        model.addAttribute("discounts", discountService.getAllDiscounts());
        return "admin/Discounts/discount";
    }

    @PostMapping("/admin/discount/save")
    public String createDiscount(DiscountDTO discountDTO) {
        try {
            discountService.createDiscount(discountDTO);
        } catch (Exception e) {
            throw new RuntimeException("Error controller creating discount: " + e.getMessage());
        }

        return "redirect:/admin/discount";
    }

    @PostMapping("/admin/discount/update")
    public String updateDiscount(@ModelAttribute DiscountDTO discountDTO) {
        discountService.updateDiscount(discountDTO);
        return "redirect:/admin/discount";
    }

    @GetMapping("/admin/discount/delete/{id}")
    public String deleteDiscount(@PathVariable Long id, Model model) {
        try {
            discountService.deleteDiscount(id);
            model.addAttribute("success", "Xóa discount thành công!");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/admin/discount";
    }

    @GetMapping("/api/applyCoupon")
    @ResponseBody
    public ResponseEntity<DiscountDTO> getCoupon(@RequestParam String code) {
        Discount discount = discountService.getActiveDiscountByCode(code);
        DiscountDTO response = new DiscountDTO();
        response.setId(discount.getId());
        response.setCode(discount.getCode());
        response.setPercentage(discount.getPercentage());
        response.setStatus(discount.getStatus());

        return ResponseEntity.ok(response);
    }

}
