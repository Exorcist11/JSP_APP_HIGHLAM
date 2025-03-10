package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.dto.MauSacDTO;
import com.example.tshirt_luxury_datn.entity.MauSac;
import com.example.tshirt_luxury_datn.repository.mauSacRepository;
import com.example.tshirt_luxury_datn.services.MauSacService;

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
@RequestMapping("/t-shirt-luxury/admin/mau-sac")
public class mauSacController {

    @Autowired
    mauSacRepository mauSacRepository;

    @Autowired
    MauSacService mauSacService;

    @GetMapping("")
    public String mauSac(Model model) {
        model.addAttribute("mauSac", mauSacRepository.findAll());
        return "MauSac/mau-sac";
    }

    @GetMapping("/delete")
    public String mauSacDelete(@RequestParam("id") Integer id) {
        mauSacRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/mau-sac";
    }

    @PostMapping("/add")
    public String mauSacAdd(@ModelAttribute("mauSac") MauSacDTO mauSac, Model model) {
        try {
            mauSacService.taoMoiMauSac(mauSac);
            model.addAttribute("message", "Thêm mới thành công");
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
        }
        return "redirect:/t-shirt-luxury/admin/mau-sac";
    }

    @GetMapping("/getOne")
    public String getOneMauSac(@RequestParam(name = "id") Integer id, Model model) {

        MauSac mauSac = mauSacRepository.getOne(id);
        model.addAttribute("mauSac", mauSac);
        return "MauSac/sua-mau-sac";
    }

    @PostMapping("/update")
    public String updateNguoiDung(@RequestParam("id") Integer id, @ModelAttribute("danhMuc") MauSac mauSac) {
        MauSac getOne = mauSacRepository.getReferenceById(id);
        if (getOne.getId() == id) {
            Date ngaySua = new Date();
            mauSac.setId(id);
            mauSac.setNgaySua(ngaySua);
            mauSac.setNgayTao(getOne.getNgayTao());
            mauSacRepository.save(mauSac);
        }
        return "redirect:/t-shirt-luxury/admin/mau-sac";
    }
}
