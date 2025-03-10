package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.anhSanPhamRepository;
import com.example.tshirt_luxury_datn.repository.danhMucRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

@Controller
public class sanPhamController {
    @Autowired
    sanPhamRepository sanPhamRepository;
    @Autowired
    danhMucRepository danhMucRepository;
    @Autowired
    anhSanPhamRepository anhSanPhamRepository;

    @GetMapping("t-shirt-luxury/admin/san-pham")
    public String sanPhamAdmin(Model model) {
        model.addAttribute("listSanPham", sanPhamRepository.findAllSanPhamByNgayTaoDesc());
        return "SanPham/san-pham-admin";
    }

    @ModelAttribute("danhMuc")
    public String getDanhMuc(Model model) {
        model.addAttribute("danhMuc", danhMucRepository.findAll());
        return "SanPham/san-pham-admin";
    }

    @ModelAttribute("anhSP")
    public String getAnhSP(Model model) {
        model.addAttribute("anhSP", anhSanPhamRepository.findAll());
        return "SanPham/san-pham-admin";
    }

    boolean validate(SanPham sanPham, RedirectAttributes redirectAttributes) {
        String errorMessage = "";
        if (sanPham.getTenSanPham() == null || sanPham.getTenSanPham().isBlank()) {
            errorMessage = "Vui lòng nhập tên sản phẩm !";
            redirectAttributes.addFlashAttribute("errorMessageSanPham", errorMessage);
            redirectAttributes.addFlashAttribute("openModal", "themSanPham");
            return false;
        }
        return true;
    }

    @PostMapping("t-shirt-luxury/admin/san-pham/add")
    public String sanPhamSave(
            @RequestParam("id_danh_muc") Integer idDanhMuc,
            @ModelAttribute("sanPham") SanPham sanPham,
            RedirectAttributes redirectAttributes
    ) {
        if (validate(sanPham, redirectAttributes)) {
            sanPham.setNgayTao(new Date());
            sanPham.setNgaySua(new Date());
            sanPham.setDanhMuc(danhMucRepository.findById(idDanhMuc).get());
            sanPhamRepository.save(sanPham);
        }

        return "redirect:/t-shirt-luxury/admin/san-pham";
    }

    @GetMapping("t-shirt-luxury/admin/san-pham/delete")
    public String sanPhamDelete(@RequestParam("id") Integer id) {
        sanPhamRepository.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/san-pham";
    }


    @GetMapping("t-shirt-luxury/admin/sua-san-pham/getOne")
    public String getSanPham(@RequestParam(name = "id") Integer id, Model model) {

        // Lấy đối tượng san pham theo ID
        SanPham sanPham = sanPhamRepository.getOne(id);
        model.addAttribute("sanPham", sanPham);
        return "SanPham/sua-san-pham";
    }

    @PostMapping("t-shirt-luxury/admin/updateSanPham")
    public String updateNguoiDung(@RequestParam("id") Integer id,
                                  @ModelAttribute("sanPham") SanPham sanPham,
                                  @RequestParam("tenSanPham") String tenSanPham,
                                  RedirectAttributes redirectAttributes) {
        SanPham getOne = sanPhamRepository.getReferenceById(id);

        if (getOne.getId() == id) {
            String errorMessage = "";
            if (tenSanPham == null || tenSanPham.isBlank()) {
                errorMessage = "Vui lòng nhập tên sản phẩm !";
                redirectAttributes.addFlashAttribute("errorMessageSanPham", errorMessage);
                return "redirect:/t-shirt-luxury/admin/sua-san-pham/getOne?id=" + id;
            } else {
                Date ngaySua = new Date();
                sanPham.setId(id);
                sanPham.setNgaySua(ngaySua);
                sanPham.setNgayTao(getOne.getNgayTao());
                sanPhamRepository.save(sanPham);
            }


        }

        return "redirect:/t-shirt-luxury/admin/san-pham";
    }


    @GetMapping("t-shirt-luxury/admin/timSP")
    public String timSanPham(Model model,
                             @RequestParam(value = "timKiemSanPham", required = false) String timKiemSanPham,
                             @RequestParam(value = "trangThai", required = false) Integer trangThai) {

        List<SanPham> ketQua;

        if (timKiemSanPham == null && trangThai == null) {
            ketQua = sanPhamRepository.findAll();
        } else {
            ketQua = sanPhamRepository.timKiemSP(timKiemSanPham, trangThai);
        }

        model.addAttribute("listSanPham", ketQua);
        model.addAttribute("timKiemSanPham", timKiemSanPham);
        model.addAttribute("trangThai", trangThai);

        return "SanPham/san-pham-admin";
    }





}
