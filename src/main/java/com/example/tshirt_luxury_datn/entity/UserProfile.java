package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "user_profiles")
public class UserProfile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, columnDefinition = "NVARCHAR(50)")
    private String fullName; // Tên người nhận

    @Column(columnDefinition = "NVARCHAR(255)")
    private String detail; // Số nhà, tên đường

    private String phoneNumber; // Số điện thoại người nhận

    @Column(nullable = false)
    private Long provinceCode; // Mã tỉnh từ API

    @Column(nullable = false, columnDefinition = "NVARCHAR(50)")
    private String provinceName; // Tên tỉnh

    @Column(nullable = false)
    private Long districtCode; // Mã quận/huyện

    @Column(nullable = false, columnDefinition = "NVARCHAR(50)")
    private String districtName; // Tên quận/huyện

    @Column(nullable = false)
    private Long wardCode; // Mã phường/xã

    @Column(nullable = false, columnDefinition = "NVARCHAR(50)")
    private String wardName; // Tên phường/xã

    @Column(columnDefinition = "BIT DEFAULT 0")
    private Boolean isDefault = false; // Địa chỉ mặc định

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
}