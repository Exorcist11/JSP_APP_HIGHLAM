package com.example.tshirt_luxury_datn.services;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
            e.printStackTrace();
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

            Long productDetailId = productDetail.getId();
            // Tìm tất cả ảnh liên quan đến product_detail_id để lấy đường dẫn file cũ
            List<ProductImage> existingImages = productImageRepository.findAllByProductDetailId(productDetailId);
            List<String> oldFilePaths = new ArrayList<>();

            // Lưu đường dẫn file cũ
            if (!existingImages.isEmpty()) {
                for (ProductImage image : existingImages) {
                    oldFilePaths.add(image.getImageUrl().replace("/uploads/", ""));
                    System.out.println("Tìm thấy ảnh cũ với ID: " + image.getId() + ", URL: " + image.getImageUrl());
                }
            } else {
                System.out.println("Không tìm thấy ảnh cũ nào cho product_detail_id: " + productDetailId);
            }

            // Xóa tất cả ảnh cũ trong database bằng phương thức tùy chỉnh
            try {
                int deletedCount = productImageRepository.deleteByProductDetailId(productDetailId);
                productImageRepository.flush(); // Đảm bảo xóa ngay lập tức
                System.out.println("Đã xóa " + deletedCount + " bản ghi cũ trong database cho product_detail_id: " + productDetailId);
            } catch (Exception e) {
                System.out.println("Lỗi khi xóa ảnh cũ: " + e.getMessage());
                e.printStackTrace();
                throw new RuntimeException("Lỗi khi xóa ảnh cũ: " + e.getMessage());
            }

            // Xử lý ảnh mới nếu có file được gửi lên
            if (file != null && !file.isEmpty()) {
                // Validate file type
                if (!file.getContentType().startsWith("image/")) {
                    throw new IllegalArgumentException("File phải là hình ảnh.");
                }

                // Tạo tên file duy nhất
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                File uploadPath = new File(UPLOAD_DIR);

                // Tạo thư mục uploads nếu chưa tồn tại
                if (!uploadPath.exists()) {
                    boolean created = uploadPath.mkdirs();
                    if (!created) {
                        System.out.println("Không thể tạo thư mục: " + UPLOAD_DIR);
                        throw new RuntimeException("Không thể tạo thư mục uploads");
                    }
                    System.out.println("Đã tạo thư mục: " + UPLOAD_DIR);
                }

                // Lưu file mới lên disk
                String newImageUrl = "/uploads/" + fileName;
                File saveFile = new File(uploadPath, fileName);
                file.transferTo(saveFile);
                System.out.println("Đã lưu file mới tại: " + saveFile.getAbsolutePath());

                // Tạo và lưu bản ghi ảnh mới vào database
                ProductImage newImage = new ProductImage();
                newImage.setImageUrl(newImageUrl);
                newImage.setProductDetail(productDetail);

                try {
                    ProductImage savedImage = productImageRepository.save(newImage);
                    productImageRepository.flush(); // Đảm bảo lưu ngay lập tức
                    System.out.println("Đã lưu ảnh mới vào database với ID: " + savedImage.getId() + ", URL: " + savedImage.getImageUrl());

                    // Xóa các file ảnh cũ trên disk sau khi lưu ảnh mới thành công
                    for (String oldFilePath : oldFilePaths) {
                        File oldFile = new File(uploadPath, oldFilePath);
                        if (oldFile.exists()) {
                            boolean deleted = oldFile.delete();
                            System.out.println("Xóa file cũ (" + oldFilePath + "): " + (deleted ? "thành công" : "thất bại"));
                        } else {
                            System.out.println("File cũ không tồn tại tại: " + oldFile.getAbsolutePath());
                        }
                    }
                } catch (Exception e) {
                    System.out.println("Lỗi khi lưu ảnh mới: " + e.getMessage());
                    e.printStackTrace();
                    // Xóa file mới trên disk nếu không lưu được vào database
                    if (saveFile.exists()) {
                        saveFile.delete();
                        System.out.println("Đã xóa file mới do lỗi lưu database");
                    }
                    throw new RuntimeException("Không thể lưu ảnh mới: " + e.getMessage());
                }
            } else {
                System.out.println("Không có file ảnh mới được gửi lên.");
            }
        } catch (IOException e) {
            System.out.println("Lỗi I/O: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Lỗi I/O khi cập nhật ảnh: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Lỗi: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi cập nhật ảnh: " + e.getMessage());
        }
    }

    public ProductImage getImageByProductDetailId(Long productDetailId) {
        return productImageRepository.findByProductDetailId(productDetailId);
    }
}