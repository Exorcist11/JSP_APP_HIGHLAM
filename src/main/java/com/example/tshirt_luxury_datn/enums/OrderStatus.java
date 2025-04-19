package com.example.tshirt_luxury_datn.enums;

public enum OrderStatus {
    PENDING("Chờ xác nhận"),
    CONFIRMED("Đã xác nhận"),
    DELIVERING("Đang giao hàng"),
    SUCCESS("Giao hàng thành công"),
    CANCELLED("Đã hủy"),
    RETURNED("Đã trả hàng");

    private final String displayName;

    OrderStatus(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
