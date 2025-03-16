package com.example.tshirt_luxury_datn.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.tshirt_luxury_datn.dto.UserDTO;
import com.example.tshirt_luxury_datn.entity.User;
import com.example.tshirt_luxury_datn.repository.UserRepository;

@Service
public class UserService {
  @Autowired
  private UserRepository userRepository;

  @Autowired
  private PasswordEncoder passwordEncoder;

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
}
