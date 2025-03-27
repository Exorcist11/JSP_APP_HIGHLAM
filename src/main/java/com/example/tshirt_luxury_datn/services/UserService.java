package com.example.tshirt_luxury_datn.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.tshirt_luxury_datn.dto.UserDTO;
import com.example.tshirt_luxury_datn.dto.UserProfileDTP;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.entity.UserProfile;
import com.example.tshirt_luxury_datn.repository.UserProfileRepository;
import com.example.tshirt_luxury_datn.repository.UserRepository;

@Service
public class UserService {

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @Autowired
  private UserProfileRepository userProfileRepository;

  public User createUser(UserDTO userDTO) {
    try {
      Optional<User> existingUsername = userRepository.findByUsername(userDTO.getUsername());
      Optional<User> existingEmail = userRepository.findByEmail(userDTO.getEmail());
      if (existingEmail.isPresent()) {
        throw new IllegalArgumentException("Email is existing");
      }
      if (existingUsername.isPresent()) {
        throw new IllegalArgumentException("Username is existing");
      }

      User user = new User();
      user.setUsername(userDTO.getUsername());
      user.setEmail(userDTO.getEmail());
      user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
      user.setRole(userDTO.getRole());
      user.setStatus(true);
      return userRepository.save(user);
    } catch (Exception e) {
      throw new RuntimeException("Error when create user:  " + e.getMessage());
    }
  }

  public User updateUser(Long id, UserDTO userDTO) {
    try {
      Optional<User> user = userRepository.findById(id);
      if (!user.isPresent()) {
        throw new IllegalArgumentException("User không tồn tại!");
      }
      User userUpdate = user.get();
      userUpdate.setEmail(userDTO.getEmail());
      userUpdate.setPassword(passwordEncoder.encode(userDTO.getPassword()));
      userUpdate.setRole(userDTO.getRole());
      userUpdate.setStatus(userDTO.getStatus());

      return userRepository.save(userUpdate);
    } catch (Exception e) {
      throw new RuntimeException("Error when update user:  " + e.getMessage());
    }
  }

  public void deleteUser(Long id) {

    try {
      Optional<User> user = userRepository.findById(id);
      if (!user.isPresent()) {
        throw new IllegalArgumentException("User không tồn tại!");
      }

      User userDelete = user.get();
      userDelete.setStatus(false);
      userRepository.save(userDelete);
    } catch (Exception e) {
      throw new RuntimeException("Error when delete user:  " + e.getMessage());
    }
  }

  public User login(UserDTO loginDto) {
    Optional<User> userOpt = userRepository.findByUsername(loginDto.getUsername());

    if (userOpt.isPresent()) {
      User user = userOpt.get();
      if (passwordEncoder.matches(loginDto.getPassword(), user.getPassword())) {
        return user; // Đăng nhập thành công
      }
    }
    throw new IllegalArgumentException("Sai tài khoản hoặc mật khẩu!");
  }

  public User register(UserDTO userDTO) {

    Optional<User> existingUsername = userRepository.findByUsername(userDTO.getUsername());
    Optional<User> existingEmail = userRepository.findByEmail(userDTO.getEmail());
    if (existingEmail.isPresent()) {
      throw new IllegalArgumentException("Email is existing");
    }
    if (existingUsername.isPresent()) {
      throw new IllegalArgumentException("Username is existing");
    }
    User user = new User();
    user.setUsername(userDTO.getUsername());
    user.setEmail(userDTO.getEmail());
    user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
    user.setRole("USER");
    return userRepository.save(user);
  }

  public List<User> getListUser() {
    return userRepository.findAll();
  }

  public UserProfile getProfile(Long id) {
    Optional<UserProfile> profile = userProfileRepository.findById(id);
    if (profile.isPresent()) {
      return profile.get();
    }
    return null;
  }

  public UserProfile updateProfile(Long id, UserProfileDTP userProfileDTP) {
    try {
      Optional<User> user = userRepository.findById(id);
      if (!user.isPresent()) {
        throw new IllegalArgumentException("User không tồn tạo!");
      }
      UserProfile userProfile = new UserProfile();
      userProfile.setUser(user.get());
      userProfile.setAddress(userProfileDTP.getAddress());
      userProfile.setFullName(userProfileDTP.getFullName());
      userProfile.setPhoneNumber(userProfileDTP.getPhoneNumber());

      return userProfileRepository.save(userProfile);
    } catch (Exception e) {
      throw new RuntimeException("Lỗi khi tạo mới profile:  " + e.getMessage());
    }
  }
}
