package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.ChatLieu;
import com.example.tshirt_luxury_datn.entity.DanhMuc;
import com.example.tshirt_luxury_datn.repository.chatLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class chatLieuController {

    @Autowired
    chatLieuRepository chatLieuRepository;

//    @GetMapping("t-shirt-luxury/admin/chat-lieu")
//    public String chatLieu() {
//        return "ChatLieu/chat-lieu";
//    }

    @GetMapping("t-shirt-luxury/admin/chat-lieu")
    public String chatLieuHienThi(Model model) {
        model.addAttribute("chatLieu", chatLieuRepository.findAll());
        return "ChatLieu/chat-lieu";
    }

    @GetMapping("t-shirt-luxury/admin/chat-lieu/delete")
    public String chatLieuDelete(@RequestParam("id") Integer id) {
        chatLieuRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/chat-lieu";
    }

    @PostMapping("t-shirt-luxury/admin/chat-lieu/add")
    public String chatLieuAdd(@ModelAttribute("chatLieu") ChatLieu chatLieu) {
        chatLieu.setNgayTao(new Date());
        chatLieu.setNgaySua(new Date());
        chatLieuRepository.save(chatLieu);
        return "redirect:/t-shirt-luxury/admin/chat-lieu";
    }

    @GetMapping("t-shirt-luxury/admin/chat-lieu/getOne")
    public String chatLieuGetOne(@RequestParam("id") Integer id, Model model) {
        ChatLieu chatLieu = chatLieuRepository.getOne(id);
        model.addAttribute("chatLieu", chatLieu);
        return "ChatLieu/sua-chat-lieu";
    }

    @PostMapping("t-shirt-luxury/admin/chat-lieu/update")
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
