package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.SanPham;
import com.example.tshirt_luxury_datn.entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Date;
import java.util.List;

public interface voucherRepository extends JpaRepository<Voucher, Integer> {
    @Query(value = "SELECT * FROM voucher ORDER BY ngay_bat_dau DESC", nativeQuery = true)
    List<Voucher> findAllVoucherByNgayTaoDesc();

    @Query(value = "select * from dbo.voucher vc where vc.muc_chi_toi_thieu <= :tongTien", nativeQuery = true)
    List<Voucher> listVoucher(@Param("tongTien") Float tongTien);

    @Query(value = "select gia_tri_giam from voucher where id = :idVoucher\n", nativeQuery = true)
    Integer getGiaTriGiam(@Param("idVoucher")Integer idVoucher);

    @Query("SELECT v FROM Voucher v WHERE v.ngayKetThuc < :currentDate AND v.trangThai = :status")
    List<Voucher> findExpiredVouchers(@Param("currentDate") LocalDate currentDate, @Param("status") Integer status);

    @Query("SELECT v FROM Voucher v WHERE v.ngayKetThuc > :currentDate AND v.trangThai = :status")
    List<Voucher> findActiveVouchers(@Param("currentDate") LocalDate currentDate, @Param("status") Integer status);

    @Query(value = "SELECT * FROM voucher WHERE ten_voucher LIKE %:keyWord% "
            + "AND (:trangThai IS NULL OR trang_thai = :trangThai) "
            + "AND (:ngayBatDau IS NULL OR ngay_bat_dau >= :ngayBatDau) "
            + "AND (:ngayKetThuc IS NULL OR ngay_ket_thuc <= :ngayKetThuc)", nativeQuery = true)
    List<Voucher> timKiemVoucher(
            @Param("keyWord") String keyWord,
            @Param("trangThai") Integer trangThai,
            @Param("ngayBatDau") Date ngayBatDau,
            @Param("ngayKetThuc") Date ngayKetThuc);


}
