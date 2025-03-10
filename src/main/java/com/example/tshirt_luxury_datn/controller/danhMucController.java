package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.dto.DanhMucDTO;
import com.example.tshirt_luxury_datn.entity.DanhMuc;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import com.example.tshirt_luxury_datn.services.DanhMucService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RequestMapping("/t-shirt-luxury/admin/danh-muc")
@Controller
public class danhMucController {

    @Autowired
    danhMucRepository danhMucRepository;

    @Autowired
    DanhMucService danhMucService;

    @GetMapping("")
    public String danhMucAdmin(Model model) {
        model.addAttribute("danhMuc", danhMucRepository.findAll());
        return "DanhMuc/danh-muc-admin";
    }

    @GetMapping("/delete")
    public String danhMucAdminDelete(@RequestParam("id") Integer id, Model model) {
        if (!danhMucRepository.existsById(id)) {
            model.addAttribute("error", "ID không tồn tại.");
            return "redirect:/t-shirt-luxury/admin/danh-muc";
        }
        danhMucRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/danh-muc";
    }

    @PostMapping("/add")
    public String danhMucAdminAdd(@ModelAttribute("danhMuc") DanhMucDTO danhMuc, Model model) {
        try {
            danhMucService.taoMoiDanhMuc(danhMuc);
            model.addAttribute("message", "Tạo mới danh mục thành công!");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/t-shirt-luxury/admin/danh-muc";
    }

    @GetMapping("/getOne")
    public String getOneDanhMuc(@RequestParam(name = "id") Integer id, Model model) {

        DanhMuc danhMuc = danhMucRepository.getOne(id);
        model.addAttribute("danhMuc", danhMuc);
        return "DanhMuc/sua-danh-muc-admin";
    }

    @PostMapping("/update")
    public String updateNguoiDung(@RequestParam("id") Integer id, @ModelAttribute("danhMuc") DanhMuc danhMuc) {
        DanhMuc getOne = danhMucRepository.getReferenceById(id);
        if (getOne.getId() == id) {
            Date ngaySua = new Date();
            danhMuc.setId(id);
            danhMuc.setNgaySua(ngaySua);
            danhMuc.setNgayTao(getOne.getNgayTao());
            danhMucRepository.save(danhMuc);
        }
        return "redirect:/t-shirt-luxury/admin/danh-muc";
    }
}
