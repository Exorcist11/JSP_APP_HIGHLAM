<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />

    <div class="row">
      <div class="p-2 bd-highlight d-flex justify-content-start mt-3">
        <a type="button" href="/admin/order" class="btn btn-outline-secondary">
          <i class="fa-solid fa-backward"></i> Trở lại
        </a>
      </div>
      <div class="row mt-2">
        <h3 class="text-center">Thông tin đặt hàng</h3>
        <table class="table table-bordered table-striped">
          <tbody>
            <tr hidden>
              <th>ID</th>
              <td>${order.id}</td>
            </tr>
            <tr>
              <th>Mã Hoá Đơn</th>
              <td>${order.code}</td>
            </tr>
            <tr>
              <th>Ngày Đặt Hàng</th>
              <td>
                <fmt:formatDate
                  value="${order.createdAt}"
                  pattern="dd/MM/yyyy  HH:mm:ss"
                />
              </td>
            </tr>
            <tr>
              <th>Email</th>
              <td>${order.guestEmail}</td>
            </tr>
            <tr>
              <th>Địa Chỉ</th>
              <td>${order.recipientAddress}</td>
            </tr>
            <tr>
              <th>Người Nhận</th>
              <td>${order.recipientName}</td>
            </tr>
            <tr>
              <th>Số Điện Thoại</th>
              <td>${order.recipientPhone}</td>
            </tr>
            <tr>
              <th>Trạng Thái</th>
              <td>${order.status}</td>
            </tr>
            <tr>
              <th>Cập Nhật</th>
              <td>
                <fmt:formatDate
                  value="${order.updatedAt}"
                  pattern="dd/MM/yyyy HH:mm:ss"
                />
              </td>
            </tr>

            <tr>
              <th>Ghi Chú</th>
              <td>${order.notes}</td>
            </tr>

            <tr>
              <th>Total Amount</th>
              <td>
                <fmt:formatNumber
                  value="${order.totalAmount}"
                  pattern="#,##0"
                />
                VND
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="row mt-2">
        <h3 class="text-center">Thông tin sản phẩm</h3>
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">STT</th>
              <th scope="col">Tên Sản Phẩm</th>
              <th scope="col">Size</th>
              <th scope="col">Màu Sắc</th>
              <th scope="col">Số Lượng</th>
              <th scope="col">Đơn Giá</th>
            </tr>
            <c:forEach items="${orderItems}" var="item" varStatus="i">
              <tr>
                <td scope="col">${i.index +1}</td>
                <td scope="col">${item.productDetail.product.name}</td>
                <td scope="col">${item.productDetail.size.name}</td>
                <td scope="col">${item.productDetail.color.name}</td>
                <td scope="col">${item.quantity}</td>
                <th scope="col">
                  <fmt:formatNumber value="${item.price}" pattern="#,##0" /> VND
                </th>
              </tr>
            </c:forEach>
          </thead>
        </table>
      </div>
    </div>
  </body>
</html>
