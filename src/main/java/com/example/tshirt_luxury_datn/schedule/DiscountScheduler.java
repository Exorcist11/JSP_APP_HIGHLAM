package com.example.tshirt_luxury_datn.schedule;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.tshirt_luxury_datn.entity.Discount;
import com.example.tshirt_luxury_datn.repository.DiscountRepository;

@Component
public class DiscountScheduler {
    @Autowired
    private DiscountRepository discountRepository;

    /**
     * Phương thức này sẽ được chạy tự động mỗi ngày lúc 00:00:00
     * Để cập nhật trạng thái của các mã giảm giá đã hết hạn
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void updateExpiredDiscounts() {
        Timestamp currentTime = Timestamp.valueOf(LocalDateTime.now());

        // Lấy tất cả các mã giảm giá còn hoạt động nhưng đã hết hạn
        List<Discount> expiredDiscounts = discountRepository.findByStatusTrueAndEndDateBefore(currentTime);

        // Cập nhật trạng thái thành false cho tất cả mã giảm giá đã hết hạn
        for (Discount discount : expiredDiscounts) {
            discount.setStatus(false);
        }

        // Lưu lại các thay đổi
        if (!expiredDiscounts.isEmpty()) {
            discountRepository.saveAll(expiredDiscounts);
            System.out
                    .println("Đã cập nhật " + expiredDiscounts.size() + " mã giảm giá hết hạn thành không hoạt động.");
        }
    }
}
