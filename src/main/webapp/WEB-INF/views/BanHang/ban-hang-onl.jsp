<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="container">
<div class="row">
    <div class="col-6 mt-5" >
        <a href="" style="text-decoration: none;">Giỏ hàng > </a>  Thanh toán

        <div class="TTGH" style="margin-top: 60px;">
            <h5>Thông tin giao hàng</h5>
            <form action="/t-shirt-luxury/ban-hang-onl/createHD" method="post">
                <div class="mb-3">
                    <input style="width: 600px; height: 50px;" class="form-control me-2"
                           placeholder="Họ và tên" name="hoVaTen">
                </div>
                <div class="mb-3">
                    <input style="width: 600px;  height: 50px;" class="form-control me-2"
                           placeholder="Số điện thoại" name="soDienThoai">
                </div>
                <div class="mb-3 ">
                    <input style="width: 600px;  height: 50px; " class="form-control me-2"
                           placeholder="Địa chỉ" name="diaChiNhanHang">
                </div>
                <div class="mb-3 ">
                        <textarea style="width: 600px; height: 100px;" class="form-control me-2"
                                  placeholder="Ghi chú"  name="ghiChu"></textarea>
                </div>
                <button style="margin-left: 400px; height: 45px; font-size: large;" class="btn btn-secondary">Hoàn tất đơn hàng</button>
                
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

        <form action="/pay" method="get">
            <button id="vnPay" type="submit" style="margin-left: 400px; height: 45px; font-size: large;" class="btn btn-secondary">Thanh toán VNPay</button>
            <script>
                document.getElementById("vnPay").addEventListener("click", function(){
                    fetch('/pay')
                        .then(response => response.text())
                        .then(url => {
                            window.location.href = url; // Điều hướng đến URL trả về từ server
                        });
                });
            </script>
        </form>
    </div>
    <div class="col-6 mt-3" style="background-color: rgb(247, 247, 247);" >
        <form action="/t-shirt-luxury/ban-hang-onl/getVoucher" method="get">
            <div class="voucher d-flex">
                <select style="width: 300px;" class="form-select" aria-label="Default select example" name="idVoucher">
                    <c:forEach var="vc" items="${voucher}">
                        <option value="${vc.id}" >${vc.tenVoucher}</option>
                    </c:forEach>
                </select>
                <button type="submit" style="margin-left: 20px;" class="btn btn-secondary">Áp dụng</button>
            </div>
        </form>
        <form class="mt-3" action="/t-shirt-luxury/ban-hang-onl/doneHD" method="post">
        <table class="table">

            <tbody>
            <c:forEach var="bh" items="${banHang}">
            <tr>
                <td><img style="width: 80px; height: 100px; border-radius: 10%;" src="https://pos.nvncdn.com/be3159-662/ps/20241011_HyHQUS9NwA.jpeg" alt=""></td>
                <td>${bh.sanPhamChiTiet.sanPham.tenSanPham} - ${bh.sanPhamChiTiet.mauSac.tenMauSac} - ${bh.sanPhamChiTiet.size.tenSize} </td>
                <td><fmt:formatNumber value='${bh.sanPhamChiTiet.gia * bh.soLuong}' pattern="#,##0" />₫ </td>
                <td><div class="ms-auto d-flex align-items-center">
                    <a href="/t-shirt-luxury/ban-hang-onl/subtract?id=${bh.id}" class="btn btn-outline-secondary btn-sm" id="decrement">-</a>
                    <input min="1"
                            class="form-control text-center mx-2"
                            style="width: 50px"
                            type="text"
                            value="${bh.soLuong}"
                            id="quantity"
                    />
                    <a href="/t-shirt-luxury/ban-hang-onl/plus?id=${bh.id}" class="btn btn-outline-secondary btn-sm" id="increment">+</a>
                </div>
                </td>
            </tr>
            </c:forEach>
            </tbody>

        </table>

        <hr>
        <h6 class="fw-normal" >Phí vận chuyển: 35000₫</h6>
        <hr>
        <div class="d-flex">
        <h5 class="fw-normal" >Tổng cộng: </h5>
        <input style="max-height: 30px;border: #f8f8f8" class="text-end" type="text" id="tongTienHoaDonOnl" name="tongTienHoaDonOnl"
               value="<fmt:formatNumber value='${tongTienGioHang - (tongTienGioHang * giaTriGiam / 100) + 35000}' pattern="#,##0"/>"
               readonly/>
        </div>
        <button type="submit" style="margin-left: 400px; height: 45px; font-size: large;" class="btn btn-secondary">Hoàn tất đơn hàng</button>
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
</script>
</body>
</html>