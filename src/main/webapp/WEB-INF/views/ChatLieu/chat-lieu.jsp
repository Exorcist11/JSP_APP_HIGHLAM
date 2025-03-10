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
                    <div class="col-9">
                        <div class="row">
                            <h2 class="">Quản Lý Chất Liệu</h2>

                            <div class="p-2 bd-highlight d-flex justify-content-end">
                                <button style="font-size: 14px;" type="button" class="btn btn-outline-success"
                                    data-bs-toggle="modal" data-bs-target="#themChatLieu">
                                    <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                                </button>
                            </div>

                            <table class="table table-striped" style="font-size: 14px;">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>

                                        <th scope="col">Tên Chất Liệu</th>
                                        <th scope="col">Mô Tả</th>
                                        <th scope="col">Trạng Thái</th>
                                        <th scope="col">Hành Động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${chatLieu}" var="chatlieu" varStatus="i">

                                        <tr>
                                            <th scope="row">${i.index + 1}</th>

                                            <td>${chatlieu.tenChatLieu}</td>
                                            <td>${chatlieu.moTa}</td>
                                            <td>
                                                <c:if test="${chatlieu.trangThai == 1}">
                                                    <span class="badge bg-success">Hoạt Động</span>
                                                </c:if>
                                                <c:if test="${chatlieu.trangThai == 0}">

                                                    <span class="badge bg-danger">Không Hoạt Động</span>
                                                </c:if>
                                            </td>
                                            <td>
                                                <a class="btn btn-warning rounded-pill" data-toggle="tooltip"
                                                    data-placement="top"
                                                    href="/t-shirt-luxury/admin/chat-lieu/getOne?id=${chatlieu.id}"
                                                    title="Chỉnh Sửa"><i class="fa-solid fa-pen-to-square"></i></a>
                                                <a href="/t-shirt-luxury/admin/chat-lieu/delete?id=${chatlieu.id}"
                                                    onclick="return confirmDelete()" class="btn btn-danger rounded-pill"
                                                    data-toggle="tooltip" data-placement="top" title="Xóa"><i
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

            <!-- Modal -->
            <form action="/t-shirt-luxury/admin/chat-lieu/add" method="post">
                <div class="modal fade" id="themChatLieu" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" style="font-size: 14px;">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Chất Liệu</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput"
                                        placeholder="Tên Chất Liệu" name="tenChatLieu">
                                    <label for="floatingInput">Tên Chất Liệu</label>
                                </div>

                                <div class="mb-3 mt-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">Mô tả</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
                                        name="moTa"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer ">
                                <button type="button" style="font-size: 14px;" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" style="font-size: 14px;" class="btn btn-success">Thêm Mới</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!-- Modal -->
            <div class="modal fade" id="sua" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cập Nhật Chất Liệu</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Mã Chất Liệu">
                                <label for="floatingInput">Mã Chất Liệu</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="Tên Chất Liệu">
                                <label for="floatingInput">Tên Chất Liệu</label>
                            </div>
                            <div class="mt-3">
                                <div class="text mt-2">
                                    Trạng Thái
                                </div>
                                <div class="form-check form-check-inline mt-2">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="hoatDong"
                                        value="option1">
                                    <label class="form-check-label" for="inlineRadio1">Hoạt Động</label>
                                </div>
                                <div class="form-check form-check-inline mt-2">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions"
                                        id="khongHoatDong" value="option2">
                                    <label class="form-check-label" for="inlineRadio2">Không Hoạt Động</label>
                                </div>
                            </div>
                            <div class="mb-3 mt-3">
                                <label for="exampleFormControlTextarea1" class="form-label">Mô tả</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                                style="font-size: 14px;">Đóng</button>
                            <button type="button" class="btn btn-success" style="font-size: 14px;">Cập Nhật</button>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        <script>
            confirmDelete = () => {
                return confirm("Bạn có chắc muốn xóa ?");
            }
        </script>

        </html>