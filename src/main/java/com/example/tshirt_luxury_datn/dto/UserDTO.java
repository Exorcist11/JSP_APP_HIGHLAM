package com.example.tshirt_luxury_datn.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {
  private String email;
  private String password;
  private String role;
  private String username;
  private Boolean status;
}
