package com.example.tshirt_luxury_datn.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ColorDTO {
    private String name;
    private Boolean status;
    private String hexColor;
    private List<Long> availableSizeIds; 
}
