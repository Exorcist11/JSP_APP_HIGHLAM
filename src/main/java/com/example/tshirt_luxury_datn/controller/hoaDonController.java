package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.HoaDon;
import com.example.tshirt_luxury_datn.entity.HoaDonChiTiet;
import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.entity.ThongTinNhanHang;
import com.example.tshirt_luxury_datn.repository.hoaDonChiTietRepository;
import com.example.tshirt_luxury_datn.repository.hoaDonRepository;
import com.example.tshirt_luxury_datn.repository.sanPhamChiTietAdminRepository;
import com.example.tshirt_luxury_datn.repository.thongTinDonHangRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class hoaDonController {
    @Autowired
    hoaDonRepository hoaDonRepo;
    @Autowired
    hoaDonChiTietRepository hoaDonChiTietRepo;

    @Autowired
    thongTinDonHangRepository thongTinDonHangRepo;
    @Autowired
    sanPhamChiTietAdminRepository sanPhamChiTietAdminRepo;

    @GetMapping("/t-shirt-luxury/admin/hoa-don")
    public String hoaDonAdmin(Model model) {
        model.addAttribute("listHoaDonTaiQuay", hoaDonRepo.getHoaDonTaiQuay());
        return "HoaDon/hoa-don-admin";
    }

    @GetMapping("/t-shirt-luxury/admin/hoa-don-online")
    public String hoaDonOnline(Model model) {
        model.addAttribute("listHoaDonOnline", hoaDonRepo.getHoaDonOnline());
        return "HoaDon/hoa-don-online";
    }

    @GetMapping("/t-shirt-luxury/admin/hoa-don-online/detail")
    public String hoaDonOnlineDetail(@RequestParam("idHoaDonOnline") Integer idHoaDon, Model model) {
        List<HoaDonChiTiet> hoaDonChiTiet = hoaDonChiTietRepo.getHoaDonChiTietByIdHoaDon(idHoaDon);

        model.addAttribute("tongTien", hoaDonRepo.tongTienHoaDonOnline(idHoaDon));

        model.addAttribute("voucherTrongHoaDon", hoaDonRepo.getReferenceById(idHoaDon));
        //model.addAttribute("tongTienHoaDon", hoaDonRepo.getReferenceById(idHoaDon));

        model.addAttribute("giaTienBanDau", hoaDonRepo.tongGiaBanDau(idHoaDon));

        model.addAttribute("soSanPhamMua", hoaDonRepo.getSoLuongSanPhamMua(idHoaDon));

        model.addAttribute("xacNhanHoaDonOnline", hoaDonRepo.getHoaDonTrangThai1(idHoaDon));

        model.addAttribute("hoaDonChiTietOnline", hoaDonChiTiet);
        System.out.println("fhjskdhfksjhfkjshkjfhksjdhkfjs"+hoaDonChiTiet);
        Integer idThongTinDonHang = hoaDonRepo.getThongTinDonHang(idHoaDon);
        ThongTinNhanHang thongTinNhanHang = thongTinDonHangRepo.getReferenceById(idThongTinDonHang);
        model.addAttribute("thongTinNhanHang", thongTinNhanHang);
        return "HoaDon/xac-nhan-don-hang";

    }

    @PostMapping("/t-shirt-luxury/admin/hoa-don-online/xac-nhan-don")
    public String xacNhanDon(@RequestParam("idHoaDonXacNhan") Integer idHoaDon, HttpSession session) {
        HoaDon hoaDon = hoaDonRepo.getReferenceById(idHoaDon);


        hoaDon.setId(idHoaDon);
        //hoaDon.setTrangThai(3);
        //int hoaDonId = idHoaDon;
        int trangThai = hoaDonRepo.getHoaDonTrangThai1(idHoaDon);

        int trangThaiHienTai = hoaDonRepo.getHoaDonTrangThai(idHoaDon, trangThai);

        if (trangThaiHienTai == 2) {
            hoaDon.setTrangThai(3);
            hoaDon.setNgaySua(new Date());
            hoaDonRepo.save(hoaDon);
        } else if (trangThaiHienTai == 3) {
            hoaDon.setTrangThai(4);
            hoaDon.setNgaySua(new Date());
            hoaDonRepo.save(hoaDon);
        }


//        if(hoaDonRepo.getHoaDonTrangThai(idHoaDon, 2) == 2) {
//            hoaDon.setTrangThai(3);
//            hoaDonRepo.save(hoaDon);
//
//        } else if(hoaDonRepo.getHoaDonTrangThai(idHoaDon, 3) == 3) {
//            hoaDon.setTrangThai(4);
//            hoaDonRepo.save(hoaDon);
//        }

        //hoaDonRepo.save(hoaDon);

        List<SanPhamChiTiet> idSPCT = sanPhamChiTietAdminRepo.findAll();
        List<HoaDonChiTiet> hoaDonChiTietSL = hoaDonChiTietRepo.selectSoLuongHoaDonChiTietOnline(idHoaDon);
        List<Integer> soLuongHDCT = hoaDonChiTietRepo.selectSoLuongOnline(idHoaDon);
        System.out.println("id san pham chi tiet"+idSPCT);
        System.out.println("hoa don chi tiet so luong"+hoaDonChiTietSL);
        System.out.println("so luong hoa don chi tiet"+soLuongHDCT);
        for (int i = 0; i < hoaDonChiTietSL.size(); i++) {
            HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietSL.get(i);
            int soLuongCanTru = soLuongHDCT.get(i); // Lấy số lượng tương ứng từ soLuongHDCT

            // Lọc danh sách SanPhamChiTiet phù hợp với ID từ HoaDonChiTiet
            List<SanPhamChiTiet> sanPhamChiTietList = idSPCT.stream()
                    .filter(sp -> sp.getId().equals(hoaDonChiTiet.getSanPhamChiTiet().getId()))
                    .collect(Collectors.toList());

            // Trừ số lượng cho tất cả các SanPhamChiTiet phù hợp
            for (SanPhamChiTiet sanPhamChiTiet : sanPhamChiTietList) {
                sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() - soLuongCanTru);
                sanPhamChiTiet.setId(sanPhamChiTiet.getId());
                sanPhamChiTietAdminRepo.save(sanPhamChiTiet); // Lưu lại thay đổi
            }
        }


        return "redirect:/t-shirt-luxury/admin/hoa-don-online";
    }
}
