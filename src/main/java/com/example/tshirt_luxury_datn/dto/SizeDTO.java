package com.example.tshirt_luxury_datn.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SizeDTO {
    private String name;
    private Boolean status;
    private String description;
    private List<Long> availableColorIds; 
}
