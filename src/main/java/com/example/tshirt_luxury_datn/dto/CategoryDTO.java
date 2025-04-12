package com.example.tshirt_luxury_datn.dto;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryDTO {
  private Long id;
  private String name;
  private Boolean status;
  private Timestamp createdAt;
  private Timestamp updatedAt;
  private List<CategoryDetailDTO> categoryDetails;

  public CategoryDTO(Long id, String name, Boolean status, Timestamp createdAt, Timestamp updatedAt,
      List<CategoryDetailDTO> categoryDetails) {
    this.id = id;
    this.name = name;
    this.status = status;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.categoryDetails = categoryDetails;
  }

  public CategoryDTO() {
  }
}
