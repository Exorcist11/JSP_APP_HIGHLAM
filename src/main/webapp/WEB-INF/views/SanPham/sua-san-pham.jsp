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
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

            <script src="../js/script.js"></script>
        </head>

        <body class="container">
            <div>
                <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />


                <div class="row mt-3 ">
                    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
                    <div class="col-9" style="">
                        <div class="row">
                            <h2 class="">Sửa Sản Phẩm</h2>
                            <form action="/t-shirt-luxury/admin/updateSanPham?id=${sanPham.id}" method="POST">
                                <div>


                                </div>
                                <div class="modal-body">
                                    <!-- Mã Sản Phẩm -->
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInputMaSanPham"
                                            placeholder="Mã Sản Phẩm" name="maSanPham" value="${sanPham.maSanPham}">
                                        <label for="floatingInputMaSanPham">Mã Sản Phẩm</label>
                                    </div>

                                    <!-- Tên Sản Phẩm -->
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInputTenSanPham"
                                            placeholder="Tên Sản Phẩm" name="tenSanPham" value="${sanPham.tenSanPham}">
                                        <label for="floatingInputTenSanPham">Tên Sản Phẩm</label>
                                    </div>

                                    <!-- Danh Mục Sản Phẩm -->
                                    <label for="floatingInputTenSanPham">Tên Danh Mục</label>
                                    <select class="form-select" aria-label="Default select example" name="danhMuc.id">

                                        <c:forEach items="${danhMuc}" var="s">
                                            <option value="${s.id}" ${sanPham.danhMuc.tenDanhMuc.equals(s.tenDanhMuc)
                                                ? 'selected' :''}>${s.tenDanhMuc}</option>
                                        </c:forEach>

                                    </select>


                                    <!-- Trạng Thái -->
                                    <div>
                                        <div class="text mt-2">Trạng Thái</div>
                                        <div class="form-check form-check-inline mt-2">
                                            <input class="form-check-input" type="radio" name="trangThai"
                                                id="inlineRadio1" value="1" ${sanPham.trangThai==1 ? 'checked' :''}>
                                            <label class="form-check-label" for="inlineRadio1">Còn Hàng</label>
                                        </div>
                                        <div class="form-check form-check-inline mt-2">
                                            <input class="form-check-input" type="radio" name="trangThai"
                                                id="inlineRadio2" value="0" ${sanPham.trangThai==0 ? 'checked' :''}>
                                            <label class="form-check-label" for="inlineRadio2">Hết Hàng</label>
                                        </div>
                                    </div>

                                    <!-- Mô Tả Sản Phẩm -->
                                    <div class="mb-3">
                                        <label class="form-label">Mô tả sản phẩm</label>
                                        <input name="moTa" type="text" class="form-control" id="floatingInput"
                                            placeholder="Mô tả" value="${sanPham.moTa}">
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
                $(document).ready(function () {
                    // Kiểm tra nếu errorMessage có giá trị (lỗi tồn tại)
                    if ($('#error-message').text().trim() !== '') {
                        // Nếu có lỗi, set giá trị của input là rỗng
                        $('#floatingInputTenSanPham').val('');
                    }
                });
            </script>
        </body>

        </html>