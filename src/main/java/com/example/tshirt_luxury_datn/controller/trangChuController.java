package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.dto.SanPhamDTO;
import com.example.tshirt_luxury_datn.entity.*;
import com.example.tshirt_luxury_datn.repository.*;
import com.example.tshirt_luxury_datn.response.sanPhamResponse;
import com.example.tshirt_luxury_datn.services.SanPhamService;
import jakarta.servlet.http.HttpSession;
import com.example.tshirt_luxury_datn.repository.sanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/t-shirt-luxury")
public class trangChuController {
    @Autowired
    sanPhamRepository sanPhamRepo;
    @Autowired
    sanPhamChiTietRepository sanPhamChiTietRepo;
    @Autowired
    gioHangRepository gioHangRepo;

    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;
    @Autowired
    SanPhamService sanPhamService;

    @Autowired
    gioHangChiTietRepository gioHangChiTietRepo;

    public GioHang createGioHang(HttpSession session) {
        GioHang gioHang = new GioHang();
        gioHang.setNgaySua(new Date());
        gioHang.setNgayTao(new Date());
        gioHang.setTrangThai(0);
        gioHangRepo.save(gioHang);
        session.setAttribute("idGioHang", gioHang.getId());
        return gioHang;
    }

    @GetMapping("/trang-chu")
    public String trangChu(Model model) {
        Pageable pageable = PageRequest.of(0, 4); // Lấy 4 sản phẩm mới nhất
        List<sanPhamResponse> sanPhamList = sanPhamRepo.findTop4NewestSanPhamWithGia(pageable);
        System.out.println(sanPhamList);
        model.addAttribute("sanPhamList", sanPhamList);
        return "BanHang/trang-chu";
    }

    @PostMapping("/san-pham-chi-tiet/add-cart")
    public String addCart(@RequestParam("idSPDetail") Integer idSanPham,
            @RequestParam("mauSac") Integer idMauSac,
            @RequestParam("soLuong") Integer soLuong,
            @RequestParam("size") Integer idSize,
            HttpSession session,
            RedirectAttributes redirectAttributes

    ) {
        // Kiểm tra màu sắc
        if (idMauSac == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Vui lòng chọn màu sắc!");
            return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
        }

        // Kiểm tra kích thước
        if (idSize == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Vui lòng chọn kích thước!");
            return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
        }
        SanPhamChiTiet sanPhamChiTiet = sanPhamChiTietAdminRepo.getSanPhamChiTiet(idMauSac, idSize, idSanPham);
        // Integer soLuongSPCT =
        // sanPhamChiTietAdminRepo.getSoLuongTonSanPhamChiTiet(idMauSac, idSize,
        // idSanPham);
        Integer idGioHang = (Integer) session.getAttribute("idGioHang");
        GioHang gioHang = gioHangRepo.getReferenceById(idGioHang);
        List<Integer> idSPCTExistList = gioHangChiTietRepo.findIdSanPhamChiTietByIdGioHang(idGioHang);
        boolean idExist = false;
        for (Integer idSPCT : idSPCTExistList) {
            if (idSPCT.equals(sanPhamChiTiet.getId())) {
                idExist = true;
                break;
            }
        }
        if (idExist) {
            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepo.getGHCTByIdSPCT(sanPhamChiTiet.getId());
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + soLuong);
            gioHangChiTietRepo.save(gioHangChiTiet);
        } else {
            GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
            gioHangChiTiet.setGioHang(gioHang);
            gioHangChiTiet.setSoLuong(soLuong);
            gioHangChiTiet.setNgayTao(new Date());
            gioHangChiTiet.setNgaySua(new Date());
            gioHangChiTiet.setSanPhamChiTiet(sanPhamChiTiet);

            // Lưu bản ghi mới
            gioHangChiTietRepo.save(gioHangChiTiet);
        }

        return "redirect:/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=" + idSanPham;
    }

    @GetMapping("/san-pham-chi-tiet-detail")
    public String chiTietSanPham(@RequestParam("idSPDetail") Integer id, Model model) {
        try {
            SanPhamDTO itemDetail = sanPhamService.getSanPhamByID(id);
            model.addAttribute("itemDetail", itemDetail);

            // NumberFormat currencyFormat = NumberFormat.getInstance(new Locale("vi",
            // "VN"));
            // String giaFormatted = currencyFormat.format(itemDetail.getGia()) + " VNĐ";
            // model.addAttribute("giaFormatted", giaFormatted);

            System.out.println("sanPhamDetail " + itemDetail.getTenSanPham());

        } catch (Exception e) {
            throw new RuntimeException("error", e);
        }
        return "SanPhamChiTiet/san-pham-chi-tiet";
    }

}
