package com.example.tshirt_luxury_datn.controller;

import com.example.tshirt_luxury_datn.entity.Voucher;
import com.example.tshirt_luxury_datn.repository.voucherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Controller
public class voucherController {
    @Autowired
    voucherRepository voucherRepo;
    @GetMapping("/t-shirt-luxury/admin/voucher")
    public String Voucher(Model model) {
        model.addAttribute("listVoucher", voucherRepo.findAllVoucherByNgayTaoDesc());
        return "voucher/voucher";
    }
    boolean validate( Voucher voucher, RedirectAttributes redirectAttributes) {
        if (voucher.getTenVoucher() == null || voucher.getTenVoucher().isEmpty()) {
            redirectAttributes.addFlashAttribute("errorTenVoucher", "Vui lòng nhập tên voucher !");
            redirectAttributes.addFlashAttribute("openModal", "themVoucher");
            return false;
        } else {
            redirectAttributes.addFlashAttribute("tenVoucher", voucher.getTenVoucher());
        }
        if (voucher.getGiaTriGiam() == null) {
            redirectAttributes.addFlashAttribute("errorGiaTriGiamVoucher", "Vui lòng nhập giá trị giảm !");
            redirectAttributes.addFlashAttribute("openModal", "themVoucher");
            return false;
        } else {
            redirectAttributes.addFlashAttribute("giaTriGiam", voucher.getGiaTriGiam());
        }
        if (voucher.getSoLuong() == null) {
            redirectAttributes.addFlashAttribute("errorSoLuongVoucher", "Vui lòng nhập số lượng !");
            redirectAttributes.addFlashAttribute("openModal", "themVoucher");
            return false;
        } else {
            redirectAttributes.addFlashAttribute("soLuong", voucher.getSoLuong());
        }
        if (voucher.getNgayKetThuc() == null ) {
            redirectAttributes.addFlashAttribute("errorNgayKetThucVoucher", "Vui lòng nhập ngày kết thúc !");
            redirectAttributes.addFlashAttribute("openModal", "themVoucher");
            return false;
        } else {
            redirectAttributes.addFlashAttribute("ngayKetThuc", new SimpleDateFormat("yyyy-MM-dd").format(voucher.getNgayKetThuc()));

        }
        if (voucher.getMucChiToiThieu() == null ) {
            redirectAttributes.addFlashAttribute("errorMucChiToiThieuVoucher", "Vui lòng nhập mức chi tối thiểu !");
            redirectAttributes.addFlashAttribute("openModal", "themVoucher");
            return false;
        } else {
            redirectAttributes.addFlashAttribute("mucChiToiThieu", voucher.getMucChiToiThieu());
        }
        if (voucher.getGioiHan() == null ) {
            redirectAttributes.addFlashAttribute("errorGioiHanGiamVoucher", "Vui lòng nhập giới hạn giảm !");
            redirectAttributes.addFlashAttribute("openModal", "themVoucher");
            return false;
        } else {
            redirectAttributes.addFlashAttribute("gioiHan", voucher.getGioiHan());
        }
        return true;
    }

