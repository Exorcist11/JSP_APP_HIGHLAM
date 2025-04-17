package com.example.tshirt_luxury_datn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.tshirt_luxury_datn.dto.UserProfileDTP;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.services.UserProfileService;

import jakarta.servlet.http.HttpSession;

import java.util.List;

@RestController
@RequestMapping("/api/profiles")
public class UserProfileController {
    @Autowired
    private UserProfileService userProfileService;

    @PostMapping
    public ResponseEntity<UserProfileDTP> addProfile(HttpSession session, @RequestBody UserProfileDTP dto) {
        return ResponseEntity.ok(userProfileService.addProfile(session, dto));
    }

    @GetMapping
    public ResponseEntity<List<UserProfileDTP>> getUserProfiles(HttpSession session) {
        return ResponseEntity.ok(userProfileService.getUserProfiles(session));
    }

    @PutMapping("/{profileId}")
    public ResponseEntity<UserProfileDTP> updateProfile(HttpSession session, @PathVariable Long profileId, @RequestBody UserProfileDTP dto) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            throw new IllegalStateException("User not logged in");
        }
        return ResponseEntity.ok(userProfileService.updateProfile(loggedInUser.getId(), profileId, dto));
    }

    @DeleteMapping("/{profileId}")
    public ResponseEntity<Void> deleteProfile(HttpSession session, @PathVariable Long profileId) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            throw new IllegalStateException("User not logged in");
        }
        userProfileService.deleteProfile(loggedInUser.getId(), profileId);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{profileId}/default")
    public ResponseEntity<Void> setDefaultProfile(HttpSession session, @PathVariable Long profileId) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            throw new IllegalStateException("User not logged in");
        }
        userProfileService.setDefaultProfile(loggedInUser.getId(), profileId);
        return ResponseEntity.ok().build();
    }
}