package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.dto.ChatLieuDTO;
import com.example.tshirt_luxury_datn.entity.ChatLieu;
import com.example.tshirt_luxury_datn.repository.chatLieuRepository;
import com.example.tshirt_luxury_datn.services.ChatLieuService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
@RequestMapping("/t-shirt-luxury/admin/chat-lieu")
public class chatLieuController {

    @Autowired
    chatLieuRepository chatLieuRepository;

    @Autowired
    ChatLieuService chatLieuService;

    @GetMapping("")
    public String chatLieuHienThi(Model model) {
        model.addAttribute("chatLieu", chatLieuRepository.findAll());
        return "ChatLieu/chat-lieu";
    }

    @GetMapping("/delete")
    public String chatLieuDelete(@RequestParam("id") Integer id) {
        chatLieuRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/chat-lieu";
    }

    @PostMapping("/add")
    public String chatLieuAdd(@ModelAttribute("chatLieu") ChatLieuDTO chatLieu, Model model) {
        try {
            chatLieuService.taoChatLieu(chatLieu);
            model.addAttribute("message", "Taọ mới chất liệu thành công!");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/t-shirt-luxury/admin/chat-lieu";
    }

    @GetMapping("/getOne")
    public String chatLieuGetOne(@RequestParam("id") Integer id, Model model) {
        ChatLieu chatLieu = chatLieuRepository.getOne(id);
        model.addAttribute("chatLieu", chatLieu);
        return "ChatLieu/sua-chat-lieu";
    }

    @PostMapping("/update")
    public String updateChatLieu(@RequestParam("id") Integer id, @ModelAttribute("chatLieu") ChatLieu chatLieu) {
        ChatLieu getOne = chatLieuRepository.getReferenceById(id);
        if (getOne.getId() == id) {
            Date ngaySua = new Date();
            chatLieu.setId(id);
            chatLieu.setNgaySua(ngaySua);
            chatLieu.setNgayTao(getOne.getNgayTao());
            chatLieuRepository.save(chatLieu);
        }
        return "redirect:/t-shirt-luxury/admin/chat-lieu";
    }
}
