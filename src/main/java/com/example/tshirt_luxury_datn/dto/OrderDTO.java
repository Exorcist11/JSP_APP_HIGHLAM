package com.example.tshirt_luxury_datn.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDTO {
  private String guestEmail;
  private Boolean status;
 
  private Long userID;
  private String note;
  private String recipientName;
  private String recipientAddress;
  private String recipientPhone;
  private List<OrderItemDTO> orderItems;
  private List<ProductDetailDTO> productItems;
  
  private String paymentMethod;
}
