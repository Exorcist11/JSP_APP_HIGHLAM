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
                <h2 class="">Quản Lý Voucher</h2>

                <div class="p-3 bg-light rounded border mt-3">
                    <form action="${pageContext.request.contextPath}/t-shirt-luxury/admin/timVoucher" method="get" class="row g-3 align-items-center">
                        <div class="col-md-3">
                            <input name="tenVoucher" class="form-control" placeholder="Tìm Voucher" />
                        </div>
                        <div class="col-md-2">
                            <select class="form-select" name="trangThai" id="trangThai">
                                <option value="">-- Chọn Trạng Thái --</option>
                                <option value="1">Hoạt Động</option>
                                <option value="0">Không hoạt động</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="date" name="ngayBatDau" class="form-control" />
                        </div>
                        <div class="col-md-2">
                            <input type="date" name="ngayKetThuc" class="form-control" />
                        </div>
                        <div class="col-md-1 d-flex align-items-center">
                            <button type="submit" class="btn btn-primary w-100 mt-2">Tìm Kiếm</button>
                        </div>
                        <div class="col-md-1 d-flex align-items-center">
                            <a href="${pageContext.request.contextPath}/t-shirt-luxury/admin/timVoucher" class="btn btn-secondary w-100 mt-2">Reset</a>
                        </div>
                        <div class="col-md-1 d-flex align-items-center">
                            <button type="button" class="btn btn-outline-success w-100 mt-2" data-bs-toggle="modal" data-bs-target="#themVoucher">
                                <i class="fa-solid fa-circle-plus"></i> Thêm
                            </button>
                        </div>

                    </form>
                </div>


                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã Voucher</th>
                        <th scope="col">Tên Voucher</th>
                        <th scope="col">Giá Trị Giảm (%)</th>
                        <th scope="col">Ngày Bắt Đầu</th>
                        <th scope="col">Ngày Kết Thúc</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">Mức Chi Tối Thiểu</th>
                        <th scope="col">Giới Hạn Giảm</th>
                        <th scope="col">Trạng Thái</th>
                        <th scope="col">Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listVoucher}" var="voucher" varStatus="i">
                    <tr>
                        <td>${i.index+1}</td>
                        <td>${voucher.maVoucher}</td>
                        <td>${voucher.tenVoucher}</td>
                        <td>${voucher.giaTriGiam}</td>
                        <td>${voucher.ngayBatDau}</td>
                        <td>${voucher.ngayKetThuc}</td>
                        <td>${voucher.soLuong}</td>
                        <td>${voucher.mucChiToiThieu}</td>
                        <td>${voucher.gioiHan}</td>
                        <td>
                            <c:if test="${voucher.trangThai == 1}">
                                <span class="badge bg-success">Hoạt Động</span>
                            </c:if>
                            <c:if test="${voucher.trangThai == 0}">

                                <span class="badge bg-danger">Không Hoạt Động</span>
                            </c:if>
                        </td>
                        <td>
                            <a class="btn btn-warning rounded-pill" data-toggle="tooltip"
                                    data-placement="top" href="/t-shirt-luxury/admin/voucher/getOne?id=${voucher.id}"
                                    title="Chỉnh Sửa"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a class="btn btn-danger rounded-pill" data-toggle="tooltip" data-placement="top"
                                    title="Xóa" href="/t-shirt-luxury/admin/voucher/delete?id=${voucher.id}" onclick="return confirmDelete()"><i class="fa-solid fa-trash"></i></a>

                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- Modal add-->
<div class="modal fade" id="themVoucher" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1200px">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Voucher</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/t-shirt-luxury/admin/voucher/add" method="post">
                <div class="modal-body">

            <div class="modal-body">

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Mã Voucher" name="maVoucher">
                    <label for="floatingInput">Mã Voucher</label>
                </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="floatingInput" placeholder="Tên Voucher" name="tenVoucher" value="${tenVoucher}">
                        <label for="floatingInput">Tên Voucher</label>
                    </div>
                    <p style="color: red">${errorTenVoucher}</p>
                    <div class="form-floating mb-3">
                        <input type="number" min="0" class="form-control" id="floatingInput" placeholder="Giá Trị Giảm(%)" name="giaTriGiam" value="${giaTriGiam}">
                        <label for="floatingInput">Giá Trị Giảm</label>
                    </div>
                    <p style="color: red">${errorGiaTriGiamVoucher}</p>
                    <div class="form-floating mb-3">
                        <input type="number" min ="1" class="form-control" id="floatingInput" placeholder="Số Lượng" name="soLuong" value="${soLuong}">
                        <label for="floatingInput">Số lượng</label>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Tên Voucher" name="tenVoucher">
                    <label for="floatingInput">Tên Voucher</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" placeholder="Giá Trị Giảm" name="giaTriGiam">
                    <label for="floatingInput">Giá Trị Giảm</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingInput" placeholder="Số Lượng" name="soLuong">
                    <label for="floatingInput">Số lượng</label>
                </div>

                <div class="mt-3 mb-3">
                    <div class="text mt-2">
                        Trạng Thái
                    </div>
                    <div class="form-check form-check-inline mt-2">
                        <input class="form-check-input" type="radio" name="trangThai"
                               value="1">
                        <label class="form-check-label">Hoạt Động</label>
                    </div>
                    <p style="color: red">${errorSoLuongVoucher}</p>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id="floatingInput" placeholder="Ngày kết thúc" name="ngayKetThuc" value="${ngayKetThuc}">
                        <label for="floatingInput">Ngày kết thúc</label>
                    </div>
                    <p style="color: red">${errorNgayKetThucVoucher}</p>
<%--                    <div class="mt-3 mb-3">--%>
<%--                        <div class="text mt-2">--%>
<%--                            Trạng Thái--%>
<%--                        </div>--%>
<%--                        <div class="form-check form-check-inline mt-2">--%>
<%--                            <input class="form-check-input" type="radio" name="trangThai"--%>
<%--                                   value="1" checked>--%>
<%--                            <label class="form-check-label">Hoạt Động</label>--%>
<%--                        </div>--%>
<%--                        <div class="form-check form-check-inline mt-2">--%>
<%--                            <input class="form-check-input" type="radio" name="trangThai"--%>
<%--                                   value="0">--%>
<%--                            <label class="form-check-label">Chưa Hoạt Động</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="form-floating mb-3">
                        <input type="number" min="100000" class="form-control" id="floatingInput" placeholder="Mức Chi Tiêu Tối Thiểu" name="mucChiToiThieu" value="${mucChiToiThieu}">
                        <label for="floatingInput">Mức chi tiêu tối thiểu</label>
                    </div>
                    <p style="color: red">${errorMucChiToiThieuVoucher}</p>
                    <div class="form-floating mb-3">
                        <input type="number" min="5000" class="form-control" id="floatingInput" placeholder="Giới hạn giảm" name="gioiHan" value="${gioiHan}">
                        <label for="floatingInput">Giới hạn giảm</label>
                    </div>
                    <p style="color: red">${errorGioiHanGiamVoucher}</p>
                    <div class="mb-3 mt-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Mô tả</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="moTa"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-success">Thêm Mới</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    confirmDelete = () => {
        return confirm("Bạn có chắc chắn muốn xóa Voucher này không ?");
    }
    document.addEventListener('DOMContentLoaded', function() {
        var myModal = new bootstrap.Modal(document.getElementById('${openModal}'));
        myModal.show();
    });
</script>
</html>