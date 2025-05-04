package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.enums.OrderStatus;
import com.example.tshirt_luxury_datn.services.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping
    public String listOrders(
            @RequestParam(required = false) String code,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) Long id,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            Model model, HttpSession session) {
                
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        Pageable pageable = PageRequest.of(page, size);
        OrderStatus orderStatus = null;
        if (status != null && !status.isEmpty()) {
            try {
                orderStatus = OrderStatus.valueOf(status.toUpperCase());
            } catch (IllegalArgumentException e) {
                model.addAttribute("error", "Trạng thái đơn hàng không hợp lệ: " + status);
            }
        }

        // Kiểm tra xem có đang tìm kiếm không
        boolean isSearching = (code != null && !code.isEmpty()) || (status != null && !status.isEmpty());

        Page<Order> orders = isSearching
                ? orderService.searchOrder(code, orderStatus, pageable)
                : orderService.getListOrders(pageable);

        model.addAttribute("allStatus", OrderStatus.values());
        model.addAttribute("code", code);
        model.addAttribute("status", status);
        model.addAttribute("listOrders", orders.getContent());
        model.addAttribute("currentPage", orders.getNumber());
        model.addAttribute("totalPages", orders.getTotalPages());
        model.addAttribute("totalItems", orders.getTotalElements());
        model.addAttribute("pageSize", size);

        if (id != null) {
            try {
                model.addAttribute("selectedOrder", orderService.getOrderDetail(id));
                model.addAttribute("orderItems", orderService.getOrderItemsByOrderId(id));
            } catch (Exception e) {
                model.addAttribute("error", "Không tìm thấy hóa đơn");
            }
        }

        return "HoaDon/hoa-don-admin";
    }

    @GetMapping("/{orderId}")
    public String orderDetail(Model model, @PathVariable Long orderId) {
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
            @RequestParam("order") OrderStatus status) {
        try {
            orderService.changeStatusOrder(orderId, status);
            return ResponseEntity.ok("Cập nhật thành công");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Lỗi khi cập nhật trạng thái: " + e.getMessage());
        }
    }

    // @GetMapping("/search")
    // public String searchOrder(@RequestParam(required = false) String code,
    // @RequestParam(required = false) String status, Model model) {

    // try {
    // List<Order> orders = orderService.searchOrder(code, status);
    // model.addAttribute("code", code);
    // model.addAttribute("status", status);
    // model.addAttribute("listOrders", orders);
    // return "HoaDon/hoa-don-admin";
    // } catch (Exception e) {
    // throw new RuntimeException("Failed to fetch order detail for code: " + code,
    // e);
    // }
    // }

}
