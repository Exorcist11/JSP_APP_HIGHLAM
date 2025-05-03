package com.example.tshirt_luxury_datn.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.tshirt_luxury_datn.services.DiscountService;

@Configuration
public class DiscountStartupUpdater {

    @Autowired
    private DiscountService discountService;

    /**
     * Bean này sẽ tự động chạy khi ứng dụng khởi động
     * Để cập nhật trạng thái của các mã giảm giá đã hết hạn
     */
    @Bean
    public CommandLineRunner updateDiscountsOnStartup() {
        return args -> {
            System.out.println("Đang kiểm tra và cập nhật trạng thái các mã giảm giá hết hạn khi khởi động...");
            discountService.updateExpiredDiscountsStatus();
            System.out.println("Đã hoàn thành cập nhật trạng thái mã giảm giá!");
        };
    }
}