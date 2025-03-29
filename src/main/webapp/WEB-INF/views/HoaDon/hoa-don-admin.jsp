<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>

  <body class="g-sidenav-show bg-gray-100 text-sm">
    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
    <main class="main-content max-height-vh-100 h-100 border-radius-lg pe-3">
      <!-- Navbar -->
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
              Quản lý đơn hàng
            </li>
          </ol>
        </nav>
      </nav>
      <!-- End Navbar -->

      <h2 class="mb-3">Quản Lý Đơn Hàng</h2>

      <div>
        <div class="w-100">
          <form action="/admin/order" method="GET" class="row g-1">
            <!-- Ô tìm kiếm -->
            <div class="col-5">
              <input
                name="code"
                class="form-control"
                type="search"
                placeholder="Tìm theo mã hoá đơn"
                aria-label="Search"
                style="font-size: 14px"
                value="${code}"
              />
            </div>

            <!-- Dropdown trạng thái -->
            <div class="col-2">
              <select
                class="form-select"
                name="status"
                id="trangThai"
                style="font-size: 14px"
              >
                <option value="">Trạng Thái</option>
                <option value="PENDING">Chờ Xác Nhận</option>
                <option value="CONFIRMED">Xác Nhận</option>
                <option value="CANCELLED">Đã Huỷ</option>
              </select>
            </div>

            <div class="col-5 d-flex justify-content-between">
              <button
                style="font-size: 14px"
                class="btn btn-success flex-fill mx-1"
                type="submit"
              >
                <i class="bi bi-search me-1"></i> Tìm Kiếm
              </button>

              <a
                href="/admin/order"
                style="font-size: 14px"
                class="btn btn-secondary flex-fill mx-1"
              >
                <i class="bi bi-arrow-clockwise"></i> Reset
              </a>
            </div>
          </form>
        </div>
      </div>

      <table class="table border rounded" style="font-size: 14px">
        <thead>
          <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã Hoá Đơn</th>
            <th scope="col">Email</th>
            <th scope="col">Tên Khách Hàng</th>
            <th scope="col">Số Điện Thoại</th>
            <th scope="col">Địa Chỉ</th>
            <th scope="col">Tổng Tiền</th>
            <th scope="col">Trạng Thái</th>
            <th scope="col" class="text-end">Hành Động</th>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${empty listOrders}">
              <tr>
                <td colspan="7" class="text-center">Không tìm thấy kết quả nào!</td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach items="${listOrders}" var="hd" varStatus="i">
                <tr>
                  <td>${i.index +1}</td>
                  <td>${hd.code}</td>
                  <td>${hd.guestEmail}</td>
                  <td>${hd.recipientName}</td>
                  <td>${hd.recipientPhone}</td>
                  <td>${hd.recipientAddress}</td>
                  <td>
                    <fmt:formatNumber
                      value="${hd.totalAmount}"
                      groupingUsed="true"
                      maxFractionDigits="0"
                    />
                    VND
                  </td>
                  <td>${hd.status}</td>
                  <td class="text-end">
                    <div class="d-flex justify-content-end gap-2 align-items-center" style="min-width: 120px">
                      <!-- Nút Xem Chi Tiết -->
                      <a class="btn btn-sm btn-outline-primary"
                         data-toggle="tooltip"
                         data-placement="top"
                         title="Xem Chi Tiết"
                         href="/admin/order/${hd.id}">
                        <i class="fa-solid fa-eye"></i>
                      </a>
                  
                      <!-- Dropdown Actions -->
                      <div class="dropdown">
                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle"
                                type="button"
                                id="dropdownMenuButton_${hd.id}"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                title="Cập Nhật">
                          <i class="fa-solid fa-ellipsis-vertical"></i>
                        </button>
                        
                        <ul class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="dropdownMenuButton_${hd.id}"
                            style="min-width: 200px; max-width: 90vw">
                          <li>
                            <a class="dropdown-item" href="/admin/order/edit/${hd.id}">
                              <i class="fas fa-edit me-2"></i>Chỉnh sửa đơn hàng
                            </a>
                          </li>
                          <li>
                            <a class="dropdown-item" href="/admin/order/print/${hd.id}">
                              <i class="fas fa-print me-2"></i>In hóa đơn
                            </a>
                          </li>
                          <li><hr class="dropdown-divider"></li>
                          <li>
                            <a class="dropdown-item text-success" href="#"
                               onclick="updateOrderStatus('${hd.id}', 'CONFIRMED')">
                              <i class="fas fa-check-circle me-2"></i>Xác nhận đơn hàng
                            </a>
                          </li>
                          <li>
                            <a class="dropdown-item text-danger" href="#"
                               onclick="return confirm('Bạn chắc chắn muốn hủy?') && updateOrderStatus('${hd.id}', 'CANCELLED')">
                              <i class="fas fa-times-circle me-2"></i>Hủy đơn hàng
                            </a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </main>

    <script>
      async function updateOrderStatus(orderId, status) {
        console.log("orderId", orderId);
        if (!orderId) {
          alert("Không tìm thấy mã đơn hàng!");
          return;
        }
        const url = `/admin/order/changeStatus/` + orderId;
        fetch(url, {
          method: "PATCH",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: new URLSearchParams({ order: status }),
        })
          .then((response) => {
            if (response.ok) {
              alert("Cập nhật trạng thái thành công!");
              location.reload();
            } else {
              response
                .text()
                .then((text) => console.log("Cập nhật thất bại: " + text));
            }
          })
          .catch((error) => console.error("Lỗi kết nối:", error));
      }
    </script>
  </body>
</html>