    @PostMapping("/t-shirt-luxury/admin/voucher/add")
    public String voucherAdd(@ModelAttribute("listVoucher") Voucher voucher, RedirectAttributes redirectAttributes){
        if (validate(voucher,redirectAttributes )){
            voucher.setTrangThai(1);
            voucher.setNgayBatDau(new Date());
            voucher.setNgayKetThuc(voucher.getNgayKetThuc());
            voucherRepo.save(voucher);
        }

        return "redirect:/t-shirt-luxury/admin/voucher";
    }
    @GetMapping("/t-shirt-luxury/admin/voucher/delete")
    public String voucherDelete(@RequestParam("id")Integer id){
        voucherRepo.deleteById(id);
        return "redirect:/t-shirt-luxury/admin/voucher";
    }
    @GetMapping("/t-shirt-luxury/admin/voucher/getOne")
    public String getOneVoucher(@RequestParam("id") Integer id, Model model){
        Voucher voucher  = voucherRepo.getOne(id);
        model.addAttribute("voucher", voucher);
        return "voucher/update-voucher";
    }
    @PostMapping("/t-shirt-luxury/admin/voucher/update")
    public String updateVoucher(@RequestParam("id") Integer id,
                                RedirectAttributes redirectAttributes,
                                @ModelAttribute("voucher") Voucher voucher,
                                @RequestParam("ngayKetThuc") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayKetThuc
                                ){
        Voucher getOne = voucherRepo.getReferenceById(id);
        if(getOne.getId() == id) {

            if (voucher.getTenVoucher() == null || voucher.getTenVoucher().isBlank()) {
                redirectAttributes.addFlashAttribute("errorMessageTenVoucher", "Vui lòng nhập tên voucher !");
                return "redirect:/t-shirt-luxury/admin/voucher/getOne?id=" + id;
            }
            if (voucher.getGiaTriGiam() == null ) {
                redirectAttributes.addFlashAttribute("errorMessageGiaTriGiamVoucher", "Vui lòng nhập giá trị giảm !");
                return "redirect:/t-shirt-luxury/admin/voucher/getOne?id=" + id;
            }
            if (voucher.getSoLuong() == null ) {
                redirectAttributes.addFlashAttribute("errorMessageSoLuongVoucher", "Vui lòng nhập số lượng !");
                return "redirect:/t-shirt-luxury/admin/voucher/getOne?id=" + id;
            }

            if (voucher.getMucChiToiThieu() == null ) {
                redirectAttributes.addFlashAttribute("errorMessageMucChiVoucher", "Vui lòng nhập mức chi !");
                return "redirect:/t-shirt-luxury/admin/voucher/getOne?id=" + id;
            }
            if (voucher.getGioiHan() == null ) {
                redirectAttributes.addFlashAttribute("errorMessageGioiHanVoucher", "Vui lòng nhập giới hạn giảm !");
                return "redirect:/t-shirt-luxury/admin/voucher/getOne?id=" + id;
            }
            else {
                voucher.setId(id);
                voucher.setTrangThai(1);
                voucher.setNgayBatDau(getOne.getNgayBatDau());
                voucher.setNgayKetThuc(ngayKetThuc);
                voucherRepo.save(voucher);
            }
        }
        updateVoucherStatusBasedOnDate(voucher);
        return "redirect:/t-shirt-luxury/admin/voucher";
    }
    @GetMapping("/t-shirt-luxury/admin/timVoucher")
    public String timVoucher(Model model,
                             @RequestParam(value = "tenVoucher", required = false) String tenVoucher,
                             @RequestParam(value = "trangThai", required = false) Integer trangThai,
                             @RequestParam(value = "ngayBatDau", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate ngayBatDau,
                             @RequestParam(value = "ngayKetThuc", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate ngayKetThuc) {

        List<Voucher> ketQua;

        if (tenVoucher == null && trangThai == null && ngayBatDau == null && ngayKetThuc == null) {
            ketQua = voucherRepo.findAll();
        } else {
            Date startDate = (ngayBatDau != null) ? Date.from(ngayBatDau.atStartOfDay(ZoneId.systemDefault()).toInstant()) : null;
            Date endDate = (ngayKetThuc != null) ? Date.from(ngayKetThuc.atStartOfDay(ZoneId.systemDefault()).toInstant()) : null;

            ketQua = voucherRepo.timKiemVoucher(tenVoucher, trangThai, startDate, endDate);
        }

        model.addAttribute("listVoucher", ketQua);
        model.addAttribute("tenVoucher", tenVoucher);
        model.addAttribute("trangThai", trangThai);
        model.addAttribute("ngayBatDau", ngayBatDau);
        model.addAttribute("ngayKetThuc", ngayKetThuc);

        return "voucher/voucher";
    }
    private void updateVoucherStatusBasedOnDate(Voucher voucher) {
        // Lấy ngày kết thúc của voucher
        LocalDate today = LocalDate.now();
        LocalDate endDate = voucher.getNgayKetThuc().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        // Kiểm tra và cập nhật trạng thái dựa trên ngày kết thúc
        if (endDate.isBefore(today)) {
            // Nếu ngày kết thúc đã qua, cập nhật trạng thái voucher thành hết hạn (0)
            voucher.setTrangThai(0);
        } else {
            // Nếu ngày kết thúc chưa qua, cập nhật trạng thái voucher thành hoạt động (1)
            voucher.setTrangThai(1);
        }

        // Lưu lại trạng thái cập nhật
        voucherRepo.save(voucher);
    }
}
