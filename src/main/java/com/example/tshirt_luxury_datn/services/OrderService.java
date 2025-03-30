package com.example.tshirt_luxury_datn.services;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.OrderDTO;
import com.example.tshirt_luxury_datn.dto.ProductDetailDTO;
import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.OrderItem;
import com.example.tshirt_luxury_datn.entity.Payment;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.repository.OrderItemRepository;
import com.example.tshirt_luxury_datn.repository.OrderRepository;
import com.example.tshirt_luxury_datn.repository.PaymentRepository;
import com.example.tshirt_luxury_datn.repository.ProductDetailRepository;
import com.example.tshirt_luxury_datn.repository.ProductRepository;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductDetailRepository productDetailRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    public List<Order> getListOrders() {
        return orderRepository.findAll();
    }

    public List<Order> getOrderByUser(Long userID) {
        return orderRepository.findByUserId(userID);
    }

    public List<OrderItem> getOrderItemsByOrderId(Long orderId) {
        Objects.requireNonNull(orderId, "Order ID must not be null");
        try {
            return orderItemRepository.findByOrderId(orderId);
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order items for orderId: " + orderId, e);
        }
    }

    public Order getOrderDetail(Long OrderId) {
        try {
            Optional<Order> orderOpt = orderRepository.findById(OrderId);
            if (orderOpt.isEmpty()) {
                throw new RuntimeException("Order not found for orderId: " + OrderId);
            }
            return orderOpt.get();
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + OrderId, e);
        }
    }

    public Order changeStatusOrder(Long orderId, String status) {
        try {
            Optional<Order> orderOpt = orderRepository.findById(orderId);
            if (orderOpt.isEmpty()) {
                throw new RuntimeException("Order not found for orderId: " + orderId);
            }
            Order order = orderOpt.get();
            order.setStatus(status);
            return orderRepository.save(order);
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + orderId, e);
        }
    }

    public List<Order> searchOrder(String status, String code) {
        try {
            return orderRepository.findByCodeIgnoreCaseStartingWithOrStatusIgnoreCase(status, code);
        } catch (Exception e) {
            throw new RuntimeException("Failed to searcg order detail for orderId: " + e);
        }
    }

    public Order getOrderByID(Long id) {
        try {
            Optional<Order> orderOpt = orderRepository.findById(id);
            if (orderOpt.isEmpty()) {
                throw new RuntimeException("Order not found for orderId: " + id);
            }
            return orderOpt.get();
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + id, e);
        }
    }

    public Order getOrderByCode(String code) {
        try {
            Optional<Order> orderOpt = orderRepository.findByCode(code);
            if (orderOpt.isEmpty()) {
                throw new RuntimeException("Order not found for orderId: " + code);
            }
            return orderOpt.get();
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + code, e);
        }
    }

    public static String generateOrderCode() {
        LocalTime now = LocalTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmmss");
        String timeString = now.format(formatter);
        return "HD" + timeString;
    }

    public Order orderInStore(OrderDTO request) {
        try {
            Order order = new Order();
            order.setOrderType("IN_STORE");
            order.setStatus("SUCCCESS");
            order.setTotalAmount(0.0);
            order.setCode(generateOrderCode());

            order = orderRepository.save(order);

            double totalAmount = 0.0;
            List<OrderItem> orderItems = new ArrayList<>();
            for (ProductDetailDTO productDetailDTO : request.getProductItems()) {
                ProductDetail productDetail = productDetailRepository.findByProductIdAndSizeIdAndColorId(
                        productDetailDTO.getProductID(), productDetailDTO.getSizeID(), productDetailDTO.getColorID())
                        .orElse(null);

                Product product = productRepository.findById(productDetailDTO.getProductID()).orElse(null);

                if (productDetail == null) {
                    throw new RuntimeException("Sản phẩm không tồn tại: " + productDetailDTO.getProductID());
                }

                if (productDetail.getQuantity() < productDetailDTO.getQuantity()) {
                    throw new RuntimeException("Số lượng không đủ cho sản phẩm: " + productDetailDTO.getProductID());
                }

                OrderItem orderItem = new OrderItem();
                orderItem.setProductDetail(productDetail);
                orderItem.setQuantity(productDetailDTO.getQuantity());
                orderItem.setPrice(product.getPrice());
                orderItem.setStatus(true);

                totalAmount += productDetailDTO.getQuantity() * product.getPrice() + 35000;
                orderItems.add(orderItem);

                productDetail.setQuantity(productDetail.getQuantity() - productDetailDTO.getQuantity());
            }

            order.setTotalAmount(totalAmount);
            Order savedOrder = orderRepository.save(order);

            for (OrderItem orderItem : orderItems) {
                orderItem.setOrder(savedOrder);
            }

            productDetailRepository.saveAll(orderItems.stream()
                    .map(OrderItem::getProductDetail)
                    .toList());

            Payment payment = new Payment();
            payment.setOrder(savedOrder);
            payment.setStatus(true);
            payment.setPaymentMethod(request.getPaymentMethod());
            paymentRepository.save(payment);

            savedOrder.setOrderItems(orderItems);
            return orderRepository.save(savedOrder);

        } catch (Exception e) {
            throw new RuntimeException("Failed to create order in store");
        }
    }
}
