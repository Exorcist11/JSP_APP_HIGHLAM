package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.SanPhamChiTiet;
import com.example.tshirt_luxury_datn.response.MauSacReponse;
import com.example.tshirt_luxury_datn.response.SizeReponse;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface sanPhamChiTietRepository extends JpaRepository<SanPhamChiTiet, Integer> {

    @Query("SELECT new com.example.tshirt_luxury_datn.response.MauSacReponse(spct.mauSac.id, MAX(ms.tenMauSac)) " +
            "FROM MauSac ms " +
            "JOIN SanPhamChiTiet spct ON spct.mauSac.id = ms.id " +
            "WHERE spct.sanPham.id = :idSanPham " +
            "GROUP BY spct.mauSac.id")
    List<MauSacReponse> findMauSacBySanPhamId(@Param("idSanPham") Integer idSanPham);

    @Query("SELECT new com.example.tshirt_luxury_datn.response.SizeReponse(spct.size.id, MAX(s.tenSize)) " +
            "FROM Size s " +
            "JOIN SanPhamChiTiet spct ON spct.size.id = s.id " +
            "WHERE spct.sanPham.id = :idSanPham " +
            "GROUP BY spct.size.id")
    List<SizeReponse> findSizesBySanPhamId(@Param("idSanPham") Integer idSanPham);

    @Query("SELECT spct FROM SanPhamChiTiet spct WHERE spct.mauSac.id = :idMauSac AND spct.size.id = :idSize")
    List<SanPhamChiTiet> findByMauSacAndSize(@Param("idMauSac") Integer idMauSac, @Param("idSize") Integer idSize);
}
