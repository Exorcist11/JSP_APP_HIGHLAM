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
          <h2 class="text-center mb-4">Lịch sử mua hàng</h2>

          <table class="table table-hover table-bordered">
            <thead class="table-dark">
              <tr>
                <th>ID</th>
                <th>Ngày đặt hàng</th>
                <th>Trạng thái</th>
                <th>Người nhận</th>
                <th>Địa chỉ</th>
                <th>Tổng tiền</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="order" items="${orders}">
                <tr>
                  <td>${order.id}</td>
                  <td>${order.orderDate}</td>
                  <td>${order.status}</td>
                  <td>${order.recipientName}</td>
                  <td>${order.recipientAddress}</td>
                  <td class="text-end">${order.totalAmount} VND</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
  </body>
</html>
