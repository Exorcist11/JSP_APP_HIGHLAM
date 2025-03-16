package com.example.tshirt_luxury_datn.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
        .authorizeHttpRequests(auth -> auth
            .requestMatchers("/**").permitAll() // Cho phép truy cập tất cả các trang
        )
        .csrf(csrf -> csrf.disable()) // Tắt CSRF để tránh lỗi khi gửi form
        .formLogin(form -> form.disable()) // Tắt trang login mặc định
        .httpBasic(basic -> basic.disable()); // Tắt xác thực Basic

    return http.build();
  }
}
