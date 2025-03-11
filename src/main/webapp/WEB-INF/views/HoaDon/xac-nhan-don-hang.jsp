<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T-Shirt Luxury</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="container">
<div class="row">
    <div class="p-2 bd-highlight d-flex justify-content-start mt-3">
        <a type="button" href="/t-shirt-luxury/admin/hoa-don-online" class="btn btn-outline-secondary">
            <i class="fa-solid fa-backward"></i> Trở lại
        </a>
    </div>
    <div class="col-4" >

        <div class="TTGH" style="margin-top: 60px;">
            <h5>Thông tin giao hàng</h5>
            <form action="/t-shirt-luxury/ban-hang-onl/createHD" method="post">
                <div class="mb-3">
                    <label>Họ và tên:</label>
                    <input readonly style="width: 450px; height: 50px;" class="form-control me-2"
                           placeholder="Họ và tên" name="hoVaTen" value="${thongTinNhanHang.hoVaTen}">
                </div>
                <div class="mb-3">
                    <label>Số điện thoại:</label>
                    <input readonly style="width: 450px;  height: 50px;" class="form-control me-2"
                           placeholder="Số điện thoại" name="soDienThoai" value="${thongTinNhanHang.soDienThoai}">
                </div>
                <div class="mb-3 ">
                    <label>Địa chỉ:</label>
                    <input readonly style="width: 450px;  height: 50px; " class="form-control me-2"
                           placeholder="Địa chỉ" name="diaChiNhanHang" value="${thongTinNhanHang.diaChiNhanHang}">
                </div>
                <div class="mb-3 ">
                    <label>Ghi Chú:</label>
                    <input readonly style="width: 450px;  height: 50px; " class="form-control me-2"
                           placeholder="Ghi Chú" name="ghiChu" value="${thongTinNhanHang.ghiChu}">

                </div>
            </form>
        </div>


        <div>
            <h5 class="fw-normal">Phương thức thanh toán</h5>
            <div class="d-flex">
                <input type="radio" value="1" checked name="trangThai">
                <p style="margin-left: 10px; margin-top: 13px;">Thanh toán khi nhận hàng(COD)</p>
            </div>
            <div class="d-flex">
                <input type="radio" value="1" checked name="trangThai">
                <p style="margin-left: 10px; margin-top: 13px;">Thanh toán trực tuyến</p>
            </div>
        </div>
        
    </div>
    <div class="col-1"></div>
    <div class="col-7 mt-3" style="background-color: rgb(247, 247, 247);" >
        <p></p>
        <form class="mt-3" action="/t-shirt-luxury/admin/hoa-don-online/xac-nhan-don" method="post">
            <table class="table">

                <thead>
                    <tr>
                        <th>Ảnh</th>
                        <th>Thông tin sản phẩm</th>
                        <th>Giá tiền</th>
                        <th class="text-center">Số Lượng</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="hd" items="${hoaDonChiTietOnline}">
                    <tr>
                        <td><img style="width: 80px; height: 100px; border-radius: 10%;" src="https://pos.nvncdn.com/be3159-662/ps/20241011_HyHQUS9NwA.jpeg" alt=""></td>
                        <td>${hd.sanPhamChiTiet.sanPham.tenSanPham} - ${hd.sanPhamChiTiet.mauSac.tenMauSac} - ${hd.sanPhamChiTiet.size.tenSize} </td>
                        <td><fmt:formatNumber value='${hd.sanPhamChiTiet.gia}' pattern="#,##0" />₫ </td>
                        <td class="text-center"> ${hd.soLuong} </td>
                        <td><fmt:formatNumber value='${hd.sanPhamChiTiet.gia * hd.soLuong}' pattern="#,##0" />₫ </td>
                    </tr>
                    <input type="text" hidden="hidden" name="idHoaDonXacNhan" value="${hd.hoaDon.id}">
                </c:forEach>
                </tbody>



            </table>

            <hr>
            <h5>Tóm tắt yêu cầu</h5>
