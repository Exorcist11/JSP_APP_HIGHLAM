package com.example.tshirt_luxury_datn.entity;

import com.example.tshirt_luxury_datn.enums.OrderStatus;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    private Timestamp orderDate;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private OrderStatus status;

    @Column(nullable = false, unique = false, length = 50)
    private String guestEmail;

    @Column(nullable = false, unique = false, length = 50)
    private String code;

    @Column(nullable = false, columnDefinition = "NVARCHAR(50)")
    private String recipientName;

    @Column(nullable = false)
    private String recipientPhone;

    @Column(nullable = false, columnDefinition = "NVARCHAR(255)")
    private String recipientAddress;

    private String notes;

    @Column(nullable = false)
    private Double totalAmount;

    @CreationTimestamp
    @Column(nullable = false, updatable = false)
    private Timestamp createdAt;

    @UpdateTimestamp
    @Column(nullable = false)
    private Timestamp updatedAt;

    @Column(name = "discount_code")
    private String discountCode;

    @ManyToOne
    @JoinColumn(name = "discount_id", nullable = true)
    private Discount discount;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = true)
    private User user;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private List<OrderItem> orderItems;

    @Column(nullable = false)
    private String orderType;

    @Transient
    public String getVietnameseStatus() {
        return status != null ? status.getDisplayName() : "";
    }
}
