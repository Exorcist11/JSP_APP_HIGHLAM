package com.example.tshirt_luxury_datn.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.tshirt_luxury_datn.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
        @Query("SELECT p FROM Product p WHERE " +
                        "(:timKiemSanPham IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :timKiemSanPham, '%'))) AND "
                        +
                        "(:trangThai IS NULL OR p.status = :trangThai)")
        Page<Product> searchProducts(@Param("timKiemSanPham") String timKiemSanPham,
                        @Param("trangThai") Boolean trangThai, Pageable pageable);

        List<Product> findTop4ByOrderByCreatedAtDesc();

        List<Product> findByNameContainingIgnoreCase(String name);

        List<Product> findByCategoryDetailId(Long categoryDetailId);

        List<Product> findByCategoryDetail_CategoryId(Long categoryId);

        @SuppressWarnings("null")
        Page<Product> findAll(Pageable pageable);

        @Query("SELECT p FROM Product p " +
                        "JOIN p.productDetails pd " +
                        "JOIN OrderItem oi ON oi.productDetail = pd " +
                        "WHERE p.status = true AND pd.status = true " +
                        "GROUP BY p " +
                        "ORDER BY SUM(oi.quantity) DESC")
        Page<Product> findBestSellingProductsSimple(Pageable pageable);

        @Query("SELECT SUM(oi.quantity) " +
                        "FROM Product p " +
                        "JOIN p.productDetails pd " +
                        "JOIN OrderItem oi ON oi.productDetail = pd " +
                        "WHERE p.id = :productId AND p.status = true AND pd.status = true")
        Long findTotalQuantitySoldByProductId(@Param("productId") Long productId);

        List<Product> findByNameContainingAndStatusTrue(String keyword);

        @Query("SELECT DISTINCT p FROM Product p " +
                        "LEFT JOIN p.productDetails pd " +
                        "WHERE (:colorIds IS NULL OR pd.color.id IN :colorIds) " +
                        "AND (:sizeIds IS NULL OR pd.size.id IN :sizeIds) " +
                        "AND (:minPrice IS NULL OR p.price >= :minPrice) " +
                        "AND (:maxPrice IS NULL OR p.price <= :maxPrice)")
        Page<Product> findFilteredProducts(@Param("colorIds") List<Long> colorIds,
                        @Param("sizeIds") List<Long> sizeIds,
                        @Param("minPrice") Double minPrice,
                        @Param("maxPrice") Double maxPrice,
                        Pageable pageable);

}
