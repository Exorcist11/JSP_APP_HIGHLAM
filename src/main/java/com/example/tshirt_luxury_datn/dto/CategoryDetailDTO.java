package com.example.tshirt_luxury_datn.dto;

import com.example.tshirt_luxury_datn.entity.CategoryDetail;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDetailDTO {
    private Long id;
    private String name;
    private Boolean status;
    private Long categoryId;

    public CategoryDetailDTO(CategoryDetail categoryDetail) {
        this.id = categoryDetail.getId();
        this.name = categoryDetail.getName();
        this.status = categoryDetail.getStatus();
        this.categoryId = categoryDetail.getCategory().getId();
    }
}
