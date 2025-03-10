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
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        </head>

        <body class="container">
            <div>
                <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />


                <div class="row mt-3 ">
                    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
                    <div class="col-9" >
                        <div class="row">
                            <h2 class="">Quản Lý Sản Phẩm</h2>

                            <div class="p-3 bg-light rounded border mt-3">
                                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                    <div class="w-100">
                                        <form action="/t-shirt-luxury/admin/timSP" method="get" class="row g-1">
                                            <!-- Ô tìm kiếm -->
                                            <div class="col-5">
                                                <input name="timKiemSanPham" class="form-control" type="search"
                                                    placeholder="Tìm sản phẩm" aria-label="Search"
                                                    style="font-size: 14px;" value="${timKiemSanPham}">

                                            </div>

                                            <!-- Dropdown trạng thái -->
                                            <div class="col-2">
                                                <select class="form-select" name="trangThai" id="trangThai"
                                                    style="font-size: 14px;">
                                                    <option value="">Trạng Thái</option>
                                                    <option value="1" ${sanPham.trangThai==1 ? 'selected' : '' }>Còn
                                                        Hàng</option>
                                                    <option value="0" ${sanPham.trangThai==0 ? 'selected' : '' }>Hết
                                                        Hàng</option>
                                                </select>
                                            </div>

                                            <div class="col-5 d-flex justify-content-between">
                                                <button style="font-size: 14px;" class="btn btn-success flex-fill mx-1"
                                                    type="submit">
                                                    <i class="bi bi-search me-1"></i> Tìm Kiếm
                                                </button>

                                                <a href="/t-shirt-luxury/admin/timSP" style="font-size: 14px;"
                                                    class="btn btn-secondary flex-fill mx-1">
                                                    <i class="bi bi-arrow-clockwise"></i> Reset
                                                </a>

                                                <button type="button" class="btn btn-outline-primary flex-fill mx-1"
                                                    style="font-size: 14px;" data-bs-toggle="modal"
                                                    data-bs-target="#themSanPham">
                                                    <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                                                </button>
                                            </div>

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
                                                <a href="/t-shirt-luxury/admin/sua-san-pham/getOne?id=${sp.id}"
                                                    class="btn btn-warning rounded-pill" title="Chỉnh Sửa"><i
                                                        class="fa-solid fa-pen-to-square"></i></a>
                                                <a href="/t-shirt-luxury/admin/san-pham/delete?id=${sp.id}"
                                                    class="btn btn-danger rounded-pill" data-toggle="tooltip"
                                                    data-placement="top" title="Xóa" onclick="return confirmDelete()"><i
                                                        class="fa-solid fa-trash"></i></a>
                                                <a href="/t-shirt-luxury/admin/san-pham-chi-tiet?id=${sp.id}"
                                                    class="btn btn-secondary rounded-pill" data-toggl e="tooltip"
                                                    data-placement="top" title="Xem Chi Tiết">
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
                <div class="modal fade" id="themSanPham" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Sản Phẩm</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Mã Sản Phẩm -->
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInputMaSanPham"
                                        placeholder="Mã Sản Phẩm" name="maSanPham">
                                    <label for="floatingInputMaSanPham">Mã Sản Phẩm</label>
                                </div>

                                <!-- Tên Sản Phẩm -->
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInputTenSanPham"
                                        placeholder="Tên Sản Phẩm" name="tenSanPham" required>
                                    <label for="floatingInputTenSanPham">Tên Sản Phẩm <span
                                            class="text-danger">*</span></label>
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
                                        <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1"
                                            value="1" checked>
                                        <label class="form-check-label" for="inlineRadio1">Bán</label>
                                        <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio1"
                                            value="1">
                                        <label class="form-check-label" for="inlineRadio1">Còn Hàng</label>
                                    </div>
                                    <div class="form-check form-check-inline mt-2">
                                        <input class="form-check-input" type="radio" name="trangThai" id="inlineRadio2"
                                            value="0">
                                        <label class="form-check-label" for="inlineRadio2">Hết Hàng</label>
                                    </div>
                                </div>

                                <!-- Mô Tả Sản Phẩm -->
                                <div class="mb-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">Mô tả sản phẩm</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" name="moTa"
                                        rows="3"></textarea>
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
                document.addEventListener('DOMContentLoaded', function () {
                    var myModal = new bootstrap.Modal(document.getElementById('${openModal}'));
                    myModal.show();
                });
            </script>
        </body>
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script>
            confirmDelete = () => {
                return confirm("Bạn có chắc chắn muốn xóa Sản Phẩm này không ?");
            }
        </script>

        </html>