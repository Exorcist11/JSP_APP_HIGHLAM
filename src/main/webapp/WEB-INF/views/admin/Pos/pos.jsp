<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>T-Shirt Luxury | ADMIN</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
        <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="../css/button.css" />
        <style>
          .square-button {
            width: 40px;
            height: 40px;
            padding: 0;
            border-radius: 0;
          }

          .w-70 {
            width: 70%;
          }
        </style>
      </head>

      <body class="g-sidenav-show bg-gray-100 text-sm">
        <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
        <main class="main-content max-height-vh-100 h-100 border-radius-lg pe-3">
          <nav class="navbar navbar-main navbar-expand-lg px-0 shadow-none border-radius-xl" id="navbarBlur"
            navbar-scroll="true">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                <li class="breadcrumb-item text-sm">
                  <a class="opacity-5 text-dark" href="javascript:;">Pages</a>
                </li>
                <li class="breadcrumb-item text-sm text-dark active" aria-current="page">
                  Bán tại quầy
                </li>
              </ol>
            </nav>
          </nav>

          <h2 class="">Bán Hàng Tại Quầy</h2>

          <div class="row">
            <div class="col-lg-8">
              <div class="card mb-4">
                <div class="card-body">
                  <form method="GET" action="/admin/pos">
                    <div class="input-group mb-3">
                      <input type="text" name="code" class="form-control"
                        placeholder="Tìm kiếm sản phẩm theo mã sản phẩm" />
                      <button class="btn btn-primary mb-0" type="submit">
                        <i class="fas fa-search"></i> Tìm kiếm
                      </button>
                    </div>
                  </form>

                  <div class="row row-cols-2 row-cols-md-3 row-cols-lg-3 g-3">
                    <!-- Product Card 1 -->
                    <c:forEach var="p" items="${products}">
                      <div class="col">
                        <div class="card product-card h-100">
                          <div class="product-img">
                            <img src="${p.firstImageUrl}" alt="Ảnh sản phẩm" width="100%" height="auto"
                              style="min-height: 151px; object-position: center" />
                          </div>
                          <div class="card-body">
                            <h5 class="card-title product-name">
                              ${p.product.name} - ${p.size.name} - ${p.color.name}
                            </h5>
                            <div class="d-flex justify-content-between align-items-center">
                              <span class="text-danger fw-bold">
                                <fmt:formatNumber value="${p.product.price}" groupingUsed="true"
                                  maxFractionDigits="0" />
                                VND
                              </span>
                              <span class="badge bg-success">Còn: ${p.quantity}</span>
                            </div>
                            <div class="small text-muted mt-1">Mã: ${p.code}</div>
                          </div>
                          <div class="card-footer bg-transparent">
                            <form method="post" action="/admin/pos">
                              <input type="hidden" name="action" value="add">
                              <input type="hidden" name="code" value="${p.code}">
                              <button class="btn btn-sm btn-primary w-100" type="submit">
                                <i class="fas fa-cart-plus"></i> Thêm vào giỏ
                              </button>
                            </form>
                          </div>
                        </div>
                      </div>
                    </c:forEach>

                    <!-- Thêm các sản phẩm khác ở đây -->
                  </div>
                </div>
              </div>
            </div>

            <!-- Cart Panel -->
            <div class="col-lg-4">
              <div class="cart-panel p-3 sticky-top" style="top: 20px">
                <div class="d-flex justify-content-between align-items-center mb-3">
                  <h4 class="mb-0">Đơn hàng hiện tại</h4>
                  <span class="badge bg-secondary"></span>
                </div>

                <div class="cart-items mb-3" style="max-height: 400px; overflow-y: auto">
                  <c:forEach var="item" items="${cart}">
                    <div class="d-flex justify-content-between align-items-center py-2 border-bottom ">
                      <div class="me-3 w-70">
                        <div class="fw-bold">${item.productName} - ${item.sizeName} - ${item.colorName} </div>

                        <div class="small text-muted">
                          <fmt:formatNumber value="${item.price}" groupingUsed="true" maxFractionDigits="0" />đ x
                          ${item.quantity}

                        </div>
                      </div>
                      <div class="d-flex align-items-center cart-item-controls border bg-white rounded-3">
                        <form method="POST" action="/admin/pos" class="d-inline">
                          <input type="hidden" name="action" value="update">
                          <input type="hidden" name="code" value="${item.productDetailCode}">
                          <button type="submit" value="${item.quantity - 1}" name="quantity"
                            class="btn btn-outline-secondary btn-sm mb-0 square-button">
                            <i class="fas fa-minus"></i>
                          </button>

                        </form>
                        <input type="text" class="form-control form-control-sm text-center border-0"
                          value="${item.quantity}" readonly>
                        <form method="POST" action="/admin/pos" class="d-inline">
                          <input type="hidden" name="action" value="update">
                          <input type="hidden" name="code" value="${item.productDetailCode}">
                          <button type="submit" value="${item.quantity + 1}" name="quantity"
                            class="btn btn-outline-secondary btn-sm mb-0 square-button">
                            <i class="fas fa-plus"></i>
                          </button>
                        </form>
                      </div>
                    </div>
                  </c:forEach>
                </div>

                <!-- Tổng tiền -->
                <div class="d-flex justify-content-between align-items-center py-2 border-top">
                  <div class="fw-bold">Tổng cộng:</div>
                  <div class="fw-bold fs-5">
                    <fmt:formatNumber value="${total}" groupingUsed="true" maxFractionDigits="0" />đ
                  </div>
                </div>

                <!-- Nút hủy đơn và thanh toán -->
                <div class="row mt-3">
                  <form method="POST" action="/admin/pos" class="col">
                    <input type="hidden" name="action" value="clear">
                    <button type="submit" class="btn btn-outline-danger w-100">
                      <i class="fas fa-trash-alt"></i> Hủy đơn
                    </button>
                  </form>
                  <button type="button" class="btn btn-success col w-100" data-bs-toggle="modal" data-bs-target="#checkoutModal">
                    <i class="fas fa-credit-card"></i> Thanh toán
                  </button>
                </div>
              </div>
            </div>
          </div>
        </main>

        <!-- Modal Thanh toán -->
        <div class="modal fade" id="checkoutModal" tabindex="-1" aria-labelledby="checkoutModalLabel"
          aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="checkoutModalLabel">Xác nhận thanh toán</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <form method="POST" action="/admin/pos">
                <div class="modal-body">
                  <input type="hidden" name="action" value="checkout">
                  <div class="mb-3">
                    <label for="recipientName" class="form-label">Tên người nhận</label>
                    <input type="text" class="form-control" id="recipientName" name="recipientName" required>
                  </div>
                  <div class="mb-3">
                    <label for="recipientPhone" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="recipientPhone" name="recipientPhone" required>
                  </div>
                  <div class="mb-3">
                    <label for="recipientAddress" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="recipientAddress" name="recipientAddress" required>
                  </div>
                  <p>Tổng tiền: <strong>
                      <fmt:formatNumber value="${total}" groupingUsed="true" maxFractionDigits="0" />đ
                    </strong></p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                  <button type="submit" class="btn btn-success">Xác nhận thanh toán</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </body>

      </html>