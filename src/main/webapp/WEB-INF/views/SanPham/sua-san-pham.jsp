<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T-Shirt Luxury | ADMIN</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="../js/script.js"></script>
</head>

<body>
<div>
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


    <div class="row mt-3 ">
        <div class="col-3 " style="">
            <div class="list-group ">
                <a href="/t-shirt-luxury/admin" class="list-group-item list-group-item-action action" aria-current="true">
                    <i class="fa-solid fa-house"></i> Trang Chủ
                </a>
                <a href="#" class="list-group-item list-group-item-action"> <i
                        class="fa-solid fa-chart-simple"></i> Số Liệu Thống Kê</a>
                <a href="/t-shirt-luxury/admin/nguoi-dung" class="list-group-item list-group-item-action"><i
                        class="fa-solid fa-users-gear"></i>
                    Quản Lý Người Dùng</a>
                <a href="/t-shirt-luxury/admin/hoa-don" class="list-group-item list-group-item-action"><i
                        class="fa-solid fa-money-bill-transfer"></i> Quản Lý Hóa Đơn</a>

                <a href="/t-shirt-luxury/admin/san-pham" class="list-group-item list-group-item-action"><i
                        class="fa-solid fa-shirt"></i> Quản Lý Sản Phẩm</a>
                <a href="/t-shirt-luxury/admin/voucher" class="list-group-item list-group-item-action"><i
                        class="fa-solid fa-ticket"></i> Quản Lý Voucher</a>
                <a href="/t-shirt-luxury/admin/giam-gia" class="list-group-item list-group-item-action"><i
                        class="fa-brands fa-salesforce"></i> Quản Lý Giảm Giá</a>

                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1"
                            data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-wand-magic-sparkles"></i> Quản Lý Thuộc Tính
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/mau-sac"><i class="fa-solid fa-palette"></i> Màu
                            Sắc</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/size"><i class="fa-solid fa-s"></i> Size</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/chat-lieu"><i class="fa-solid fa-star"></i> Chất
                            Liệu</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/danh-muc"><i class="fa-solid fa-table-list"></i> Danh
                            Mục</a></li>
                        <li><a class="dropdown-item" href="/t-shirt-luxury/admin/anh-san-pham"><i class="fa fa-image"></i> Ảnh Sản Phẩm</a></li>
                    </ul>
                </div>
                <a href="#" class="list-group-item list-group-item-action"><i class="fa-solid fa-wallet"></i> Ví</a>
            </div>
        </div>
        <div class="col-9" style="">
            <div class="row">
                <h2 class="">Sửa Sản Phẩm</h2>
                <form action="/t-shirt-luxury/admin/updateSanPham?id=${sanPham.id}" method="POST">
                    <div>


            </div>
            <div class="modal-body">
                <!-- Mã Sản Phẩm -->
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInputMaSanPham" placeholder="Mã Sản Phẩm" name="maSanPham" value="${sanPham.maSanPham}">
                    <label for="floatingInputMaSanPham">Mã Sản Phẩm</label>
                </div>

                <!-- Tên Sản Phẩm -->
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInputTenSanPham" placeholder="Tên Sản Phẩm" name="tenSanPham" value="${sanPham.tenSanPham}">
                    <label for="floatingInputTenSanPham">Tên Sản Phẩm</label>
                </div>

                <!-- Danh Mục Sản Phẩm -->
                    <label for="floatingInputTenSanPham">Tên Danh Mục</label>
                    <select class="form-select" aria-label="Default select example" name="danhMuc.id">

                        <c:forEach items="${danhMuc}" var="s">
                            <option value="${s.id}" ${sanPham.danhMuc.tenDanhMuc.equals(s.tenDanhMuc) ? 'selected':''}>${s.tenDanhMuc}</option>
                        </c:forEach>

                    </select>


                <!-- Trạng Thái -->
                <div>
                    <div class="text mt-2">Trạng Thái</div>
                    <div class="form-check form-check-inline mt-2">
                        <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1" value="1"
                        ${sanPham.trangThai == 1 ? 'checked' :''}>
                        <label class="form-check-label" for="inlineRadio1">Còn Hàng</label>
                    </div>
                    <div class="form-check form-check-inline mt-2">
                        <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio2" value="0"
                        ${sanPham.trangThai == 0 ? 'checked' :''}>
                        <label class="form-check-label" for="inlineRadio2">Hết Hàng</label>
                    </div>
                </div>

                <!-- Mô Tả Sản Phẩm -->
                <div class="mb-3">
                    <label  class="form-label">Mô tả sản phẩm</label>
                    <input name="moTa" type="text" class="form-control" id="floatingInput" placeholder="Mô tả" value="${sanPham.moTa}">
                </div>
            </div>
                    <p id="error-message" style="color: red ">${errorMessageSanPham}</p>
                    <div class="p-2 bd-highlight d-flex justify-content-end">
                        <button type="submit" class="btn btn-outline-warning">
                            <i class="fa-solid fa-pen"></i> Cập nhật
                        </button>
                    </div>
                </form>


            </div>
        </div>
    </div>
</div>

</div>
<script>
    $(document).ready(function() {
        // Kiểm tra nếu errorMessage có giá trị (lỗi tồn tại)
        if ($('#error-message').text().trim() !== '') {
            // Nếu có lỗi, set giá trị của input là rỗng
            $('#floatingInputTenSanPham').val('');
        }
    });
</script>
</body>

</html>