package com.example.tshirt_luxury_datn.config;

import com.example.tshirt_luxury_datn.entity.Voucher;
import com.example.tshirt_luxury_datn.repository.voucherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Component
public class VoucherExpiryScheduler {
    private final voucherRepository voucherRepository;

    public VoucherExpiryScheduler(voucherRepository voucherRepository) {
        this.voucherRepository = voucherRepository;
    }

    //Set thành không hoạt động
//    @Scheduled(cron = "0 0 0 * * ?") //Chạy lúc 00:00s
    @Scheduled(fixedRate = 6000)
    public void updateVoucherStatus() {
        LocalDate now = LocalDate.now();

        List<Voucher> expiredVouchers = voucherRepository.findExpiredVouchers(now, 1);

        expiredVouchers.forEach(voucher -> {
            voucher.setTrangThai(0); // Cập nhật trạng thái thành hết hạn
            voucherRepository.save(voucher);
        });

//        System.out.println("Updated expired vouchers at: " + now);
    }

    //Set thành hoạt động
//    @Scheduled(cron = "0 0 0 * * ?") //Chạy lúc 00:00s
    @Scheduled(fixedRate = 6000)
    public void updateVoucherStatusActive() {
        LocalDate now = LocalDate.now();

        List<Voucher> expiredVouchers = voucherRepository.findActiveVouchers(now, 0);

        expiredVouchers.forEach(voucher -> {
            voucher.setTrangThai(1); // Cập nhật trạng thái thành hoạt động
            voucherRepository.save(voucher);
        });


    }
}
