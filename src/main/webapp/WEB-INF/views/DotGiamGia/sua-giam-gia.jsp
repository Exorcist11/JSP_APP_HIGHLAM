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
                            <h2 class="">Sửa Đợt Giảm Giá</h2>

                            <form action="/t-shirt-luxury/admin/giam-gia/update?id=${dotGiamGia.id}" method="post">
                                <div class="modal-body">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput"
                                            placeholder="Mã Đợt Giảm Giá" name="maDotGiamGia"
                                            value="${dotGiamGia.maDotGiamGia}">
                                        <label for="floatingInput">Mã Đợt Giảm Giá</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput"
                                            placeholder="Tên Đợt Giảm Giá" name="tenDotGiamGia"
                                            value="${dotGiamGia.tenDotGiamGia}">
                                        <label for="floatingInput">Tên Đợt Giảm Giá</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="number" class="form-control" id="floatingInput"
                                            placeholder="Giá Trị Giảm" name="giaTriGiam"
                                            value="${dotGiamGia.giaTriGiam}">
                                        <label for="floatingInput">Giá Trị Giảm</label>
                                    </div>
                                    <div class="mt-3">
                                        <div class="text mt-2">
                                            Trạng Thái
                                        </div>
                                        <div class="form-check form-check-inline mt-2">
                                            <input class="form-check-input" type="radio" name="trangThai" value="1"
                                                ${dotGiamGia.trangThai==1 ? 'checked' : '' }>
                                            <label class="form-check-label">Hoạt Động</label>
                                        </div>
                                        <div class="form-check form-check-inline mt-2">
                                            <input class="form-check-input" type="radio" name="trangThai" value="0"
                                                ${dotGiamGia.trangThai==0 ? 'checked' : '' }>
                                            <label class="form-check-label">Chưa Hoạt Động</label>
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3 mt-3">
                                        <input name="moTa" type="text" class="form-control" id="floatingInput"
                                            placeholder="Mô tả" value="${dotGiamGia.moTa}">
                                        <label for="floatingInput">Mô tả</label>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Đóng</button>
                                        <button type="submit" class="btn btn-success">Cập Nhật</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </body>

        </html>