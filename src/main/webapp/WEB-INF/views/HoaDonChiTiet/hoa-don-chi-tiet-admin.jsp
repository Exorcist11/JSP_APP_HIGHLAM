<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T-Shirt Luxury | ADMIN | Chi tiết hoá đơn</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body style="max-width: 1476px">
<div  >
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <nav class="navbar navbar-light bg-light">
                    <div class="container">
                        <a class="navbar-brand" href="/t-shirt-luxury/admin">
                            <img src="${pageContext.request.contextPath}/images/logo.png" alt="" width="55" height="55"
                                 class="d-inline-block rounded-circle align-text-top" style="filter: brightness(0);">
                            <a class="fw-bold font-monospace" href="/t-shirt-luxury/admin"
                               style="text-decoration: none; color:black; font-size:23px">T-SHIRT
                                LUXURY </a>
                        </a>
                    </div>
                </nav>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    </ul>
                    <form class="d-flex">
                        <img src="${pageContext.request.contextPath}/images/user.jpg" class="rounded-circle" alt="..." width="40px" height="40px">
                        <div class="dropdown">
                            <button class="btn btn-outline-dark dropdown-toggle ms-2" type="button"
                                    id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="#"><i class="fa-solid fa-gear"></i> Cài đặt</a>
                                </li>
                                <li><a class="dropdown-item" href="/t-shirt-luxury/login" style="color: red;"><i
                                        class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </nav>
    </div>
    <div class="row" style="margin: 0px">
        <div class="p-2 bd-highlight d-flex justify-content-start mt-3">
            <a type="button" href="/t-shirt-luxury/admin/hoa-don" class="btn btn-outline-secondary">
                <i class="fa-solid fa-backward"></i> Trở lại
            </a>
        </div>
        <div class="row mt-2">
            <h2 class="">Hóa Đơn Chi Tiết</h2>
            <table class="table table-striped" style="margin-left: 13px; max-width: 1476px">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Mã Hóa Đơn Chi Tiết</th>
                    <th scope="col">Tên Sản Phẩm</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Số Lượng</th>
                    <th scope="col">Ngày Tạo</th>
<%--                    <th scope="col">Trạng Thái</th>--%>
<%--                    <th scope="col">Mô tả</th>--%>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listHDCTTaiQuay}" var="hdctOff" varStatus="i">
                    <tr>
                        <td>${i.index+1}</td>
                        <td>${hdctOff.maHoaDonChiTiet}</td>
                        <td>${hdctOff.sanPhamChiTiet.sanPham.tenSanPham}</td>
                        <td>${hdctOff.sanPhamChiTiet.gia}</td>
                        <td>${hdctOff.soLuong}</td>
                        <td>${hdctOff.ngayTao}</td>
<%--                        <td>Active</td>--%>
<%--                        <td>${hdctOff.ngayTao}</td>--%>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
        </div>
    </div>


    <!-- Modal update -->
    <div class="modal fade" id="suaNguoiDung" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Cập Nhật Người Dùng Chi Tiết</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Mã Sản Phẩm"
                               disabled readonly>
                        <label for="floatingInput">Họ và Tên</label>
                    </div>

                    <div>
                        <div class="text mt-2">
                            Trạng Thái
                        </div>
                        <div class="form-check form-check-inline mt-2">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"
                                   value="option1">
                            <label class="form-check-label" for="inlineRadio1">Hoạt Động</label>
                        </div>
                        <div class="form-check form-check-inline mt-2">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"
                                   value="option2">
                            <label class="form-check-label" for="inlineRadio2">Ngưng Hoạt Động</label>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Mô tả</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-success">Cập Nhật</button>
                </div>
            </div>
        </div>
    </div>

</body>

</html>