<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>T-SHIRT LUXURY</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      inegrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <link
      rel="shortcut icon"
      href="../images/favicon.png"
      type="image/x-icon"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/fragments/headerProduct.jsp" />
    <!-- End Header -->

    <div class="container-fluid">
      <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-primary">
          <jsp:include page="/WEB-INF/views/Profile/fragments/sideBar.jsp" />
        </div>

        <div class="col py-3">
          <div class="p-2 bd-highlight d-flex justify-content-start mt-3">
            <a type="button" href="/history" class="btn btn-outline-secondary">
              <i class="fa-solid fa-backward"></i> Trở lại
            </a>
          </div>
          <h2 class="text-center mb-4">Chi tiết đơn hàng</h2>

          <div class="row" style="font-size: 14px">
            <div class="w-75">
              <table class="table table-striped border rounded">
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
                        <fmt:formatNumber
                          value="${item.price}"
                          pattern="#,##0"
                        />
                        VND
                      </th>
                    </tr>
                  </c:forEach>
                </thead>
              </table>
            </div>

            <div class="w-25">
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
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
  </body>
</html>
