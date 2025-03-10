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
                            <form action="/t-shirt-luxury/admin/updateSanPhamChiTiet?id=${SPCT.id}" method="POST">
                                <div>

                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Mã Sản Phẩm -->
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" placeholder="Tên Sản Phẩm" disabled
                                            readonly value="${SPCT.sanPham.tenSanPham}">
                                        <label for="floatingInput">Tên Sản Phẩm</label>
                                    </div>
                                    <div class="form-floating mb-3 mt-3">
                                        <input min="0" type="number" class="form-control" id="floatingInput"
                                            placeholder="Số Lượng" name="soLuong" value="${SPCT.soLuong}">
                                        <label for="floatingInput">Số Lượng</label>
                                    </div>
                                    <!-- Trạng Thái -->
                                    <div>
                                        <div class="text mt-2">Trạng Thái</div>
                                        <div class="form-check form-check-inline mt-2">
                                            <input class="form-check-input" type="radio" name="trangThai"
                                                id="inlineRadio1" value="1" ${SPCT.trangThai==1 ? 'checked' :''}>
                                            <label class="form-check-label" for="inlineRadio1">Bán</label>
                                        </div>
                                        <div class="form-check form-check-inline mt-2">
                                            <input class="form-check-input" type="radio" name="trangThai"
                                                id="inlineRadio2" value="0" ${SPCT.trangThai==0 ? 'checked' :''}>
                                            <label class="form-check-label" for="inlineRadio2">Chưa Bán</label>
                                        </div>
                                    </div>
                                </div>
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
        </body>

        </html>