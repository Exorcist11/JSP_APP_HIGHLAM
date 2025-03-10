package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.AnhSanPham;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.tshirt_luxury_datn.repository.anhSanPhamRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class anhSanPhamController {
    @Autowired
    anhSanPhamRepository anhSanPhamRepository;
    @GetMapping("/t-shirt-luxury/admin/anh-san-pham")
    public String anhHienThi(Model model){
        model.addAttribute("anhSanPham", anhSanPhamRepository.findAll());
        return "AnhSanPham/anh-san-pham";
    }
    @PostMapping("/t-shirt-luxury/admin/anh-san-pham/add")
    public String addAnhSP(@ModelAttribute("anhSanPham")AnhSanPham anhSanPham){
        anhSanPham.setNgayTao(new Date());
        anhSanPham.setNgaySua(new Date());
        anhSanPhamRepository.save(anhSanPham);
        return "redirect:/t-shirt-luxury/admin/anh-san-pham";
    }
    @GetMapping("/t-shirt-luxury/admin/anh-san-pham/delete")
    public String deleteAnhSP(@RequestParam("id") Integer id) {
        anhSanPhamRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/anh-san-pham";
    }

    @GetMapping("/t-shirt-luxury/admin/anh-san-pham/getOne")
    public String getOneAnhSP(@RequestParam(name = "id") Integer id, Model model) {

        AnhSanPham anhSanPham = anhSanPhamRepository.getOne(id);
        model.addAttribute("anhSanPham", anhSanPham);
        return "AnhSanPham/sua-anh-sp";
    }


    @PostMapping("/t-shirt-luxury/admin/anh-san-pham/update")
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
