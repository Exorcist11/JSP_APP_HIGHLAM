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
    <link
      rel="shortcut icon"
      href="../images/favicon.png"
      type="image/x-icon"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../css/button.css" />
  </head>

  <body class="g-sidenav-show bg-gray-100 text-sm">
    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
    <main class="main-content max-height-vh-100 h-100 border-radius-lg pe-3">
      <nav
        class="navbar navbar-main navbar-expand-lg px-0 shadow-none border-radius-xl"
        id="navbarBlur"
        navbar-scroll="true"
      >
        <nav aria-label="breadcrumb">
          <ol
            class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5"
          >
            <li class="breadcrumb-item text-sm">
              <a class="opacity-5 text-dark" href="javascript:;">Pages</a>
            </li>
            <li
              class="breadcrumb-item text-sm text-dark active"
              aria-current="page"
            >
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
              <div class="input-group mb-3">
                <input
                  type="text"
                  class="form-control"
                  placeholder="Tìm kiếm sản phẩm theo tên, mã SKU..."
                />
                <button class="btn btn-primary mb-0" type="button">
                  <i class="fas fa-search"></i> Tìm kiếm
                </button>
              </div>

              <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3">
                <!-- Product Card 1 -->
                <div class="col">
                  <div class="card product-card h-100">
                    <div class="product-img">
                      <span>Hình ảnh áo thun</span>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title product-name">
                        Áo thun nam cổ tròn
                      </h5>
                      <div
                        class="d-flex justify-content-between align-items-center"
                      >
                        <span class="text-danger fw-bold">250.000đ</span>
                        <span class="badge bg-success">Còn: 15</span>
                      </div>
                      <div class="small text-muted mt-1">Mã: ATN001</div>
                    </div>
                    <div class="card-footer bg-transparent">
                      <button class="btn btn-sm btn-primary w-100">
                        <i class="fas fa-cart-plus"></i> Thêm vào giỏ
                      </button>
                    </div>
                  </div>
                </div>

                <!-- Product Card 2 -->
                <div class="col">
                  <div class="card product-card h-100">
                    <div class="product-img">
                      <span>Hình ảnh quần jeans</span>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title product-name">
                        Quần jeans nữ ống rộng
                      </h5>
                      <div
                        class="d-flex justify-content-between align-items-center"
                      >
                        <span class="text-danger fw-bold">450.000đ</span>
                        <span class="badge bg-warning text-dark">Còn: 8</span>
                      </div>
                      <div class="small text-muted mt-1">Mã: QJN001</div>
                    </div>
                    <div class="card-footer bg-transparent">
                      <button class="btn btn-sm btn-primary w-100">
                        <i class="fas fa-cart-plus"></i> Thêm vào giỏ
                      </button>
                    </div>
                  </div>
                </div>

                <!-- Product Card 3 -->
                <div class="col">
                  <div class="card product-card h-100">
                    <div class="product-img">
                      <span>Hình ảnh váy</span>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title product-name">Váy liền công sở</h5>
                      <div
                        class="d-flex justify-content-between align-items-center"
                      >
                        <span class="text-danger fw-bold">380.000đ</span>
                        <span class="badge bg-success">Còn: 12</span>
                      </div>
                      <div class="small text-muted mt-1">Mã: VLCS001</div>
                    </div>
                    <div class="card-footer bg-transparent">
                      <button class="btn btn-sm btn-primary w-100">
                        <i class="fas fa-cart-plus"></i> Thêm vào giỏ
                      </button>
                    </div>
                  </div>
                </div>

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
              <span class="badge bg-secondary">#DH12345</span>
            </div>

            <div
              class="cart-items mb-3"
              style="max-height: 400px; overflow-y: auto"
            >
              <!-- Cart Item 1 -->
              <div
                class="d-flex justify-content-between align-items-center py-2 border-bottom"
              >
                <div class="me-3">
                  <div class="fw-bold">Áo thun nam cổ tròn</div>
                  <div class="small text-muted">250.000đ x 2</div>
                </div>
                <div
                  class="d-flex align-items-center cart-item-controls border bg-white rounded-3"
                >
                  <button class="btn btn-outline-secondary btn-sm mb-0">
                    <i class="fas fa-minus"></i>
                  </button>
                  <input
                    type="text"
                    class="form-control form-control-sm text-center border-0"
                    value="2"
                  />
                  <button class="btn btn-outline-secondary btn-sm mb-0">
                    <i class="fas fa-plus"></i>
                  </button>
                </div>
              </div>

              <!-- Cart Item 2 -->
              <div
                class="d-flex justify-content-between align-items-center py-2 border-bottom"
              >
                <div class="me-3">
                  <div class="fw-bold">Quần jeans nữ ống rộng</div>
                  <div class="small text-muted">450.000đ x 1</div>
                </div>
                <div class="d-flex align-items-center cart-item-controls">
                  <button class="btn btn-outline-secondary btn-sm">
                    <i class="fas fa-minus"></i>
                  </button>
                  <input
                    type="text"
                    class="form-control form-control-sm text-center"
                    value="1"
                  />
                  <button class="btn btn-outline-secondary btn-sm">
                    <i class="fas fa-plus"></i>
                  </button>
                </div>
              </div>
            </div>

            <div
              class="d-flex justify-content-between align-items-center py-2 border-top"
            >
              <div class="fw-bold">Tổng cộng:</div>
              <div class="fw-bold fs-5">950.000đ</div>
            </div>

            <div class="d-grid gap-2 mt-3">
              <button class="btn btn-outline-danger">
                <i class="fas fa-trash-alt"></i> Hủy đơn
              </button>
              <button class="btn btn-success">
                <i class="fas fa-credit-card"></i> Thanh toán
              </button>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
