package com.example.tshirt_luxury_datn.dto;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DiscountDTO {

    private Long id;
    private String code;

    private Double percentage;
    private LocalDateTime startDate;
    private LocalDateTime endDate;

    private Boolean status = true;

}
