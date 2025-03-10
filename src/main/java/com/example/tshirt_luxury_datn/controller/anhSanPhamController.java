package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.dto.AnhDTO;
import com.example.tshirt_luxury_datn.entity.AnhSanPham;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.tshirt_luxury_datn.repository.anhSanPhamRepository;
import com.example.tshirt_luxury_datn.services.UploadService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
@RequestMapping("/t-shirt-luxury/admin/anh-san-pham")
public class anhSanPhamController {
    @Autowired
    anhSanPhamRepository anhSanPhamRepository;

    @Autowired
    UploadService uploadImg;

    @GetMapping("")
    public String anhHienThi(Model model) {
        model.addAttribute("anhSanPham", anhSanPhamRepository.findAll());
        return "AnhSanPham/anh-san-pham";
    }

    @PostMapping("/add")
    public String addAnhSP(@ModelAttribute("anhSanPham") AnhDTO anhSanPham, Model model) {
        try {
            uploadImg.taiAnh(anhSanPham);
            model.addAttribute("message", "Thêm mới ảnh thành công");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/t-shirt-luxury/admin/anh-san-pham";
    }

    @GetMapping("/delete")
    public String deleteAnhSP(@RequestParam("id") Integer id) {
        anhSanPhamRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/anh-san-pham";
    }

    @GetMapping("/getOne")
    public String getOneAnhSP(@RequestParam(name = "id") Integer id, Model model) {

        AnhSanPham anhSanPham = anhSanPhamRepository.getOne(id);
        model.addAttribute("anhSanPham", anhSanPham);
        return "AnhSanPham/sua-anh-sp";
    }

    @PostMapping("/update")
    public String updateAnhSP(@RequestParam("id") Integer id, @ModelAttribute("anhSanPham") AnhSanPham anhSanPham) {
        AnhSanPham getOne = anhSanPhamRepository.getReferenceById(id);
        if (getOne.getId() == id) {
            Date ngaySua = new Date();
            anhSanPham.setId(id);
            anhSanPham.setNgaySua(ngaySua);
            anhSanPham.setNgayTao(getOne.getNgayTao());
            anhSanPhamRepository.save(anhSanPham);
        }
        return "redirect:/t-shirt-luxury/admin/anh-san-pham";
    }
}
