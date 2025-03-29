<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>T-Shirt Luxury | ADMIN</title>
    <link
      rel="shortcut icon"
      href="${pageContext.request.contextPath}/images/favicon.png"
      type="image/x-icon"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>

  <body class="container">
    <div>
      <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />

      <div class="row mt-3">
        <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
        <div class="col-9" style="">
          <div class="row">
            <h2 class="">Quản Lý Hóa Đơn Online</h2>

            <!-- <div class="p-2 bd-highlight d-flex justify-content-end">
                    <button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
                        data-bs-target="#themSanPham">
                        <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                    </button>
                </div> -->

            <table class="table table-striped border rounded">
              <thead>
                <tr>
                  <th scope="col">STT</th>
                  <th scope="col">Tên Khách Hàng</th>
                  <th scope="col">Trạng Thái</th>
                  <th scope="col">Ngày Tạo</th>
                  <th scope="col">Ngày Sửa</th>
                  <th scope="col">Tổng Tiền</th>

                  <th scope="col">Hành Động</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${listHoaDonOnline}" var="hd" varStatus="i">
                  <tr>
                    <td>${i.index +1}</td>
                    <td>${hd.thongTinNhanHang.hoVaTen}</td>
                    <%--
                    <td>
                      ${hd.trangThai == 1 ? "Thành công" : (hd.trangThai == 2 ?
                      "Chờ xác nhận" : "Đang giao hàng")}
                    </td>
                    --%>
                    <td>
                      <c:if test="${hd.trangThai == 0}">
                        <span class="badge bg-primary">Chờ thanh toán</span>
                      </c:if>
                      <c:if test="${hd.trangThai == 1}">
                        <span class="badge bg-success">Đã thanh toán</span>
                      </c:if>
                      <c:if test="${hd.trangThai == 2}">
                        <span class="badge bg-secondary">Chờ xác nhận</span>
                      </c:if>
                      <c:if test="${hd.trangThai == 3}">
                        <span class="badge bg-warning text-dark"
                          >Đang giao hàng</span
                        >
                      </c:if>
                      <c:if test="${hd.trangThai == 4}">
                        <span class="badge bg-info text-dark"
                          >Giao hàng thành công</span
                        >
                      </c:if>
                    </td>
                    <td>${hd.ngayTao}</td>
                    <td>${hd.ngaySua}</td>
                    <td>${hd.tongTien}</td>

                    <th scope="row">${i.index +1}</th>
                    <th scope="row">${hd.thongTinNhanHang.hoVaTen}</th>
                    <th scope="row">
                      <c:choose>
                        <c:when test="${hd.trangThai == 0}">
                          Chờ thanh toán
                        </c:when>
                        <c:when test="${hd.trangThai == 1}">
                          Đã thanh toán
                        </c:when>
                        <c:when test="${hd.trangThai == 2}">
                          Chờ xác nhận
                        </c:when>
                        <c:when test="${hd.trangThai == 3}">
                          Đang giao hàng
                        </c:when>
                        <c:when test="${hd.trangThai == 4}">
                          Đã giao hàng
                        </c:when>
                        <c:otherwise> </c:otherwise>
                      </c:choose>
                    </th>
                    <th scope="row">${hd.ngayTao}</th>
                    <th scope="row">${hd.tongTien}</th>
                    <th scope="row">${hd.moTa}</th>
                    <td>
                      <a
                        href="/t-shirt-luxury/admin/hoa-don-online/detail?idHoaDonOnline=${hd.id}"
                        class="btn btn-secondary rounded-pill"
                        data-toggle="tooltip"
                        data-placement="top"
                        title="Xem Chi Tiết"
                      >
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
  </body>
</html>
