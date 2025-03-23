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

  <body class="container">
    <div>
      <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />

      <div class="row mt-3">
        <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
        <div class="col-9">
          <div class="row">
            <h2 class="mb-3">Quản Lý Đơn Hàng</h2>

            <div class="p-3 bg-light rounded border mt-3 mb-3">
              <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="w-100">
                  <form
                    action="/admin/order/search"
                    method="GET"
                    class="row g-1"
                  >
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
              </nav>
            </div>

            <table class="table table-striped" style="font-size: 14px">
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
                  <th scope="col">Hành Động</th>
                </tr>
              </thead>
              <tbody>
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
                    <td>
                      <!-- Nút Xem Chi Tiết -->
                      <a
                        class="rounded-pill"
                        data-toggle="tooltip"
                        data-placement="top"
                        title="Xem Chi Tiết"
                        href="/admin/order/${hd.id}"
                      >
                        <i class="fa-solid fa-eye"></i>
                      </a>

                      <!-- Dropdown với chỉ icon -->
                      <div class="dropdown d-inline-block">
                        <!-- Icon wrench (🔧) -->
                        <a
                          href="#"
                          class="dropdown-toggle"
                          id="dropdownMenuButton"
                          data-bs-toggle="dropdown"
                          aria-expanded="false"
                          title="Cập Nhật"
                        >
                          <i class="fa-solid fa-wrench"></i>
                        </a>

                        <!-- Dropdown menu -->
                        <div
                          class="dropdown-menu"
                          aria-labelledby="dropdownMenuButton"
                        >
                          <!-- Chỉnh sửa đơn hàng -->
                          <a
                            class="dropdown-item"
                            th:href="@{'/admin/order/edit/' + ${hd.id}}"
                          >
                            ✏️ Chỉnh sửa đơn hàng
                          </a>

                          <!-- In hóa đơn -->
                          <a
                            class="dropdown-item"
                            th:href="@{'/admin/order/print/' + ${hd.id}}"
                          >
                            🖨️ In hóa đơn
                          </a>

                          <!-- Cập nhật trạng thái: Xác nhận đơn hàng -->
                          <a
                            href="#"
                            class="dropdown-item"
                            onclick="updateOrderStatus('${hd.id}', 'CONFIRMED')"
                          >
                            ✅ Xác nhận đơn hàng
                          </a>

                          <!-- Cập nhật trạng thái: Hủy đơn hàng -->
                          <a
                            href="#"
                            class="dropdown-item text-danger"
                            onclick="if(confirm('Bạn có chắc chắn muốn hủy đơn hàng này?')) updateOrderStatus('${hd.id}', 'CANCELLED')"
                          >
                            🚫 Hủy đơn hàng
                          </a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
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
