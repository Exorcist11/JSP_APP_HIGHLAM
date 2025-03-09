package com.example.tshirt_luxury_datn.repository;

import com.example.tshirt_luxury_datn.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface hoaDonRepository extends JpaRepository<HoaDon, Integer> {

    @Query(value = "\n" +
            "\n" +
            "select SUM(so_luong) from dbo.hoa_don_chi_tiet hdct \n" +
            "join hoa_don hd on hd.id = hdct.id_hoa_don\n" +
            "            where hd.id = :idHoaDon AND hd.trang_thai = 0", nativeQuery = true)
    Integer soLuongSanPhamMua(@Param("idHoaDon") Integer idHoaDon);


    @Query(value = "\n" +
            "select SUM(spct.gia * hdct.so_luong) from dbo.hoa_don_chi_tiet hdct\n" +
            "join dbo.san_pham_chi_tiet spct on spct.id = hdct.id_san_pham_chi_tiet\n"+
            "join  hoa_don hd on hd.id = hdct.id_hoa_don\n"+
            "where id_hoa_don = :idHoaDon AND hd.trang_thai = 0", nativeQuery = true)
    Float tongTien(@Param("idHoaDon") Integer idHoaDon);

    @Query(value = "\n" +
            "select * from dbo.hoa_don hd \n" +
            " order by hd.ngay_tao desc",nativeQuery = true)
    List<HoaDon> selectHoaDon();



    @Query(value = "select " +

            "(hd.tong_tien - (hd.tong_tien * vc.gia_tri_giam / 100)) \n" +
            "    FROM\n" +
            "    dbo.hoa_don hd\n" +
            "    JOIN\n" +
            "    dbo.voucher vc ON hd.id_voucher = vc.id\n" +
            "            WHERE\n" +
            "    hd.id = :idHD",nativeQuery = true)
    Float giamHoaDon( @Param("idHD")Integer idHD);

    @Query(value = "\n" +
            "SELECT TOP 1 trang_thai\n" +
            "FROM dbo.hoa_don " +
            "ORDER BY ngay_tao DESC;\n", nativeQuery = true)
    Integer getTrangThaiDaThanhToan();

    @Query(value = "\n" +
            "SELECT TOP 1 trang_thai\n" +
            "FROM dbo.hoa_don " +
            "where loai_hoa_don = 1\n" +
            "ORDER BY ngay_tao DESC;\n\n", nativeQuery = true)
    Integer getTrangThaiHoaDonOnline();

    @Query(value = "DELETE FROM hoa_don_chi_tiet WHERE id_hoa_don = :idHoaDon", nativeQuery = true)
    Integer huyHoaDon(@Param("idHoaDon") Integer idHoaDon);

    @Query(value = "select * from hoa_don where loai_hoa_don = 0 order by ngay_tao DESC",nativeQuery = true)
    List<HoaDon> getHoaDonTaiQuay();

    @Query(value = "select * from hoa_don where loai_hoa_don = 1 order by ngay_tao DESC",nativeQuery = true)
    List<HoaDon> getHoaDonOnline();

    @Query(value = "select id_thong_tin_nhan_hang from hoa_don where id = :idHoaDon",nativeQuery = true)
    Integer getThongTinDonHang (@Param("idHoaDon") Integer idHoaDon);

    @Query(value = "select tong_tien from hoa_don where id = :idHoaDon",nativeQuery = true )
    Float tongTienHoaDonOnline(@Param("idHoaDon") Integer idHoaDon );

//    @Query(value = "select id_voucher from hoa_don where id = :idHoaDon",nativeQuery = true)
//    Integer getVoucherTrongHoaDon (@Param("idHoaDon") Integer idHoaDon);

    @Query(value = "SELECT TOP 1 ma_hoa_don FROM hoa_don ORDER BY ma_hoa_don DESC", nativeQuery = true)
    String findLastMaHoaDon();

    @Query(value = "SELECT SUM(san_pham_chi_tiet.gia * hoa_don_chi_tiet.so_luong) FROM hoa_don_chi_tiet\n" +
            "JOIN san_pham_chi_tiet ON hoa_don_chi_tiet.id_san_pham_chi_tiet = san_pham_chi_tiet.id WHERE id_hoa_don = :idHoaDon",
            nativeQuery = true)
    Float tongGiaBanDau(@Param("idHoaDon") Integer idHoaDon);

    @Query(value = "SELECT COUNT(*)\n" +
            "FROM hoa_don_chi_tiet\n" +
            "WHERE id_hoa_don = :idHoaDon",nativeQuery = true)
    Integer getSoLuongSanPhamMua (@Param("idHoaDon") Integer idHoaDon);

    @Query(value = "select trang_thai from hoa_don WHERE trang_thai = :trangThai AND id = :idHoaDon", nativeQuery = true)
    Integer getHoaDonTrangThai(@Param("idHoaDon") Integer idHoaDon, @Param("trangThai") Integer trangThai);

    @Query(value = "select trang_thai from hoa_don WHERE  id = :idHoaDon", nativeQuery = true)
    Integer getHoaDonTrangThai1(@Param("idHoaDon") Integer idHoaDon);

    @Query(value = "SELECT ho, ten_dem, ten FROM nguoi_dung_chi_tiet WHERE so_dien_thoai = :soDienThoai", nativeQuery = true)
    String getHoVaTenKhachHang(@Param("soDienThoai") String soDienThoai);

    @Query(value = "SELECT so_dien_thoai FROM nguoi_dung_chi_tiet WHERE so_dien_thoai = :soDienThoai", nativeQuery = true)
    String getSoDienThoai(@Param("soDienThoai") String soDienThoai);

    @Query(value = "SELECT id_nguoi_dung FROM nguoi_dung_chi_tiet WHERE so_dien_thoai = :soDienThoai", nativeQuery = true)
    Integer getIdNguoiDung(@Param("soDienThoai") String soDienThoai);
}