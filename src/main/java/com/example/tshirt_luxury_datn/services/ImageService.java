package com.example.tshirt_luxury_datn.services;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.tshirt_luxury_datn.entity.ProductDetail;
import com.example.tshirt_luxury_datn.entity.ProductImage;
import com.example.tshirt_luxury_datn.repository.ProductImageRepository;

@Service
public class ImageService {
    @Autowired
    private ProductImageRepository productImageRepository;

    private static final String UPLOAD_DIR = System.getProperty("user.dir") + "/uploads";

    public void saveImage(MultipartFile file, ProductDetail productDetail) {
        try {
            if (file != null && !file.isEmpty()) {
                // Kiểm tra tên file nhận được
                System.out.println("Đang xử lý file: " + file.getOriginalFilename());

                // Tạo tên file duy nhất
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                File uploadPath = new File(UPLOAD_DIR);

                // Kiểm tra và tạo thư mục
                if (!uploadPath.exists()) {
                    uploadPath.mkdirs();
                    System.out.println("Đã tạo thư mục: " + UPLOAD_DIR);
                }

                // Lưu file vào thư mục
                File saveFile = new File(uploadPath, fileName);
                file.transferTo(saveFile);
                System.out.println("File đã lưu tại: " + saveFile.getAbsolutePath());

                // Lưu đường dẫn vào DB
                ProductImage image = new ProductImage();
                image.setImageUrl("/uploads/" + fileName);
                image.setProductDetail(productDetail);
                productImageRepository.save(image);
                System.out.println("Đã lưu ảnh vào database: " + image.getImageUrl());
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi chi tiết
            throw new RuntimeException("Lỗi khi lưu ảnh: " + e.getMessage());
        }
    }

    public List<ProductImage> getImagesByProductDetailId(Long productDetailId) {
        return productImageRepository.findByProductDetailId(productDetailId);
    }
 
    public List<String> getImageUrlsByProductId(Long productId) {
        List<ProductImage> images = productImageRepository.findByProductDetail_Product_Id(productId);
        return images.stream().map(ProductImage::getImageUrl).toList();
    }
}
