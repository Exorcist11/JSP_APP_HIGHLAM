package com.example.tshirt_luxury_datn.services;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.ChatLieuDTO;
import com.example.tshirt_luxury_datn.entity.ChatLieu;
import com.example.tshirt_luxury_datn.repository.chatLieuRepository;

@Service
public class ChatLieuService {
    @Autowired
    private chatLieuRepository chatLieuRepository;

    public ChatLieu taoChatLieu(ChatLieuDTO request) {
        try {
            ChatLieu chatLieu = new ChatLieu();
            chatLieu.setMaChatLieu("CL" + UUID.randomUUID().toString().replace("-", "").substring(0, 6).toUpperCase());
            chatLieu.setTenChatLieu(request.getTenChatLieu());
            chatLieu.setMoTa(request.getMoTa());
            chatLieu.setTrangThai(1);
            chatLieu.setNgayTao(new Date());
            chatLieu.setNgaySua(new Date());
            return chatLieuRepository.save(chatLieu);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
