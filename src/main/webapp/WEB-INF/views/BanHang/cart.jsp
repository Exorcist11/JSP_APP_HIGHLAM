<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CART</title>

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

    <div class="container">
      <div style="min-height: 700px" class="mt-5">
        <div class="cart-container">
          <h2 class="text-center mb-4">🛒 Giỏ hàng của bạn</h2>

          <c:if test="${not empty cartItems}">
            <table class="table table-bordered text-center mt-3">
              <thead class="table-light">
                <tr>
                  <th>Tên sản phẩm</th>
                  <th>Size</th>
                  <th>Màu sắc</th>
                  <th>Số lượng</th>
                  <th>Hành động</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="item" items="${cartItems}">
                  <tr>
                    <td>${item.productName}</td>
                    <td>${item.size}</td>
                    <td>${item.color}</td>
                    <td>
                      <input
                        type="number"
                        value="${item.quantity}"
                        class="form-control text-center"
                        min="1"
                      />
                    </td>
                    <td>
                      <button
                        class="btn btn-primary"
                        style="width: fit-content"
                      >
                        Cập nhật
                      </button>
                      <button class="btn btn-danger" style="width: fit-content">
                        Xóa
                      </button>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </c:if>
          <c:if test="${empty cartItems}">
            <p class="text-danger text-center">
              🛒 Giỏ hàng của bạn đang trống!
            </p>
          </c:if>
          <div class="text-center mt-3">
            <a href="/" class="btn btn-secondary">🛍 Tiếp tục mua sắm</a>
            <a href="/cart/checkout" class="btn btn-success">💳 Thanh toán</a>
          </div>
        </div>
      </div>

      <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
    </div>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        let cartItems = JSON.parse(localStorage.getItem("cart")) || [];
        console.log(cartItems);

        let cartContainer = document.querySelector(".cart-container");
        let emptyCartMessage = document.querySelector(
          ".text-danger.text-center"
        );

        // Nếu có sản phẩm trong LocalStorage nhưng không có bảng, thì tạo bảng
        if (cartItems.length > 0) {
          // Ẩn thông báo "Giỏ hàng trống" nếu có
          if (emptyCartMessage) emptyCartMessage.style.display = "none";

          // Kiểm tra bảng có tồn tại không, nếu không thì tạo
          let cartTable = document.querySelector(".table");
          if (!cartTable) {
            let tableHtml = `
              <table class="table table-bordered text-center mt-3">
                <thead class="table-light">
                  <tr>
                    <th>Tên sản phẩm</th>
                    <th>Size</th>
                    <th>Màu sắc</th>
                    <th>Số lượng</th>
                    <th>Hành động</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>`;
            cartContainer.insertAdjacentHTML("afterbegin", tableHtml);
            cartTable = document.querySelector(".table tbody");
          } else {
            cartTable = cartTable.querySelector("tbody");
          }

          // Thêm sản phẩm từ LocalStorage vào bảng
          cartItems.forEach((item) => {
            let row = document.createElement("tr");
            row.innerHTML = `
              <td>${item.productName} 1</td>
              <td>${item.size}</td>
              <td>${item.color}</td>
              <td><input type="number" value="${item.quantity}" class="form-control text-center" min="1" /></td>
              <td>
                <button class="btn btn-primary update-cart" data-id="${item.productId}">Cập nhật</button>
                <button class="btn btn-danger remove-cart" data-id="${item.productId}">Xóa</button>
              </td>
            `;
            cartTable.appendChild(row);
          });
        }
      });

      // Xử lý nút "Xóa" sản phẩm khỏi LocalStorage
      document.addEventListener("click", function (event) {
        if (event.target.classList.contains("remove-cart")) {
          let productId = event.target.getAttribute("data-id");
          let cartItems = JSON.parse(localStorage.getItem("cart")) || [];
          cartItems = cartItems.filter((item) => item.productId != productId);
          localStorage.setItem("cart", JSON.stringify(cartItems));
          location.reload();
        }
      });
    </script>
  </body>
</html>
