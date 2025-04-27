package com.example.tshirt_luxury_datn.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDTO {
  private String guestEmail;
  private String status;
  private String statusDisplay;
  private Long userID;
  private String note;
  private String recipientName;
  private String recipientAddress;
  private String recipientPhone;
  private List<OrderItemDTO> orderItems;
  private List<ProductDetailDTO> productItems;

  private String paymentMethod;
  public String orderType;

  private String province;
  private String district;
  private String ward;
  private String addressDetail;
  private String trangThai;
  private Long profileId;
  private String discountCode;
  private String couponCode;
}
