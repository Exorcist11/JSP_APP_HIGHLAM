package com.example.tshirt_luxury_datn.services;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
                // Kiểm tra xem đã có ảnh cho product detail này chưa
                ProductImage existingImage = productImageRepository.findByProductDetailId(productDetail.getId());
                if (existingImage != null) {
                    // Nếu đã có, sử dụng phương thức updateImage để cập nhật
                    System.out.println(
                            "Đã tồn tại ảnh cho ProductDetail ID: " + productDetail.getId() + ", chuyển sang cập nhật");
                    updateImage(file, productDetail);
                    return;
                }

                // Kiểm tra tên file nhận được
                System.out.println("Đang xử lý file: " + file.getOriginalFilename());

                // Tạo tên file duy nhất
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                File uploadPath = new File(UPLOAD_DIR);

                // Kiểm tra và tạo thư mục
                if (!uploadPath.exists()) {
                    boolean created = uploadPath.mkdirs();
                    if (!created) {
                        System.out.println("Không thể tạo thư mục: " + UPLOAD_DIR);
                        throw new RuntimeException("Không thể tạo thư mục uploads");
                    }
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

                // Kiểm tra ProductDetail
                if (productDetail == null || productDetail.getId() == null) {
                    throw new IllegalArgumentException("ProductDetail không hợp lệ");
                }

                ProductImage savedImage = productImageRepository.save(image);
                if (savedImage == null || savedImage.getId() == null) {
                    throw new RuntimeException("Không thể lưu ảnh vào database");
                }
                System.out.println(
                        "Đã lưu ảnh vào database với ID: " + savedImage.getId() + ", URL: " + savedImage.getImageUrl());
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi chi tiết
            throw new RuntimeException("Lỗi khi lưu ảnh: " + e.getMessage());
        }
    }

    @Transactional
    public void updateImage(MultipartFile file, ProductDetail productDetail) {
        try {
            // Kiểm tra ProductDetail
            if (productDetail == null || productDetail.getId() == null) {
                throw new IllegalArgumentException("ProductDetail không hợp lệ");
            }

            // Tìm ảnh hiện tại bằng product_detail_id
            ProductImage existingImage = productImageRepository.findByProductDetailId(productDetail.getId());

            if (file != null && !file.isEmpty()) {
                // Validate file type
                if (!file.getContentType().startsWith("image/")) {
                    throw new IllegalArgumentException("File phải là hình ảnh.");
                }

                // Create unique file name
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                File uploadPath = new File(UPLOAD_DIR);

                // Create upload directory if it doesn't exist
                if (!uploadPath.exists()) {
                    boolean created = uploadPath.mkdirs();
                    if (!created) {
                        System.out.println("Không thể tạo thư mục: " + UPLOAD_DIR);
                        throw new RuntimeException("Không thể tạo thư mục uploads");
                    }
                    System.out.println("Đã tạo thư mục: " + UPLOAD_DIR);
                }

                // Lưu tên file và đường dẫn để sử dụng sau này
                String newImageUrl = "/uploads/" + fileName;
                File saveFile = new File(uploadPath, fileName);

                // Lưu thông tin file cũ để xóa sau khi transaction thành công
                String oldFilePath = null;
                if (existingImage != null) {
                    oldFilePath = existingImage.getImageUrl().replace("/uploads/", "");
                }

                // Xóa bản ghi cũ trong database nếu tồn tại
                if (existingImage != null) {
                    try {
                        // Chỉ xóa bản ghi trong database, chưa xóa file
                        Long existingImageId = existingImage.getId();
                        productImageRepository.deleteById(existingImageId);
                        // Xóa từ persistence context để đảm bảo không còn cache
                        productImageRepository.flush();
                        System.out.println("Đã xóa record ảnh cũ trong database với ID: " + existingImageId);
                    } catch (Exception e) {
                        System.out.println("Lỗi khi xóa ảnh cũ: " + e.getMessage());
                        e.printStackTrace();
                        throw new RuntimeException("Lỗi khi xóa ảnh cũ: " + e.getMessage());
                    }
                }

                // Save new file to disk
                file.transferTo(saveFile);

                // Tạo và lưu ảnh mới
                ProductImage newImage = new ProductImage();
                newImage.setImageUrl(newImageUrl);
                newImage.setProductDetail(productDetail);

                try {
                    ProductImage savedImage = productImageRepository.save(newImage);
                    productImageRepository.flush(); // Đảm bảo lưu ngay lập tức

                    if (savedImage == null || savedImage.getId() == null) {
                        throw new RuntimeException("Không thể lưu ảnh mới vào database");
                    }
                    System.out.println("Đã lưu ảnh mới vào database với ID: " + savedImage.getId() + ", URL: "
                            + savedImage.getImageUrl());

                    // Xóa file cũ sau khi đã cập nhật thành công
                    if (oldFilePath != null) {
                        File oldFile = new File(uploadPath, oldFilePath);
                        if (oldFile.exists()) {
                            boolean deleted = oldFile.delete();
                            System.out.println("Kết quả xóa file cũ: " + (deleted ? "thành công" : "thất bại"));
                        } else {
                            System.out.println("File cũ không tồn tại tại đường dẫn: " + oldFile.getAbsolutePath());
                        }
                    }

                } catch (Exception e) {
                    System.out.println("Lỗi khi lưu ảnh mới vào database: " + e.getMessage());
                    e.printStackTrace();
                    // Xóa file mới đã lưu vì không lưu được vào DB
                    if (saveFile.exists()) {
                        saveFile.delete();
                        System.out.println("Đã xóa file mới do không lưu được vào DB");
                    }
                    throw new RuntimeException("Không thể lưu ảnh mới vào database: " + e.getMessage());
                }
            } else {
                // No new file provided; retain existing image
                if (existingImage == null) {
                    System.out.println("Không có ảnh mới và không có ảnh cũ để giữ.");
                } else {
                    System.out.println("Giữ lại ảnh hiện tại: " + existingImage.getImageUrl());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("IOException: " + e.getMessage());
            throw new RuntimeException("Lỗi I/O khi cập nhật ảnh: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception: " + e.getMessage());
            throw new RuntimeException("Lỗi khi cập nhật ảnh: " + e.getMessage());
        }
    }

    public ProductImage getImageByProductDetailId(Long productDetailId) {
        return productImageRepository.findByProductDetailId(productDetailId);
    }
}