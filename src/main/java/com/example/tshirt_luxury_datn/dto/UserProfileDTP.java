package com.example.tshirt_luxury_datn.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserProfileDTP {
  private Long id;
    private String fullName;
    private String detail;
    private String phoneNumber;
    private Long provinceCode;
    private String provinceName;
    private Long districtCode;
    private String districtName;
    private Long wardCode;
    private String wardName;
    private Boolean isDefault;
}
