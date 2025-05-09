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
                            <h2 class="">Sửa voucher</h2>

                            <form action="/t-shirt-luxury/admin/voucher/update?id=${voucher.id}" method="post">
                                <div class="modal-body">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInput"
                                            placeholder="Mã Voucher" name="maVoucher" value="${voucher.maVoucher}">
                                        <label for="floatingInput">Mã Voucher</label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="floatingInputTenVoucher"
                                            placeholder="Tên Voucher" name="tenVoucher" value="${voucher.tenVoucher}">
                                        <label for="floatingInput">Tên Voucher</label>
                                    </div>
                                    <p id="errorTenVoucher" style="color: red">${errorMessageTenVoucher}</p>

                                    <div class="form-floating mb-3">
                                        <input min="0" type="number" class="form-control"
                                            id="floatingInputGiaTriGiamVoucher" placeholder="Giá Trị Giảm"
                                            name="giaTriGiam" value="${voucher.giaTriGiam}">
                                        <label for="floatingInput">Giá Trị Giảm</label>
                                    </div>
                                    <p id="errorGiaTriGiamVoucher" style="color: red">${errorMessageGiaTriGiamVoucher}
                                    </p>
                                    <div class="form-floating mb-3">
                                        <input min="0" type="number" class="form-control"
                                            id="floatingInputSoLuongVoucher" placeholder="Số Lượng" name="soLuong"
                                            value="${voucher.soLuong}">
                                        <label for="floatingInput">Số lượng</label>
                                    </div>
                                    <p id="errorSoLuongVoucher" style="color: red">${errorMessageSoLuongVoucher}</p>
                                    <%-- <div class="mt-3 mb-3">--%>
                                        <%-- <div class="text mt-2">--%>
                                            <%-- Trạng Thái--%>
                                                <%-- </div>--%>
                                                    <%-- <div class="form-check form-check-inline mt-2">--%>
                                                        <%-- <input class="form-check-input" type="radio"
                                                            name="trangThai" --%>
                                                            <%-- value="1" ${voucher.trangThai==1 ? 'checked' : ''
                                                                }>--%>
                                                                <%-- <label class="form-check-label">Hoạt
                                                                    Động</label>--%>
                                                                    <%-- </div>--%>
                                                                        <%-- <div
                                                                            class="form-check form-check-inline mt-2">--%>
                                                                            <%-- <input class="form-check-input"
                                                                                type="radio" name="trangThai" --%>
                                                                                <%-- value="0" ${voucher.trangThai==0
                                                                                    ? 'checked' : '' }>--%>
                                                                                    <%-- <label
                                                                                        class="form-check-label">Chưa
                                                                                        Hoạt Động</label>--%>
                                                                                        <%-- </div>--%>
                                                                                            <%-- </div>--%>
                                                                                                <div
                                                                                                    class="form-floating mb-3">
                                                                                                    <input
                                                                                                        id="floatingInputNgayKetThucVoucher"
                                                                                                        type="date"
                                                                                                        class="form-control"
                                                                                                        placeholder="Ngày kết thúc"
                                                                                                        name="ngayKetThuc"
                                                                                                        value="${voucher.ngayKetThuc}">
                                                                                                    <label
                                                                                                        for="floatingInput">Ngày
                                                                                                        kết thúc</label>
                                                                                                </div>


                                                                                                <div
                                                                                                    class="form-floating mb-3">
                                                                                                    <input
                                                                                                        id="floatingInputMucChiVoucher"
                                                                                                        type="number"
                                                                                                        class="form-control"
                                                                                                        placeholder="Mục Chi Tiêu Tối Thiểu"
                                                                                                        name="mucChiToiThieu"
                                                                                                        value="${voucher.mucChiToiThieu}">
                                                                                                    <label
                                                                                                        for="floatingInput">Mức
                                                                                                        chi tiêu tối
                                                                                                        thiểu</label>
                                                                                                </div>
                                                                                                <p id="errorMucChiVoucher"
                                                                                                    style="color: red">
                                                                                                    ${errorMessageMucChiVoucher}
                                                                                                </p>

                                                                                                <div
                                                                                                    class="form-floating mb-3">
                                                                                                    <input type="number"
                                                                                                        min="5000"
                                                                                                        class="form-control"
                                                                                                        id="floatingInputGioiHanVoucher"
                                                                                                        placeholder="Giới hạn giảm"
                                                                                                        name="gioiHan"
                                                                                                        value="${voucher.gioiHan}">
                                                                                                    <label
                                                                                                        for="floatingInput">Giới
                                                                                                        hạn giảm</label>
                                                                                                </div>
                                                                                                <p id="errorGioiHanVoucher"
                                                                                                    style="color: red">
                                                                                                    ${errorMessageGioiHanVoucher}
                                                                                                </p>

                                                                                                <div
                                                                                                    class="form-floating mb-3 mt-3">
                                                                                                    <input name="moTa"
                                                                                                        type="text"
                                                                                                        class="form-control"
                                                                                                        placeholder="Mô tả"
                                                                                                        value="${voucher.moTa}">
                                                                                                    <label
                                                                                                        for="floatingInput">Mô
                                                                                                        tả</label>
                                                                                                </div>
                                                                                                <div
                                                                                                    class="modal-footer">
                                                                                                    <button
                                                                                                        type="button"
                                                                                                        class="btn btn-secondary"
                                                                                                        data-bs-dismiss="modal">Đóng</button>
                                                                                                    <button
                                                                                                        type="submit"
                                                                                                        class="btn btn-success">Cập
                                                                                                        nhật</button>
                                                                                                </div>
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
                    if ($('#errorTenVoucher').text().trim() !== '') {
                        // Nếu có lỗi, set giá trị của input là rỗng
                        $('#floatingInputTenVoucher').val('');
                    }
                    if ($('#errorGiaTriGiamVoucher').text().trim() !== '') {
                        // Nếu có lỗi, set giá trị của input là rỗng
                        $('#floatingInputGiaTriGiamVoucher').val('');
                    }
                    if ($('#errorSoLuongVoucher').text().trim() !== '') {
                        // Nếu có lỗi, set giá trị của input là rỗng
                        $('#floatingInputSoLuongVoucher').val('');
                    }
                    if ($('#errorMucChiVoucher').text().trim() !== '') {
                        // Nếu có lỗi, set giá trị của input là rỗng
                        $('#floatingInputMucChiVoucher').val('');
                    }
                    if ($('#errorGioiHanVoucher').text().trim() !== '') {
                        // Nếu có lỗi, set giá trị của input là rỗng
                        $('#floatingInputGioiHanVoucher').val('');
                    }
                });
            </script>
        </body>

        </html>