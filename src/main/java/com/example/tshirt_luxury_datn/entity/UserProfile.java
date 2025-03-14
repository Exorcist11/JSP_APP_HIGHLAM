package com.example.tshirt_luxury_datn.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "user_profiles")
public class UserProfile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, columnDefinition = "NVARCHAR(50)")
    private String fullName;

    @Column(nullable = false, columnDefinition = "NVARCHAR(50)")
    private String address;

    private String phoneNumber;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
}
