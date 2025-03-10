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
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        </head>

        <body class="container">
            <div>
                <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />

                <div class="row mt-3 ">
                    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
                    <div class="col-9" style="">
                        <div class="row">
                            <h2 class="">Quản Lý Voucher</h2>

                            <div class="p-3 bg-light rounded border mt-3">
                                <form action="${pageContext.request.contextPath}/t-shirt-luxury/admin/timVoucher"
                                    method="get" class="row g-3 align-items-center">
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
                                        <a href="${pageContext.request.contextPath}/t-shirt-luxury/admin/timVoucher"
                                            class="btn btn-secondary w-100 mt-2">Reset</a>
                                    </div>
                                    <div class="col-md-1 d-flex align-items-center">
                                        <button type="button" class="btn btn-outline-success w-100 mt-2"
                                            data-bs-toggle="modal" data-bs-target="#themVoucher">
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
                                                    data-placement="top"
                                                    href="/t-shirt-luxury/admin/voucher/getOne?id=${voucher.id}"
                                                    title="Chỉnh Sửa"><i class="fa-solid fa-pen-to-square"></i></a>
                                                <a class="btn btn-danger rounded-pill" data-toggle="tooltip"
                                                    data-placement="top" title="Xóa"
                                                    href="/t-shirt-luxury/admin/voucher/delete?id=${voucher.id}"
                                                    onclick="return confirmDelete()"><i
                                                        class="fa-solid fa-trash"></i></a>

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
            <div class="modal fade" id="themVoucher" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
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
                                        <input type="text" class="form-control" id="floatingInput"
                                            placeholder="Mã Voucher" name="maVoucher">
                                        <label for="floatingInput">Mã Voucher</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput"
                                            placeholder="Tên Voucher" name="tenVoucher" value="${tenVoucher}">
                                        <label for="floatingInput">Tên Voucher</label>
                                    </div>
                                    <p style="color: red">${errorTenVoucher}</p>
                                    <div class="form-floating mb-3">
                                        <input type="number" min="0" class="form-control" id="floatingInput"
                                            placeholder="Giá Trị Giảm(%)" name="giaTriGiam" value="${giaTriGiam}">
                                        <label for="floatingInput">Giá Trị Giảm</label>
                                    </div>
                                    <p style="color: red">${errorGiaTriGiamVoucher}</p>
                                    <div class="form-floating mb-3">
                                        <input type="number" min="1" class="form-control" id="floatingInput"
                                            placeholder="Số Lượng" name="soLuong" value="${soLuong}">
                                        <label for="floatingInput">Số lượng</label>

                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="floatingInput"
                                                placeholder="Tên Voucher" name="tenVoucher">
                                            <label for="floatingInput">Tên Voucher</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <input type="number" class="form-control" id="floatingInput"
                                                placeholder="Giá Trị Giảm" name="giaTriGiam">
                                            <label for="floatingInput">Giá Trị Giảm</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="number" class="form-control" id="floatingInput"
                                                placeholder="Số Lượng" name="soLuong">
                                            <label for="floatingInput">Số lượng</label>
                                        </div>

                                        <div class="mt-3 mb-3">
                                            <div class="text mt-2">
                                                Trạng Thái
                                            </div>
                                            <div class="form-check form-check-inline mt-2">
                                                <input class="form-check-input" type="radio" name="trangThai" value="1">
                                                <label class="form-check-label">Hoạt Động</label>
                                            </div>
                                            <p style="color: red">${errorSoLuongVoucher}</p>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="floatingInput"
                                                    placeholder="Ngày kết thúc" name="ngayKetThuc"
                                                    value="${ngayKetThuc}">
                                                <label for="floatingInput">Ngày kết thúc</label>
                                            </div>
                                            <p style="color: red">${errorNgayKetThucVoucher}</p>
                                            <%-- <div class="mt-3 mb-3">--%>
                                                <%-- <div class="text mt-2">--%>
                                                    <%-- Trạng Thái--%>
                                                        <%-- </div>--%>
                                                            <%-- <div class="form-check form-check-inline mt-2">--%>
                                                                <%-- <input class="form-check-input" type="radio"
                                                                    name="trangThai" --%>
                                                                    <%-- value="1" checked>--%>
                                                                        <%-- <label class="form-check-label">Hoạt
                                                                            Động</label>--%>
                                                                            <%-- </div>--%>
                                                                                <%-- <div
                                                                                    class="form-check form-check-inline mt-2">--%>
                                                                                    <%-- <input class="form-check-input"
                                                                                        type="radio" name="trangThai"
                                                                                        --%>
                                                                                        <%-- value="0">--%>
                                                                                            <%-- <label
                                                                                                class="form-check-label">Chưa
                                                                                                Hoạt Động</label>--%>
                                                                                                <%-- </div>--%>
                                                                                                    <%-- </div>--%>

                                                                                                        <div
                                                                                                            class="form-floating mb-3">
                                                                                                            <input
                                                                                                                type="number"
                                                                                                                min="100000"
                                                                                                                class="form-control"
                                                                                                                id="floatingInput"
                                                                                                                placeholder="Mức Chi Tiêu Tối Thiểu"
                                                                                                                name="mucChiToiThieu"
                                                                                                                value="${mucChiToiThieu}">
                                                                                                            <label
                                                                                                                for="floatingInput">Mức
                                                                                                                chi tiêu
                                                                                                                tối
                                                                                                                thiểu</label>
                                                                                                        </div>
                                                                                                        <p
                                                                                                            style="color: red">
                                                                                                            ${errorMucChiToiThieuVoucher}
                                                                                                        </p>
                                                                                                        <div
                                                                                                            class="form-floating mb-3">
                                                                                                            <input
                                                                                                                type="number"
                                                                                                                min="5000"
                                                                                                                class="form-control"
                                                                                                                id="floatingInput"
                                                                                                                placeholder="Giới hạn giảm"
                                                                                                                name="gioiHan"
                                                                                                                value="${gioiHan}">
                                                                                                            <label
                                                                                                                for="floatingInput">Giới
                                                                                                                hạn
                                                                                                                giảm</label>
                                                                                                        </div>
                                                                                                        <p
                                                                                                            style="color: red">
                                                                                                            ${errorGioiHanGiamVoucher}
                                                                                                        </p>
                                                                                                        <div
                                                                                                            class="mb-3 mt-3">
                                                                                                            <label
                                                                                                                for="exampleFormControlTextarea1"
                                                                                                                class="form-label">Mô
                                                                                                                tả</label>
                                                                                                            <textarea
                                                                                                                class="form-control"
                                                                                                                id="exampleFormControlTextarea1"
                                                                                                                rows="3"
                                                                                                                name="moTa"></textarea>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="modal-footer">
                                                                                                            <button
                                                                                                                type="button"
                                                                                                                class="btn btn-secondary"
                                                                                                                data-bs-dismiss="modal">Đóng</button>
                                                                                                            <button
                                                                                                                type="submit"
                                                                                                                class="btn btn-success">Thêm
                                                                                                                Mới</button>
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
            document.addEventListener('DOMContentLoaded', function () {
                var myModal = new bootstrap.Modal(document.getElementById('${openModal}'));
                myModal.show();
            });
        </script>

        </html>