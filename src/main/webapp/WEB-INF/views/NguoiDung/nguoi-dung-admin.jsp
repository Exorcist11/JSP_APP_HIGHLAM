<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>T-Shirt Luxury | ADMIN</title>
            <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
            <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

            <%-- <script src="../js/script.js"></script>--%>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        </head>

        <body class="container">
            <div>
                <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />


                <div class="row mt-3 ">
                    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
                    <div class="col-9">
                        <div class="row">
                            <h2 class="">Quản Lý Người Dùng</h2>
                            <div class="p-2 bd-highlight d-flex justify-content-between align-items-center">
                                <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm w-100 rounded">
                                    <div class="container-fluid">
                                        <!-- <form action="/t-shirt-luxury/admin/timNguoiDung" method="get"
                                            class="row g-1 w-100">
                                            <div class="col-5">
                                                <input class="form-control py-2" type="search" name="timKiemNguoiDung"
                                                    style="font-size: 14px;" placeholder="Tìm người dùng"
                                                    aria-label="Search">
                                            </div>
                                            
                                            <div class="col-2">
                                                <select class="form-select" name="idChucVu" style="font-size: 14px;">
                                                    <option value="" hidden>Chọn chức vụ</option>
                                                    <c:forEach items="${listChucVu}" var="cv">
                                                        <option value="${cv.id}">${cv.tenChucVu}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div class="col-5 d-flex justify-content-between">
                                                <button class="btn btn-success d-flex align-items-center flex-fill mx-1"
                                                    style="font-size: 14px;" type="submit">
                                                    <i class="bi bi-search me-1"></i> Tìm Kiếm
                                                </button>
                                                <a href="/t-shirt-luxury/admin/timNguoiDung" style="font-size: 14px;"
                                                    class="btn btn-secondary d-flex align-items-center flex-fill mx-1">
                                                    <i class="bi bi-arrow-clockwise me-1"></i> Reset
                                                </a>
                                                <button type="button" style="font-size: 14px;"
                                                    class="btn btn-outline-success ms-2 flex-fill mx-1"
                                                    data-bs-toggle="modal" data-bs-target="#themNguoiDung">
                                                    <i class="fa-solid fa-circle-plus me-1"></i> Thêm Mới
                                                </button>
                                            </div>
                                        </form> -->


                                        <form action="/t-shirt-luxury/admin/timNguoiDung" method="GET"
                                            class="row g-1 w-100">
                                            <!-- Ô tìm kiếm -->
                                            <div class="col-5">
                                                <input name="timKiemNguoiDung" class="form-control" type="search"
                                                    placeholder="Tìm tên người dùng" aria-label="Search"
                                                    style="font-size: 14px;" value="${timKiemNguoiDung}">

                                            </div>

                                            <!-- Dropdown trạng thái -->
                                            

                                            <div class="col-5 d-flex justify-content-between">
                                                <button style="font-size: 14px;" class="btn btn-success flex-fill mx-1"
                                                    type="submit">
                                                    <i class="bi bi-search me-1"></i> Tìm Kiếm
                                                </button>

                                                <a href="/t-shirt-luxury/admin/timNguoiDung" style="font-size: 14px;"
                                                    class="btn btn-secondary flex-fill mx-1">
                                                    <i class="bi bi-arrow-clockwise"></i> Reset
                                                </a>

                                                <button type="button" class="btn btn-outline-primary flex-fill mx-1"
                                                    style="font-size: 14px;" data-bs-toggle="modal"
                                                    data-bs-target="#themNguoiDung">
                                                    <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                                                </button>
                                            </div>

                                        </form>
                                    </div>
                                </nav>

                            </div>

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        
                                        <th scope="col">Tên Người Dùng</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Chức Vụ</th>
                                       
                                        
                                        <th scope="col">Hành Động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listUser}" var="nd" varStatus="i">
                                        <tr>
                                            <th scope="row">${i.index + 1}</th>
                                          
                                            <td>${nd.username}</td>
                                            <td>${nd.email}</td>
                                            <td>${nd.role}</td>

                                           
                                            <td>
                                                <button class="btn btn-warning rounded-pill" data-toggle="tooltip"
                                                    data-placement="top" data-bs-toggle="modal"
                                                    data-bs-target="#suaNguoiDung" title="Chỉnh Sửa">
                                                    <a 
                                                        style="color:#000" class="modalSua">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </a>
                                                </button>

                                                <button class="btn btn-danger rounded-pill" data-toggle="tooltip"
                                                    data-placement="top" title="Xóa">
                                                    <a 
                                                        onclick="return confirmDelete()" style="color:#000">
                                                        <i class="fa-solid fa-trash"></i>
                                                    </a>
                                                </button>
                                                <a href="/admin/nguoi-dung-chi-tiet"
                                                    class="btn btn-secondary rounded-pill" data-placement="top"
                                                    title="Xem Chi Tiết">
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
            <div class="modal fade" id="themNguoiDung" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Người Dùng</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="/t-shirt-luxury/admin/taoNguoiDung" method="POST">

                            <div class="modal-body">
                                <div class="form-floating mb-3">
                                    <input name="maNguoiDung" type="text" class="form-control" id="floatingInput"
                                        placeholder="Mã Người Dùng">
                                    <label for="floatingInput">Mã Người Dùng</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input name="tenNguoiDung" type="text" class="form-control" id="floatingInput"
                                        placeholder="Tên Người Dùng">
                                    <label for="floatingInput">Tên Người Dùng</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input name="email" type="text" class="form-control" id="floatingInput"
                                        placeholder="Email">
                                    <label for="floatingInput">Email</label>
                                </div>
                                <select class="form-select" aria-label="Default select example" name="chucVu.id">
                                    <c:forEach items="${listChucVu}" var="cv">
                                        <option selected hidden="hidden">Chọn chức vụ</option>
                                        <option value="${cv.id}">${cv.tenChucVu}</option>
                                    </c:forEach>

                                </select>
                                <div class="mt-3">
                                    <div class="text mt-2">
                                        Trạng Thái
                                    </div>
                                    <div class="form-check form-check-inline mt-2">
                                        <input class="form-check-input" type="radio" name="trangThai" id="hoatDong"
                                            value="1">
                                        <label class="form-check-label" for="inlineRadio1">Hoạt Động</label>
                                    </div>
                                    <div class="form-check form-check-inline mt-2">
                                        <input class="form-check-input" type="radio" name="trangThai" id="khongHoatDong"
                                            value="0">
                                        <label class="form-check-label" for="inlineRadio2">Không Hoạt Động</label>
                                    </div>
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">Mô tả</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-success">Thêm Mới</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>


            </div>
            <script>
                confirmDelete = () => {
                    return confirm("Bạn có chắc muốn xóa ?");
                }
            </script>
        </body>

        </html>