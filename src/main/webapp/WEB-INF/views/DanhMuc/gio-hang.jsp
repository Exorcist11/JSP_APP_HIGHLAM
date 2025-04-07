<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Áo Nam</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
    <link href="../css/aoNam.css" rel="stylesheet" />
  </head>
  <body>
    <div class="drawer">
      <div
        class="offcanvas offcanvas-end"
        tabindex="-1"
        id="cartDrawer"
        aria-labelledby="cartDrawerLabel"
      >
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="cartDrawerLabel">Giỏ hàng</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
          ></button>
        </div>
        <div class="offcanvas-body">
          <div id="cartItems">
            <c:forEach items="${cartItems}" var="item">
              <div
                class="cart-item d-flex justify-content-between align-items-center"
              >
                <div class="cart-item-image">
                  <img
                    src="${item.productDetail.firstImageUrl}"
                    alt="Product"
                    class="img-fluid"
                    width="300px"
                    height="200px"
                  />
                </div>
                <div class="cart-item-info">
                  <p>
                    ${item.productDetail.product.name} -
                    ${item.productDetail.color.name} -
                    ${item.productDetail.size.name}
                  </p>
                  <p>
                    <fmt:formatNumber
                      value="${item.productDetail.product.price}"
                      groupingUsed="true"
                      maxFractionDigits="0"
                    />
                    đ x ${item.quantity}
                  </p>
                </div>
                <form method="POST" action="/cart/remove" class="d-inline">
                  <input
                    type="hidden"
                    name="productDetailId"
                    value="${item.productDetail.id}"
                  />
                  <button type="submit" class="btn btn-danger btn-sm">
                    Xóa
                  </button>
                </form>
              </div>
              <hr />
            </c:forEach>
          </div>
          <div class="d-flex justify-content-between">
            <strong>Tổng tiền tạm tính:</strong>
            <span id="totalPrice">
              <fmt:formatNumber
                value="${totalPrice}"
                groupingUsed="true"
                maxFractionDigits="0"
              />
              đ
            </span>
          </div>
          <a class="btn btn-dark w-100 mt-3" href="/cart/checkout"
            >TIẾN HÀNH ĐẶT HÀNG</a
          >
          <a href="/cart" class="btn btn-light w-100 mt-2 text-center"
            >Xem chi tiết giỏ hàng ➔</a
          >
        </div>
      </div>
    </div>
    <!-- <script src="../js/actionCart.js"></script> -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <!-- <script src="../js/cart.js"></script> -->
  </body>
</html>
