package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.DanhMuc;
import com.example.tshirt_luxury_datn.entity.MauSac;
import com.example.tshirt_luxury_datn.repository.mauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class mauSacController {

    @Autowired
    mauSacRepository mauSacRepository;


    @GetMapping("t-shirt-luxury/admin/mau-sac")
    public String mauSac(Model model) {
        model.addAttribute("mauSac", mauSacRepository.findAll());
        return "MauSac/mau-sac";
    }

    @GetMapping("t-shirt-luxury/admin/mau-sac/delete")
    public String mauSacDelete(@RequestParam("id")Integer id) {
        mauSacRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/mau-sac";
    }

    @PostMapping("t-shirt-luxury/admin/mau-sac/add")
    public String mauSacAdd(@ModelAttribute("mauSac") MauSac mauSac) {
        mauSac.setNgayTao(new Date());
        mauSac.setNgaySua(new Date());
        mauSacRepository.save(mauSac);
        return "redirect:/t-shirt-luxury/admin/mau-sac";
    }

    @GetMapping("t-shirt-luxury/admin/mau-sac/getOne")
    public String getOneMauSac(@RequestParam(name = "id") Integer id, Model model) {

        MauSac mauSac = mauSacRepository.getOne(id);
        model.addAttribute("mauSac", mauSac);
        return "MauSac/sua-mau-sac";
    }


    @PostMapping("t-shirt-luxury/admin/mau-sac/update")
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
