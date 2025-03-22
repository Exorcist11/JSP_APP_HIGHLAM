package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tshirt_luxury_datn.services.OrderService;

@Controller
@RequestMapping("/admin/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping
    public String listOrders(Model model) {
        model.addAttribute("listOrders", orderService.getListOrders());
        return "HoaDon/hoa-don-admin";
    }

    @GetMapping("/{orderId}")
    public String orderDetail(Model model, @PathVariable Long orderId) {
        System.out.println("orderId: " + orderId);
        try {
            model.addAttribute("order", orderService.getOrderDetail(orderId));
            model.addAttribute("orderItems",
                    orderService.getOrderItemsByOrderId(orderId));
            return "HoaDon/chi-tiet-hoa-don";
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch order detail for orderId: " + orderId, e);
        }
    }

    @PatchMapping("/changeStatus/{orderId}")
    public ResponseEntity<String> updateOrderStatus(
            @PathVariable Long orderId,
            @RequestParam("order") String status) {
        System.out.println("orderId: " + orderId + ", status: " + status);
        try {
            orderService.changeStatusOrder(orderId, status);
            return ResponseEntity.ok("Cập nhật thành công");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Lỗi khi cập nhật trạng thái: " + e.getMessage());
        }
    }

}
