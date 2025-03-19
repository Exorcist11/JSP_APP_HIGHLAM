<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thanh toán đơn hàng</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>
  <body class="container">
    <form method="post">
      <div class="row">
        <div class="col-6 mt-5">
          <a href="" style="text-decoration: none">Giỏ hàng > </a> Thanh toán
          <div class="TTGH" style="margin-top: 60px">
            <h5>Thông tin giao hàng</h5>
            <div class="mb-3">
              <input
                style="width: 600px; height: 50px"
                class="form-control me-2"
                placeholder="Họ và tên"
                name="recipientName"
                required
              />
            </div>
            <div class="mb-3">
              <input
                style="width: 600px; height: 50px"
                class="form-control me-2"
                placeholder="Email"
                name="guestEmail"
                required
              />
            </div>
            <div class="mb-3">
              <input
                style="width: 600px; height: 50px"
                class="form-control me-2"
                placeholder="Số điện thoại"
                name="recipientPhone"
                required
              />
            </div>
            <div class="mb-3">
              <input
                style="width: 600px; height: 50px"
                class="form-control me-2"
                placeholder="Địa chỉ"
                name="recipientAddress"
              />
            </div>
            <div class="mb-3">
              <textarea
                style="width: 600px; height: 100px"
                class="form-control me-2"
                placeholder="Ghi chú"
                name="note"
                required
              ></textarea>
            </div>
          </div>
          <div>
            <h5 class="fw-normal">Phương thức thanh toán</h5>
            <div class="d-flex">
              <input type="radio" id="cod" value="1" checked name="trangThai" />
              <label for="cod" style="margin-left: 10px; cursor: pointer">
                Thanh toán khi nhận hàng (COD)
              </label>
            </div>

            <div class="d-flex">
              <input type="radio" id="online" value="2" name="trangThai" />
              <label for="online" style="margin-left: 10px; cursor: pointer">
                Thanh toán trực tuyến
              </label>
            </div>
          </div>
          <!-- <form action="/pay" method="get">
                  <button id="vnPay" type="submit" style="margin-left: 400px; height: 45px; font-size: large;" class="btn btn-secondary">Thanh toán VNPay</button>
              </form> -->
        </div>

        <div class="col-6 mt-3" style="background-color: rgb(247, 247, 247)">
          <div id="tableCart"></div>

          <c:if test="${not empty cartItems}">
            <table class="table table-bordered text-center mt-3">
              <thead class="table-light">
                <tr>
                  <th>Tên sản phẩm</th>
                  <th>Size</th>
                  <th>Màu sắc</th>
                  <th>Số lượng</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="item" items="${cartItems}">
                  <tr>
                    <td>${item.productName}</td>
                    <td>${item.size}</td>
                    <td>${item.color}</td>
                    <td>${item.quantity}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </c:if>
          <hr />
          <h6 class="fw-normal">Phí vận chuyển: 35,000₫</h6>
          <hr />
          <div class="d-flex justify-content-between">
            <h5 class="fw-normal">Tổng cộng:</h5>
            <p id="total-price"></p>
          </div>
          <button
            type="submit"
            style="height: 45px; font-size: large"
            class="btn btn-secondary"
          >
            Hoàn tất đơn hàng
          </button>
        </div>
      </div>
    </form>
    <script src="../js/checkoutCart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
