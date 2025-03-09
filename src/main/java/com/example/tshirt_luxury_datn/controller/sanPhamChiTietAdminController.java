package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.AnhSanPham;
import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.entity.Size;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.sanPhamChiTietAdminRespone;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class sanPhamChiTietAdminController {
    @Autowired
    sizeRepository sizeRepo;
    @Autowired
    anhSanPhamRepository anhSanPhamRepo;
    @Autowired
    chatLieuRepository chatLieuRepo;
    @Autowired
    mauSacRepository mauSacRepo;
    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;
    @Autowired
    sanPhamRepository sanPhamRepo;


    @ModelAttribute("sanPham")
    public Integer getSanPham(Model model, @RequestParam(name ="id")Integer id) {
        SanPham sanPham = sanPhamRepo.getReferenceById(id);
        Integer sanPhamId = sanPham.getId();
        model.addAttribute("SanPham", sanPhamId);
        return sanPhamId;
    }
//    @ModelAttribute("sanPham")
//    public String getSanPham(Model model) {
//        SanPham sanPham = sanPhamRepo.findAll().get(0);
//        model.addAttribute("SanPham", sanPham.getId());
//        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
//    }

    @ModelAttribute("size")
    public String getSize(Model model) {
        model.addAttribute("size", sizeRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

    @ModelAttribute("anhSanPham")
    public String getAnhSanPham(Model model) {
        model.addAttribute("anhSanPham", anhSanPhamRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }


    @ModelAttribute("chatLieu")
    public String getchatLieu(Model model) {
        model.addAttribute("chatLieu", chatLieuRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }


    @ModelAttribute("mauSac")
    public String getMauSac(Model model) {
        model.addAttribute("mauSac", mauSacRepo.findAll());
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

    @GetMapping("t-shirt-luxury/admin/san-pham-chi-tiet")
    public String sanPhamChiTietAdmin(@RequestParam("id") Integer id, Model model, HttpSession session) {
        model.addAttribute("spct", sanPhamChiTietAdminRepo.findBySanPhamId(id));
        session.setAttribute("idSanPham", id);
        model.addAttribute("idSanPham", id);
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }


    @PostMapping("t-shirt-luxury/admin/san-pham-chi-tiet/add")
    public String sanPhamChiTietSave(
            HttpSession session,
//            @RequestParam("idSanPham") Integer idSanPham,
            @RequestParam("id_anh_san_pham_chi_tiet") Integer idAnhSanPham,
            @RequestParam("id_size") Integer idSize,
            @RequestParam("id_chat_lieu") Integer idChatLieu,
            @RequestParam("id_mau_sac") Integer idMauSac,
            @ModelAttribute("sanPhamChiTiet") SanPhamChiTiet sanPhamChiTiet) {


        SanPham sanPhamAdd = sanPhamRepo.getReferenceById((Integer) session.getAttribute("idSanPham"));
        sanPhamChiTiet.setSanPham(sanPhamAdd);
        sanPhamChiTiet.setNgayTao(new Date());
        sanPhamChiTiet.setNgaySua(new Date());
        sanPhamChiTiet.setAnhSanPham(anhSanPhamRepo.findById(idAnhSanPham).get());
        sanPhamChiTiet.setSize(sizeRepo.findById(idSize).get());
        sanPhamChiTiet.setChatLieu(chatLieuRepo.findById(idChatLieu).get());
        sanPhamChiTiet.setMauSac(mauSacRepo.findById(idMauSac).get());
        sanPhamChiTietAdminRepo.save(sanPhamChiTiet);
        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet?id=" + (Integer) session.getAttribute("idSanPham");
    }


    @GetMapping("t-shirt-luxury/admin/san-pham-chi-tiet/delete")
    public String sanPhamChiTietDelete(@RequestParam("id") Integer id, HttpSession session) {
        sanPhamChiTietAdminRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet?id=" + (Integer) session.getAttribute("idSanPham");
    }

    @GetMapping("t-shirt-luxury/admin/sua-san-pham-chi-tiet/getOne")
    public String getSanPham(@RequestParam(name = "id") Integer id, Model model) {

        // Lấy đối tượng san pham theo ID
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietAdminRepo.getOne(id);
        model.addAttribute("SPCT", sanPhamChiTiet);
        return "SanPhamChiTiet/sua-san-pham-chi-tiet";
    }

    @PostMapping("t-shirt-luxury/admin/updateSanPhamChiTiet")
    public String updateNguoiDung(@RequestParam("id") Integer id, @ModelAttribute("SPCT") SanPhamChiTiet sanPhamChiTiet) {
        SanPhamChiTiet getOne = sanPhamChiTietAdminRepo.getReferenceById(id);
        if (getOne.getId() == id) {
            Date ngaySua = new Date();
            sanPhamChiTiet.setId(id);
            sanPhamChiTiet.setNgaySua(ngaySua);
            sanPhamChiTiet.setNgayTao(getOne.getNgayTao());
            sanPhamChiTiet.setMaSanPhamChiTiet(getOne.getMaSanPhamChiTiet());
            sanPhamChiTiet.setGia(getOne.getGia());
            sanPhamChiTiet.setMauSac(getOne.getMauSac());
            sanPhamChiTiet.setSize(getOne.getSize());
            sanPhamChiTiet.setChatLieu(getOne.getChatLieu());
            sanPhamChiTiet.setSanPham(getOne.getSanPham());
            sanPhamChiTiet.setMoTa(getOne.getMoTa());
            sanPhamChiTiet.setKhoiLuongSanPham(getOne.getKhoiLuongSanPham());
            sanPhamChiTiet.setAnhSanPham(getOne.getAnhSanPham());
            sanPhamChiTietAdminRepo.save(sanPhamChiTiet);
        }
        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet?id=" + getOne.getSanPham().getId();

    }
}
