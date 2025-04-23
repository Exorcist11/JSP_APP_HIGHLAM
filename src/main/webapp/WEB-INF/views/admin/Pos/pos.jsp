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
    .custom-table {
      width: 100%;
      border-collapse: collapse;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    }

    .custom-table thead {
      background-color: #f8f9fa;
      color: #333;
      font-weight: bold;
    }

    .custom-table th,
    .custom-table td {
      padding: 12px 16px;
      text-align: left;
      border-bottom: 1px solid #dee2e6;
    }

    .custom-table tbody tr:hover {
      background-color: #f1f1f1;
    }
    .square-button {
      width: 40px;
      height: 40px;
      padding: 0;
      border-radius: 0;
    }

    .w-70 {
      width: 70%;
    }
    .pagination .page-link {
        color: #007bff;
    }

    .pagination .page-item.active .page-link {
        background-color: #007bff;
        border-color: #007bff;
    }

    .pagination .page-item.disabled .page-link {
        cursor: not-allowed;
        opacity: 0.6;
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
                <input type="text" name="code" class="form-control" value="${code}"
                  placeholder="Tìm kiếm sản phẩm theo mã sản phẩm" />
                <button class="btn btn-primary mb-0" type="submit">
                  <i class="fas fa-search"></i> Tìm kiếm
                </button>
              </div>
            </form>

            <div class="row row-cols-2 row-cols-md-3 row-cols-lg-3 g-3">
              <!-- Product Card 1 -->
              <c:forEach var="p" items="${products}">
               
                  <c:if test="${p.totalQuantity > 0}">
                    <div class="col">
                      <div class="card product-card h-100">
                        <div class="product-img">
                          <img src="${p.imgUrl}" alt="Ảnh sản phẩm" width="100%" height="auto"
                            style="min-height: 250px; object-position: center; object-fit: cover;" />
                        </div>
                        <div class="card-body">
                          <h5 class="card-title product-name">
                            ${p.name}
                          </h5>
                          <div class="d-flex justify-content-between align-items-center">
                            <span class="text-danger fw-bold">
                              <fmt:formatNumber value="${p.price}" groupingUsed="true"
                                maxFractionDigits="0" />
                              VND
                            </span>
                            <span class="badge bg-success">Còn: ${p.totalQuantity}</span>
                          </div>
                          <div class="small text-muted mt-1">Mã: ${p.code}</div>
                        </div>
                        <div class="card-footer bg-transparent">
                          <form method="post" action="/admin/pos">
                         
                            <button class="btn btn-sm btn-primary w-100" 
                              type="button" 
                              data-bs-toggle="modal" 
                              data-bs-target="#addToCartModal" 
                              data-code="${p.code}"
                              data-name="${p.name}"
                              data-price="${p.price}"
                              data-img="${p.imgUrl}">
                              <i class="fas fa-cart-plus"></i> Thêm vào giỏ
                            </button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </c:if>
               
              </c:forEach>
            </div>
            <div class="d-flex justify-content-between align-items-center mt-4">
              <nav aria-label="Page navigation">
                <ul class="pagination mb-0">
                  <!-- Previous Button -->
                  <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                    <a class="page-link" href="?code=${code}&page=${currentPage - 1}&size=${pageSize}" aria-label="Previous">
                      <span aria-hidden="true">«</span>
                    </a>
                  </li>
                  <!-- Page Numbers -->
                  <c:forEach begin="0" end="${totalPages - 1}" var="i">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                      <a class="page-link" href="?code=${code}&page=${i}&size=${pageSize}">${i + 1}</a>
                    </li>
                  </c:forEach>
                  <!-- Next Button -->
                  <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                    <a class="page-link" href="?code=${code}&page=${currentPage + 1}&size=${pageSize}" aria-label="Next">
                      <span aria-hidden="true">»</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>

      <!-- Cart Panel -->
      <div class="col-lg-4">
        <div class="cart-panel p-3 sticky-top" style="top: 20px">
          <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" style="color: white;" role="alert">
              ${error}
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          </c:if>
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
                  <c:choose>
                    <c:when test="${not empty error}">
                      <button type="submit" value="${item.quantity + 1}" name="quantity" disabled
                        class="btn btn-outline-secondary btn-sm mb-0 square-button">
                        <i class="fas fa-plus"></i>
                      </button>
                    </c:when>
                    <c:otherwise>
                      <form method="POST" action="/admin/pos" class="d-inline">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="code" value="${item.productDetailCode}">
                        <button type="submit" value="${item.quantity + 1}" name="quantity"
                          class="btn btn-outline-secondary btn-sm mb-0 square-button">
                          <i class="fas fa-plus"></i>
                        </button>
                      </form>
                    </c:otherwise>
                  </c:choose>
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
  <div class="modal fade" id="checkoutModal" tabindex="-1" aria-labelledby="checkoutModalLabel" aria-hidden="true">
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
              <input type="text" class="form-control" id="recipientName" name="recipientName" >
            </div>
            <div class="mb-3">
              <label for="recipientPhone" class="form-label">Số điện thoại</label>
              <input type="text" class="form-control" id="recipientPhone" name="recipientPhone" >
            </div>
            <div class="mb-3">
              <label for="recipientAddress" class="form-label">Địa chỉ</label>
              <input type="text" class="form-control" id="recipientAddress" name="recipientAddress" >
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

  <!-- Add to Cart Modal -->
  <div class="modal fade" id="addToCartModal" tabindex="-1" aria-labelledby="addToCartModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addToCartModalLabel">Chi tiết sản phẩm</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-4">
              <img id="modal-product-img" src="" alt="Product Image" class="img-fluid" style="max-height: 200px; object-fit: cover;">
            </div>
            <div class="col-md-8">
              <h4 id="modal-product-name"></h4>
              <p><strong>Mã sản phẩm:</strong> <span id="modal-product-code"></span></p>
              <p><strong>Tên sản phẩm:</strong> <span id="modal-product-fullname"></span></p>
              <p><strong>Giá:</strong> <span id="modal-product-price"></span> VND</p>
            </div>
          </div>
          <hr>
          <h5>Danh sách sản phẩm chi tiết</h5>
          <table class="table custom-table">
            <thead>
              <tr>
                <th>Mã SP</th>
                <th>Màu sắc</th>
                <th>Kích thước</th>
                <th>Tồn kho</th>
                <th></th>
              </tr>
            </thead>
            <tbody id="similar-products">
             
            </tbody>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
          
        </div>
      </div>
    </div>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const addToCartButtons = document.querySelectorAll('button[data-bs-target="#addToCartModal"]');

      addToCartButtons.forEach(button => {
        button.addEventListener('click', () => {
          // Lấy dữ liệu từ thuộc tính data-*
          const code = button.getAttribute('data-code');
          const name = button.getAttribute('data-name');
          const price = button.getAttribute('data-price');
          const img = button.getAttribute('data-img');

          // Cập nhật dữ liệu vào modal
          document.getElementById('modal-product-img').src = img;
          document.getElementById('modal-product-name').textContent = name;
          document.getElementById('modal-product-code').textContent = code;
          document.getElementById('modal-product-fullname').textContent = name;
          document.getElementById('modal-product-price').textContent = Number(price).toLocaleString('vi-VN');

          // Gọi API để lấy danh sách sản phẩm tương tự
          fetch(`http://localhost:8080/api/product-details/by-product-code/` + code)
            .then(response => {
              if (!response.ok) {
                throw new Error('Lỗi khi gọi API');
              }
              return response.json();
            })
            .then(data => {
              const similarProductsTable = document.getElementById('similar-products');
              similarProductsTable.innerHTML = '';
             

              data.forEach(product => {
                const isDisabled = product.quantity < 1 ? 'disabled' : '';
                similarProductsTable.innerHTML += 
                  '<tr>' +
                    '<td>' + product.code + '</td>' +
                    '<td>' + product.colorName + '</td>' +
                    '<td>' + product.sizeName + '</td>' +
                    '<td>' + product.quantity + '</td>' +
                    '<td class="d-flex justify-content-center">' +
                      '<form method="post" action="/admin/pos" class="d-inline">' +
                        '<input type="hidden" name="action" value="add">' +
                        '<input type="hidden" name="code" value="' + product.code + '">' +
                        '<button type="submit" class="btn btn-primary m-0" ' + isDisabled + '>' +
                          '<i class="fas fa-cart-plus" title="Thêm vào giỏ hàng"></i>' +
                        '</button>' +
                      '</form>' +
                    '</td>' +
                  '</tr>';
              });

            })
            .catch(error => {
              console.error('Lỗi:', error);
            });
        });
        
      });
    });
  </script>

</body>

</html>