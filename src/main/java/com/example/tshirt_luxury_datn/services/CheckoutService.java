package com.example.tshirt_luxury_datn.services;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.dto.OrderItemDTO;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.OrderItem;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.repository.OrderRepository;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;

@Service
public class CheckoutService {
  @Autowired
  private OrderRepository orderRepository;

  @Autowired
  private ProductDetailRepository productDetailRepository;

  public Order createOrder(OrderDTO orderDTO) {
    try {
      Order order = new Order();
      order.setGuestEmail(orderDTO.getGuestEmail());
      order.setStatus("PENDING"); 
      order.setNotes(orderDTO.getNote());
      order.setRecipientAddress(orderDTO.getRecipientAddress());
      order.setRecipientName(orderDTO.getRecipientName());
      order.setRecipientPhone(orderDTO.getRecipientPhone());
      order.setOrderDate(LocalDateTime.now());

      order.setCreatedAt(LocalDateTime.now());
      order.setUpdatedAt(LocalDateTime.now());

      List<OrderItem> orderItems = new ArrayList<>();
      double totalAmount = 0;

      for (OrderItemDTO itemDTO : orderDTO.getOrderItems()) {
        ProductDetail productDetail = productDetailRepository.findById(itemDTO.getProductDetailID()).orElse(null);

        if (productDetail == null) {
          throw new RuntimeException("Sản phẩm không tồn tại: " + itemDTO.getProductDetailID());
        }

        OrderItem orderItem = new OrderItem();
        orderItem.setProductDetail(productDetail);
        orderItem.setQuantity(itemDTO.getQuantity());
        orderItem.setPrice(itemDTO.getPrice());
        orderItem.setStatus(true);
        orderItem.setCreatedAt(LocalDateTime.now());
        orderItem.setUpdatedAt(LocalDateTime.now());

        totalAmount += itemDTO.getQuantity() * itemDTO.getPrice();
        orderItems.add(orderItem);
      }

      order.setTotalAmount(totalAmount);
      Order savedOrder = orderRepository.save(order);

      for (OrderItem orderItem : orderItems) {
        orderItem.setOrder(savedOrder);
      }

      savedOrder.setOrderItems(orderItems);
      return orderRepository.save(savedOrder);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi thêm order: " + e.getMessage());
    }
  }
}
