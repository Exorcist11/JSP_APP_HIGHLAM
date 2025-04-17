package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.UserProfileDTP;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.entity.UserProfile;
import com.example.tshirt_luxury_datn.repository.UserProfileRepository;
import com.example.tshirt_luxury_datn.repository.UserRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class UserProfileService {
    @Autowired
    private UserProfileRepository userProfileRepository;
    @Autowired
    private UserRepository userRepository;

    @Transactional
    public List<UserProfileDTP> getUserProfiles(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        List<UserProfile> profiles = userProfileRepository.findByUserId(loggedInUser.getId());
        return profiles.stream().map(this::toDTO).collect(Collectors.toList());
    }

    @Transactional
    public UserProfileDTP updateProfile(Long userId, Long profileId, UserProfileDTP dto) {
        UserProfile profile = userProfileRepository.findByIdAndUserId(profileId, userId)
                .orElseThrow(() -> new IllegalArgumentException("Profile not found"));

        // If updating to default, unset other defaults
        if (dto.getIsDefault() != null && dto.getIsDefault()) {
            userProfileRepository.unsetDefaultProfiles(userId);
        }

        profile.setFullName(dto.getFullName());
        profile.setDetail(dto.getDetail());
        profile.setPhoneNumber(dto.getPhoneNumber());
        profile.setProvinceCode(dto.getProvinceCode());
        profile.setProvinceName(dto.getProvinceName());
        profile.setDistrictCode(dto.getDistrictCode());
        profile.setDistrictName(dto.getDistrictName());
        profile.setWardCode(dto.getWardCode());
        profile.setWardName(dto.getWardName());
        profile.setIsDefault(dto.getIsDefault() != null ? dto.getIsDefault() : false);

        profile = userProfileRepository.save(profile);

        return toDTO(profile);
    }

    @Transactional
    public UserProfileDTP addProfile(HttpSession session, UserProfileDTP dto) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        User user = userRepository.findById(loggedInUser.getId())
                .orElseThrow(() -> new IllegalArgumentException("User not found"));

        // If new profile is default, unset other defaults
        if (dto.getIsDefault() != null && dto.getIsDefault()) {
            userProfileRepository.unsetDefaultProfiles(loggedInUser.getId());
        }

        UserProfile profile = new UserProfile();
        profile.setFullName(dto.getFullName());
        profile.setDetail(dto.getDetail());
        profile.setPhoneNumber(dto.getPhoneNumber());
        profile.setProvinceCode(dto.getProvinceCode());
        profile.setProvinceName(dto.getProvinceName());
        profile.setDistrictCode(dto.getDistrictCode());
        profile.setDistrictName(dto.getDistrictName());
        profile.setWardCode(dto.getWardCode());
        profile.setWardName(dto.getWardName());
        profile.setIsDefault(dto.getIsDefault() != null ? dto.getIsDefault() : false);
        profile.setUser(user);

        profile = userProfileRepository.save(profile);

        return toDTO(profile);
    }

    @Transactional
    private UserProfileDTP toDTO(UserProfile profile) {
        UserProfileDTP dto = new UserProfileDTP();
        dto.setId(profile.getId());
        dto.setFullName(profile.getFullName());
        dto.setDetail(profile.getDetail());
        dto.setPhoneNumber(profile.getPhoneNumber());
        dto.setProvinceCode(profile.getProvinceCode());
        dto.setProvinceName(profile.getProvinceName());
        dto.setDistrictCode(profile.getDistrictCode());
        dto.setDistrictName(profile.getDistrictName());
        dto.setWardCode(profile.getWardCode());
        dto.setWardName(profile.getWardName());
        dto.setIsDefault(profile.getIsDefault());
        return dto;
    }

    @Transactional
    public void setDefaultProfile(Long userId, Long profileId) {
        userProfileRepository.unsetDefaultProfiles(userId);
        UserProfile profile = userProfileRepository.findByIdAndUserId(profileId, userId)
                .orElseThrow(() -> new IllegalArgumentException("Profile not found"));
        profile.setIsDefault(true);
        userProfileRepository.save(profile);
    }
    
    @Transactional
    public void deleteProfile(Long userId, Long profileId) {
        UserProfile profile = userProfileRepository.findByIdAndUserId(profileId, userId)
                .orElseThrow(() -> new IllegalArgumentException("Profile not found"));
        userProfileRepository.delete(profile);
    }
}
