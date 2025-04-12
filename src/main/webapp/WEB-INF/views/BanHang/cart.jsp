<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
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
    <style>
      .product-img {
        max-height: 150px;
        object-position: center;
        object-fit: cover;
      }
      .cart-item {
        border-bottom: 1px solid #eee;
        padding: 15px 0;
      }
      .cart-item:last-child {
        border-bottom: none;
      }
      .quantity-control {
        display: flex;
        align-items: center;
        gap: 10px;
      }
      .quantity-btn {
        width: 30px;
        height: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid #ddd;
        background: #f8f9fa;
        cursor: pointer;
      }
      .summary-section {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 5px;
        margin-top: 30px;
      }
      .checkout-btn {
        width: 100%;
        padding: 10px;
        font-weight: bold;
      }
      .remove-btn {
        color: #dc3545;
        background: none;
        border: none;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

    <div class="container" style="padding-top: 90px">
      <div style="min-height: 700px" class="mt-5">
        <div class="cart-container">
          <h2 class="text-center mb-4">
            GIỎ HÀNG CỦA BẠN
            <c:if test="${not empty cartItems}">
              (Có ${cartItems.size()} sản phẩm trong giỏ hàng)
            </c:if>
          </h2>

          <c:if test="${not empty cartItems}">
            <div class="cart-items">
              <c:forEach var="item" items="${cartItems}">
                <div class="cart-item row">
                  <div class="col-md-8">
                    <div class="d-flex gap-3">
                      <img
                        src="${item.imageUrl}"
                        alt="Product"
                        class="product-img"
                        width="150px"
                        height="150px"
                      />
                      <div class="d-flex justify-content-center flex-column">
                        <h5>
                          ${item.productName} - ${item.colorName} -
                          ${item.sizeName}
                        </h5>
                        <button class="remove-btn border">Xóa</button>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-2 quantity-control">
                    <input type="hidden" name="code" id="code" value="${item.productDetailCode}">
                    <span class="quantity-btn minus">-</span>
                    <span>${item.quantity}</span>
                    <span class="quantity-btn plus">+</span>
                  </div>
                  <div
                    class="col-md-2 d-flex align-items-center justify-content-end"
                  >
                    <strong>
                      <fmt:formatNumber
                        value="${item.price}"
                        groupingUsed="true"
                        maxFractionDigits="0"
                      />đ</strong
                    >
                  </div>
                </div>
              </c:forEach>
            </div>

            <div class="summary-section">
              <h4>TÓM TẮT ĐƠN HÀNG</h4>
              <p class="text-muted">Chưa bao gồm phí vận chuyển:</p>

              <div class="d-flex justify-content-between mt-3">
                <h5>Tổng tiền:</h5>
                <h5>
                  <fmt:formatNumber
                    value="${totalPrice}"
                    groupingUsed="true"
                    maxFractionDigits="0"
                  />
                  đ
                </h5>
              </div>

              <p class="text-muted mt-2">
                <em>Bạn có thể nhập mã giảm giá ở trong thanh toán</em>
              </p>
            </div>

            <div class="row mt-4">
              <div class="col-md-6">
                <a href="/" class="btn btn-outline-dark w-100"
                  >MUA THÊM SẢN PHẨM</a
                >
              </div>
              <div class="col-md-6">
                <a href="/cart/checkout" class="btn btn-dark checkout-btn"
                  >TIẾN HÀNH ĐẶT HÀNG</a
                >
              </div>
            </div>
          </c:if>

          <c:if test="${empty cartItems}">
            <p class="text-danger text-center">
              🛒 Giỏ hàng của bạn đang trống!
            </p>
            <div class="text-center mt-3">
              <a href="/" class="btn btn-secondary">🛍 Tiếp tục mua sắm</a>
            </div>
          </c:if>
        </div>
      </div>

      <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
    </div>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        let cartContainer = document.querySelector(".cart-container");
        let emptyCartMessage = document.querySelector(
          ".text-danger.text-center"
        );

        // Quantity control handlers
        document.querySelectorAll(".quantity-btn").forEach((btn) => {
          btn.addEventListener("click", function () {
            const isPlus = this.classList.contains("plus");
            const quantityElement = this.parentElement.querySelector(
              "span:not(.quantity-btn)"
            );
            let quantity = parseInt(quantityElement.textContent);
            let code = document.getElementById("code").value;
            
            if (isPlus) {
              console.log(code);
              quantity++;
            } else if (quantity > 1) {
              quantity--;
            }

            quantityElement.textContent = quantity;
            // Here you would update the cart in localStorage and recalculate total
            fetch("/api/updateCart?code=" + encodeURIComponent(code) + "&quantity=" + quantity, {
                method: "POST"
              })
                .then((response) => {
                  if (!response.ok) {
                    throw new Error("Lỗi khi cập nhật giỏ hàng");
                  }
                  return response.text();
                })
                .then((data) => {
                  console.log("Server:", data);
                  window.location.reload();
                })
                .catch((error) => {
                  console.error("Lỗi:", error);
                });
          });
        });

        // Remove item handler
        document.querySelectorAll(".remove-btn").forEach((btn) => {
          btn.addEventListener("click", function () {
            const itemElement = this.closest(".cart-item");
            // Here you would remove the item from localStorage
            itemElement.remove();
            // Update cart count and total
          });
        });
      });
    </script>
  </body>
</html>
