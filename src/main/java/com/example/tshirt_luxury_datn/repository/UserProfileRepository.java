package com.example.tshirt_luxury_datn.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.UserProfile;

@Repository
public interface UserProfileRepository extends JpaRepository<UserProfile, Long> {
    List<UserProfile> findByUserId(Long userId);
  
    Optional<UserProfile> findByIdAndUserId(Long id, Long userId);

    @Modifying
    @Query("UPDATE UserProfile p SET p.isDefault = false WHERE p.user.id = :userId")
    void unsetDefaultProfiles(@Param("userId") Long userId);
}
