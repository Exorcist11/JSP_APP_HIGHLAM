<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>T-Shirt Luxury | ADMIN</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body style="max-width: 1460px">
<div >
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
            </div>
        </div>
        <div class="col-9" style="">
            <div class="row">
                <h2 class="">Quản Lý Sản Phẩm</h2>



                <div class="p-3 bg-light rounded border mt-3">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm rounded">
                        <div class="container-fluid">
                            <form action="/t-shirt-luxury/admin/timSP" method="get" class="d-flex align-items-center gap-2 w-100">
                                <input name="timKiemSanPham" class="form-control" type="search"
                                       placeholder="Tìm sản phẩm" aria-label="Search"
                                       value="${timKiemSanPham}" style="max-width: 600px;">

                                <select class="form-select" name="trangThai" id="trangThai" style="width: 30%;">
                                    <option value="">-- Chọn Trạng Thái --</option>
                                    <option value="1" ${sanPham.trangThai == 1 ? 'selected' : ''}>Còn Hàng</option>
                                    <option value="0" ${sanPham.trangThai == 0 ? 'selected' : ''}>Hết Hàng</option>
                                </select>
                                <button class="btn btn-success d-flex align-items-center px-4 mt-2" type="submit">
                                    <i class="bi bi-search me-1"></i> Tìm Kiếm
                                </button>
                                <a href="/t-shirt-luxury/admin/timSP" class="btn btn-secondary d-flex align-items-center px-4 mt-2">
                                    <i class="bi bi-arrow-clockwise me-1"></i> Reset
                                </a>
                                <button type="button" class="btn btn-outline-success ms-2 mt-2" data-bs-toggle="modal"
                                        data-bs-target="#themSanPham">
                                    <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                                </button>

                            </form>
                        </div>
                    </nav>
                </div>

                <table class="table table-striped ">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã Sản Phẩm</th>
                        <th scope="col">Tên Sản Phẩm</th>
                        <th scope="col">Danh Mục</th>
                        <th scope="col">Trạng Thái</th>
                        <th scope="col">Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listSanPham}" var="sp" varStatus="i">
                        <tr>
                            <td>${i.index+1}</td>
                            <td>${sp.maSanPham}</td>
                            <td>${sp.tenSanPham}</td>
                            <td>${sp.danhMuc.tenDanhMuc}</td>
                            <td>
                                <c:if test="${sp.trangThai == 1}">
                                    <span class="badge bg-success">Còn Hàng</span>
                                </c:if>
                                <c:if test="${sp.trangThai == 0}">

                                    <span class="badge bg-danger">Hết Hàng</span>
                                </c:if>
                            </td>
                            <td>
                                <a href="/t-shirt-luxury/admin/sua-san-pham/getOne?id=${sp.id}"  class="btn btn-warning rounded-pill"

                                        title="Chỉnh Sửa"><i class="fa-solid fa-pen-to-square"></i></a>
                                <a href="/t-shirt-luxury/admin/san-pham/delete?id=${sp.id}" class="btn btn-danger rounded-pill" data-toggle="tooltip"
                                        data-placement="top" title="Xóa" onclick="return confirmDelete()"><i class="fa-solid fa-trash"></i></a>
                                <a href="/t-shirt-luxury/admin/san-pham-chi-tiet?id=${sp.id}" class="btn btn-secondary rounded-pill"
                                   data-toggl e="tooltip" data-placement="top" title="Xem Chi Tiết">
                                    <i class="fa-solid fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<!-- Modal -->
<form action="/t-shirt-luxury/admin/san-pham/add" method="post">
    <div class="modal fade" id="themSanPham" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Sản Phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Mã Sản Phẩm -->
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInputMaSanPham" placeholder="Mã Sản Phẩm" name="maSanPham">
                        <label for="floatingInputMaSanPham">Mã Sản Phẩm</label>
                    </div>

                    <!-- Tên Sản Phẩm -->
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInputTenSanPham" placeholder="Tên Sản Phẩm" name="tenSanPham">
                        <label for="floatingInputTenSanPham">Tên Sản Phẩm</label>
                    </div>

                    <!-- Danh Mục Sản Phẩm -->
                    <select class="form-select" aria-label="Default select example" name="id_danh_muc">
                        <c:forEach var="s" items="${danhMuc}">
                            <option value="${s.id}">${s.tenDanhMuc}</option>
                        </c:forEach>
                    </select>

                    <!-- Trạng Thái -->
                    <div>
                        <div class="text mt-2">Trạng Thái</div>
                        <div class="form-check form-check-inline mt-2">
                            <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1" value="1" checked>
                            <label class="form-check-label" for="inlineRadio1">Bán</label>
                            <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1" value="1">
                            <label class="form-check-label" for="inlineRadio1">Còn Hàng</label>
                        </div>
                        <div class="form-check form-check-inline mt-2">
                            <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio2" value="0">
                            <label class="form-check-label" for="inlineRadio2">Hết Hàng</label>
                        </div>
                    </div>

                    <!-- Mô Tả Sản Phẩm -->
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Mô tả sản phẩm</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" name="moTa" rows="3"></textarea>
                    </div>
                    <p style="color: red">${errorMessageSanPham}</p>
                </div>

                <!-- Footer Modal -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-success">Thêm Mới</button>
                </div>
            </div>
        </div>
    </div>
</form>


<script>
    document.addEventListener('DOMContentLoaded', function() {
        var myModal = new bootstrap.Modal(document.getElementById('${openModal}'));
        myModal.show();
    });
</script>
</body>
<script
        src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script>
    confirmDelete = () => {
        return confirm("Bạn có chắc chắn muốn xóa Sản Phẩm này không ?");
    }
</script>

</html>