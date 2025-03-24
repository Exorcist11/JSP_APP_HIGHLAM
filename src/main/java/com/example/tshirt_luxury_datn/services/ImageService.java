package com.example.tshirt_luxury_datn.services;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.ProductImage;
import com.example.tshirt_luxury_datn.repository.ProductImageRepository;

@Service
public class ImageService {
    @Autowired
    private ProductImageRepository productImageRepository;

    private final Path uploadDir = Paths.get("X:/Tshirt_Luxury/uploads");

    public ProductImage saveImage(MultipartFile file, ProductDetail productDetail) {
        try {
            // Tạo thư mục nếu chưa tồn tại
            if (!Files.exists(uploadDir)) {
                Files.createDirectories(uploadDir);
            }

            // Kiểm tra kiểu file (chỉ cho phép ảnh)
            String contentType = file.getContentType();
            if (contentType == null || !contentType.startsWith("image/")) {
                throw new IllegalArgumentException("Chỉ cho phép upload file ảnh.");
            }

            // Xử lý tên file an toàn
            String originalFileName = file.getOriginalFilename();
            if (originalFileName == null) {
                throw new IllegalArgumentException("File name cannot be null.");
            }
            originalFileName = StringUtils.cleanPath(originalFileName);
            String fileName = System.currentTimeMillis() + "_" + originalFileName;
            Path filePath = uploadDir.resolve(fileName);

            // Lưu file vào thư mục
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            // Lưu thông tin vào database
            ProductImage productImage = new ProductImage();
            productImage.setImageUrl(fileName);
            productImage.setProductDetail(productDetail);

            return productImageRepository.save(productImage);
        } catch (IOException e) {
            throw new RuntimeException("Lỗi khi lưu ảnh: " + e.getMessage(), e);
        }
    }
}
