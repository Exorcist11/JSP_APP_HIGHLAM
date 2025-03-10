package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.dto.SanPhamChiTietDTO;
import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.services.SanPhamChiTietService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@RequestMapping("/t-shirt-luxury/admin/san-pham-chi-tiet")
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
    @Autowired
    SanPhamChiTietService spctService;

    @ModelAttribute("sanPham")
    public Integer getSanPham(Model model, @RequestParam(name = "id") Integer id) {
        SanPham sanPham = sanPhamRepo.getReferenceById(id);
        Integer sanPhamId = sanPham.getId();
        model.addAttribute("SanPham", sanPhamId);
        return sanPhamId;
    }
    // @ModelAttribute("sanPham")
    // public String getSanPham(Model model) {
    // SanPham sanPham = sanPhamRepo.findAll().get(0);
    // model.addAttribute("SanPham", sanPham.getId());
    // return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    // }

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

    @GetMapping("")
    public String sanPhamChiTietAdmin(@RequestParam("id") Integer id, Model model, HttpSession session) {
        model.addAttribute("spct", sanPhamChiTietAdminRepo.findBySanPhamId(id));
        session.setAttribute("idSanPham", id);
        model.addAttribute("idSanPham", id);
        return "SanPhamChiTiet/san-pham-chi-tiet-admin";
    }

    @PostMapping("/add")
    public String sanPhamChiTietSave(HttpSession session,
            @ModelAttribute SanPhamChiTietDTO spct, Model model) {
        try {
            spctService.taoMoiSanPham(spct, (Integer) session.getAttribute("idSanPham"));
            model.addAttribute("message", "Thêm mới sản phẩm thành công");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }

        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet?id=" + (Integer) session.getAttribute("idSanPham");
    }

    @GetMapping("/delete")
    public String sanPhamChiTietDelete(@RequestParam("id") Integer id, HttpSession session) {
        sanPhamChiTietAdminRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/san-pham-chi-tiet?id=" + (Integer) session.getAttribute("idSanPham");
    }

    @GetMapping("/getOne")
    public String getSanPham(@RequestParam(name = "id") Integer id, Model model) {

        // Lấy đối tượng san pham theo ID
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietAdminRepo.getOne(id);
        model.addAttribute("SPCT", sanPhamChiTiet);
        return "SanPhamChiTiet/sua-san-pham-chi-tiet";
    }

    @PostMapping("/updateSanPhamChiTiet")
    public String updateNguoiDung(@RequestParam("id") Integer id,
            @ModelAttribute("SPCT") SanPhamChiTiet sanPhamChiTiet) {
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
