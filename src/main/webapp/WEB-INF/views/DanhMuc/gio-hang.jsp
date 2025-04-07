<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <style></style>
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
              <div class="cart-item d-flex align-items-center gap-2">
                <div class="cart-item-image">
                  <img
                    src="${item.imageUrl}"
                    alt="Product"
                    class="img-fluid"
                    width="150px"
                    height="150px"
                  />
                </div>
                <div
                  class="d-flex align-items-center justify-content-between w-100"
                >
                  <div class="cart-item-info">
                    <h6 class="mb-1">
                      ${item.productName} - ${item.colorName} - ${item.sizeName}
                    </h6>

                    <p class="mb-1">
                      <fmt:formatNumber
                        value="${item.price}"
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
                      value="${item.productDetailId}"
                    />
                    <button type="submit" class="btn btn-danger btn-sm">
                      Xóa
                    </button>
                  </form>
                </div>
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
