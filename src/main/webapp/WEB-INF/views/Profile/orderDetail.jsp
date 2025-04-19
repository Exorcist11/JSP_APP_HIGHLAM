<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>T-SHIRT LUXURY - Chi tiết đơn hàng</title>
  <link rel="stylesheet" href="../css/style.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
  <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon" />
  <link rel="stylesheet" href="../css/order-detail.css" />
</head>

<body>
  <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

  <div class="container-fluid" style="margin-top: 90px">
    <div class="row flex-nowrap">
      <div class="col-auto col-md-3 col-xl-2 px-0">
        <jsp:include page="/WEB-INF/views/Profile/fragments/sideBar.jsp" />
      </div>

      <div class="col py-3">
        <!-- Page Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
          <a href="/history" class="btn btn-outline-secondary">
            <i class="fa-solid fa-arrow-left me-2"></i>Quay lại
          </a>
          <h2 class="mb-0 text-center flex-grow-1">Chi tiết đơn hàng #${order.code}</h2>
        </div>

        <!-- Order Summary Header -->
        <div class="order-header-card mb-4">
          <div class="card shadow-sm border-0">
            <!-- Order Header -->
            <div class="card-header bg-white">
              <div class="d-flex align-items-center">
                <div class="order-icon me-3">
                  <i class="fas fa-clipboard-list text-primary fa-2x"></i>
                </div>
                <div>
                  <h5 class="mb-0">Đơn hàng #${order.code}</h5>
                  <p class="text-muted small mb-0">
                    <i class="fas fa-clock me-1"></i>
                    <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm:ss" />
                  </p>
                </div>
                <div class="ms-auto">
                  <span class="order-status status-${order.getStatus()}">
                    <i class="fas fa-circle me-1 small"></i>${order.getVietnameseStatus()}
                  </span>
                </div>
              </div>
            </div>
            
            <!-- Order Details -->
            <div class="card-body">
              <div class="row g-4">
                <!-- Order Information -->
                <div class="col-md-6">
                  <div class="info-section">
                    <h6 class="text-uppercase text-muted small fw-bold mb-3">
                      <i class="fas fa-info-circle me-2"></i>Thông tin đơn hàng
                    </h6>
                    
                    <div class="d-flex mb-3">
                      <div class="info-label">Mã đơn hàng:</div>
                      <div class="info-value fw-bold">${order.code}</div>
                    </div>
                    
                    <div class="d-flex mb-3">
                      <div class="info-label">Ngày đặt:</div>
                      <div class="info-value">
                        <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm:ss" />
                      </div>
                    </div>
                    
                    <div class="d-flex mb-3">
                      <div class="info-label">Email:</div>
                      <div class="info-value">${order.guestEmail}</div>
                    </div>
                    
                    <div class="d-flex mb-3">
                      <div class="info-label">Tổng tiền:</div>
                      <div class="info-value">
                        <span class="text-danger fw-bold">
                          <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0" /> VND
                        </span>
                      </div>
                    </div>
                    
                    <div class="d-flex">
                      <div class="info-label">Cập nhật:</div>
                      <div class="info-value">
                        <fmt:formatDate value="${order.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss" />
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- Shipping Information -->
                <div class="col-md-6">
                  <div class="info-section">
                    <h6 class="text-uppercase text-muted small fw-bold mb-3">
                      <i class="fas fa-shipping-fast me-2"></i>Thông tin nhận hàng
                    </h6>
                    
                    <div class="d-flex mb-3">
                      <div class="info-label">Người nhận:</div>
                      <div class="info-value fw-bold">${order.recipientName}</div>
                    </div>
                    
                    <div class="d-flex mb-3">
                      <div class="info-label">Điện thoại:</div>
                      <div class="info-value">${order.recipientPhone}</div>
                    </div>
                    
                    <div class="d-flex mb-3">
                      <div class="info-label">Địa chỉ:</div>
                      <div class="info-value">${order.recipientAddress}</div>
                    </div>
                    
                    <div class="d-flex mb-3">
                      <div class="info-label">PT thanh toán:</div>
                      <div class="info-value">Thanh toán khi nhận hàng</div>
                    </div>
                    
                    <div class="d-flex">
                      <div class="info-label">Ghi chú:</div>
                      <div class="info-value">
                        ${empty order.notes ? '<span class="text-muted fst-italic">Không có</span>' : order.notes}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="order-details-container d-flex flex-wrap">
          <!-- Order Products -->
          <div class="order-products pe-3" style="width: 70%">
            <h5 class="mb-3">Sản phẩm đã đặt</h5>

            <div class="product-list">
              <c:forEach items="${orderItems}" var="item" varStatus="i">
                <div class="card mb-3 product-card">
                  <div class="card-body p-3">
                    <div class="row g-3 align-items-center">
                      <!-- Product Image -->
                      <div class="col-md-2 col-sm-3">
                        <div class="product-image-container">
                          <img src="${item.productDetail.getFirstImageUrl()}"
                            alt="${item.productDetail.product.name}" class="img-fluid rounded product-thumbnail">
                        </div>
                      </div>

                      <!-- Product Info -->
                      <div class="col-md-7 col-sm-6">
                        <h6 class="card-title mb-1">${item.productDetail.product.name}</h6>
                        <div class="product-specs">
                          <span class="badge bg-light text-dark me-2">Size: ${item.productDetail.size.name}</span>
                          <span class="badge bg-light text-dark me-2">
                            ${item.productDetail.color.name}
                          </span>
                        </div>
                        <div class="mt-2">
                          <span class="text-muted">Số lượng: ${item.quantity}</span>
                        </div>
                      </div>

                      <!-- Price Info -->
                      <div class="col-md-3 col-sm-3 text-end">
                        <div class="unit-price text-muted mb-1">
                          <small>Đơn giá:</small>
                          <div>
                            <fmt:formatNumber value="${item.price}" pattern="#,##0" /> VND
                          </div>
                        </div>
                        <div class="total-price fw-bold text-success">
                          <fmt:formatNumber value="${item.price * item.quantity}" pattern="#,##0" /> VND
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>

          <!-- Order Summary -->
          <div class="order-summary" style="width: 30%">
            <!-- Summary Card -->
            <div class="card summary-card mb-4">
              <div class="card-body">
                <h5 class="card-title mb-3">Tóm tắt đơn hàng</h5>

                <div class="d-flex justify-content-between mb-2">
                  <span>Tạm tính:</span>
                  <span>
                    <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0" /> VND
                  </span>
                </div>

                <div class="d-flex justify-content-between mb-2">
                  <span>Phí vận chuyển:</span>
                  <span>35.000 VND</span>
                </div>

                <hr>

                <div class="d-flex justify-content-between fw-bold">
                  <span>Tổng cộng:</span>
                  <span class="text-danger">
                    <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0" /> VND
                  </span>
                </div>

                <hr>

                <div class="d-flex justify-content-between small text-muted">
                  <span>Phương thức thanh toán:</span>
                  <span>Thanh toán khi nhận hàng</span>
                </div>
              </div>
            </div>

            <!-- Additional Info Card -->
            <div class="card">
              <div class="card-body">
                <h5 class="card-title mb-3">Thông tin bổ sung</h5>
                <p class="small mb-1">
                  <i class="fas fa-info-circle me-2"></i>
                  Mã đơn hàng: <strong>${order.code}</strong>
                </p>
                <p class="small mb-1">
                  <i class="fas fa-envelope me-2"></i>
                  Email: ${order.guestEmail}
                </p>
                <p class="small mb-1">
                  <i class="fas fa-clock me-2"></i>
                  Cập nhật lần cuối:
                  <fmt:formatDate value="${order.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss" />
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="../js/script.js"></script>
</body>

</html>