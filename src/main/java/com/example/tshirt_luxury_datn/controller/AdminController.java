package com.example.tshirt_luxury_datn.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.tshirt_luxury_datn.entity.Order;
import com.example.tshirt_luxury_datn.entity.Product;
import com.example.tshirt_luxury_datn.services.DashboardService;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private DashboardService dashboardService;

    @GetMapping("/dashboard")
    public String showDashboard(Model model) {

        model.addAttribute("totalProducts", dashboardService.getTotalProducts());
        model.addAttribute("totalRevenue", dashboardService.getTotalRevenue());
        model.addAttribute("totalCustomers", dashboardService.getTotalCustomers());
        model.addAttribute("totalOrders", dashboardService.getTotalOrders());

        Map<String, Long> orderStatusStats = dashboardService.getOrderStatusStats();
        model.addAttribute("orderStatusStats", orderStatusStats);

        // Đơn hàng gần đây
        List<Order> recentOrders = dashboardService.getRecentOrders();
        model.addAttribute("recentOrders", recentOrders);

        // Sản phẩm bán chạy
        // List<Product> topProducts = dashboardService.getTopSellingProducts();
        // model.addAttribute("topProducts", topProducts);

        return "admin/dashboard";
    }
}