<%--            <h6 class="fw-normal" >Áp dụng Voucher: ${voucherTrongHoaDon.voucher.tenVoucher}</h6>--%>
            <c:choose>
                <c:when test="${voucherTrongHoaDon.voucher != null && voucherTrongHoaDon.voucher.tenVoucher != null}">
                    <h6 class="fw-normal ms-3">Áp dụng Voucher: ${voucherTrongHoaDon.voucher.tenVoucher} (giảm ${voucherTrongHoaDon.voucher.giaTriGiam}%)</h6>
                    <p class="ms-3" >
                        Tổng phụ <fmt:formatNumber value="${giaTienBanDau}" type="currency" currencySymbol="₫" groupingUsed="true" />
                    </p>

                    <p class="ms-3" style="color:red;">
                    Chiết khấu <fmt:formatNumber value="${giaTienBanDau * (voucherTrongHoaDon.voucher.giaTriGiam / 100)}" type="currency" currencySymbol="₫" groupingUsed="true" />
                    </p>
                </c:when>
                <c:otherwise>
                    <h6 class="fw-normal ms-3 fst-italic">Khách hàng không áp dụng Voucher cho hóa đơn này!</h6>
                    <p class="ms-3" >
                        Tổng phụ <fmt:formatNumber value="${giaTienBanDau}" type="currency" currencySymbol="₫" groupingUsed="true" />
                    </p>
                </c:otherwise>
            </c:choose>

            <h6 class="fw-normal ms-3" >Phí vận chuyển: 35.000₫</h6>

            <hr>
            <div class="d-flex">
                <h5 class="fw-normal" >Tổng (${soSanPhamMua} mặt hàng) : </h5>
<%--                <input style="max-height: 30px;border: #f8f8f8" class="text-end" type="number" id="tongTienHoaDonOnl" name="tongTienHoaDonOnl"--%>
<%--                       value="<fmt:formatNumber value='${tongTien}' pattern="#,##0"/>"--%>
<%--                       readonly >--%>

                <p class="ms-3">
                    <fmt:formatNumber value="${tongTien}" type="currency" currencySymbol="₫" groupingUsed="true" /> (Đã bao gồm phí vận chuyển)
                </p>
            </div>

            <c:if test="${xacNhanHoaDonOnline == 2}">
                <button type="submit" style="margin-left: 400px; height: 45px; font-size: large;" class="btn btn-secondary"  onclick="return confirmOrder()">Xác nhận đơn hàng</button>
            </c:if>
            <c:if test="${xacNhanHoaDonOnline == 3}">
                <button type="submit" style="margin-left: 400px; height: 45px; font-size: large;" class="btn btn-success"  onclick="return confirmOrder()">Giao hàng thành công</button>
            </c:if>
    </form>
    </div>

</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    const decrementBtn = document.getElementById("decrement");
    const incrementBtn = document.getElementById("increment");
    const quantityInput = document.getElementById("quantity");

    // Xử lý khi nhấn nút Trừ (-)
    decrementBtn.addEventListener("click", () => {
        let currentValue = parseInt(quantityInput.value) || 0;
        if (currentValue > 0) {
            quantityInput.value = currentValue - 1;
        }
    });

    // Xử lý khi nhấn nút Cộng (+)
    incrementBtn.addEventListener("click", () => {
        let currentValue = parseInt(quantityInput.value) || 0;
        quantityInput.value = currentValue + 1;
    });

    // Đảm bảo giá trị nhập vào là số nguyên hợp lệ
    quantityInput.addEventListener("input", () => {
        quantityInput.value = quantityInput.value.replace(/[^0-9]/g, '');
    });

    function confirmOrder() {
        // Hiển thị hộp thoại xác nhận
        return confirm("Bạn có chắc chắn muốn xác nhận đơn hàng này?");
    }
</script>
</body>
</html>