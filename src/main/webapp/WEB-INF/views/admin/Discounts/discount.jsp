<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

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

  <body class="container" style="font-size: 14px">
    <div>
      <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />

      <div class="row mt-3">
        <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
        <div class="col-9">
          <div class="row">
            <h2 class="">Quản Lý Mã Giảm Giá</h2>

            <div class="p-2 bd-highlight d-flex justify-content-end">
              <button
                type="button"
                class="btn btn-outline-success"
                data-bs-toggle="modal"
                style="font-size: 14px"
                data-bs-target="#themMaGiamGia"
              >
                <i class="fa-solid fa-circle-plus"></i> Thêm Mới
              </button>
            </div>

            <table class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Mã Giảm Giá</th>
                  <th scope="col">Phần Trăm Giảm (%)</th>
                  <th scope="col">Ngày Bắt Đầu</th>
                  <th scope="col">Ngày Kết Thúc</th>
                  <th scope="col">Trạng Thái</th>
                  <th scope="col">Hành Động</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${discounts}" var="d" varStatus="i">
                  <tr>
                    <th scope="row">${i.index + 1}</th>
                    <td>${d.code}</td>
                    <td>${d.percentage}</td>
                    <td>
                      <fmt:formatDate
                        value="${d.startDate}"
                        pattern="dd/MM/yyyy  HH:mm:ss"
                      />
                    </td>
                    <td>
                      <fmt:formatDate
                        value="${d.endDate}"
                        pattern="dd/MM/yyyy  HH:mm:ss"
                      />
                    </td>

                    <td>
                      <c:if test="${d.status == true}">
                        <span class="badge bg-success">Hoạt Động</span>
                      </c:if>
                      <c:if test="${d.status == false}">
                        <span class="badge bg-danger">Không Hoạt Động</span>
                      </c:if>
                    </td>
                    <td>
                      <a
                        class="btn edit-btn"
                        data-bs-toggle="modal"
                        data-bs-target="#editModal"
                        data-id="${ms.id}"
                        data-name="${ms.name}"
                        data-status="${ms.status}"
                        data-hex="${ms.hexColor}"
                        title="Chỉnh Sửa"
                        ><i class="fa-solid fa-pen-to-square"></i
                      ></a>
                      <a
                        onclick="return confirmDelete()"
                        class="btn delete-btn"
                        data-toggle="tooltip"
                        data-placement="top"
                        data-id="${d.id}"
                        title="Xóa"
                        ><i class="fa-solid fa-trash"></i
                      ></a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal Thêm Mới Mã Giảm Giá -->
    <form action="/admin/discount/save" method="post">
      <div
        class="modal fade"
        id="themMaGiamGia"
        tabindex="-1"
        aria-labelledby="themMaGiamGiaLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content" style="font-size: 14px">
            <!-- Tiêu đề -->
            <div class="modal-header">
              <h5 class="modal-title" id="themMaGiamGiaLabel">
                Thêm Mới Mã Giảm Giá
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>

            <!-- Nội dung Form -->
            <div class="modal-body">
              <!-- Mã Giảm Giá -->
              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="code"
                  name="code"
                  placeholder="Nhập mã giảm giá"
                  required
                />
                <label for="code">Mã Giảm Giá</label>
              </div>

              <!-- Phần Trăm Giảm -->
              <div class="form-floating mb-3">
                <input
                  type="number"
                  class="form-control"
                  id="percentage"
                  name="percentage"
                  placeholder="Nhập phần trăm giảm"
                  min="0"
                  max="100"
                  step="0.01"
                  required
                />
                <label for="percentage">Phần Trăm Giảm (%)</label>
              </div>

              <!-- Ngày Bắt Đầu -->
              <div class="form-floating mb-3">
                <input
                  type="datetime-local"
                  class="form-control"
                  id="startDate"
                  name="startDate"
                  required
                />
                <label for="startDate">Ngày Bắt Đầu</label>
              </div>

              <!-- Ngày Kết Thúc -->
              <div class="form-floating mb-3">
                <input
                  type="datetime-local"
                  class="form-control"
                  id="endDate"
                  name="endDate"
                  required
                />
                <label for="endDate">Ngày Kết Thúc</label>
              </div>

              <!-- Trạng Thái -->
              <div class="form-check form-switch mb-3">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="status"
                  name="status"
                  checked
                />
                <label class="form-check-label" for="status">Kích Hoạt</label>
              </div>
            </div>

            <!-- Footer -->
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Đóng
              </button>
              <button type="submit" class="btn btn-success">Thêm Mới</button>
            </div>
          </div>
        </div>
      </div>
    </form>
    <!-- Kết thúc Modal -->

    <form id="editColorForm" method="post">
      <div
        class="modal fade"
        id="editModal"
        tabindex="-1"
        aria-labelledby="editModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content" style="font-size: 14px">
            <div class="modal-header">
              <h5 class="modal-title" id="editModalLabel">Chỉnh Sửa Màu Sắc</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <!-- ID Ẩn -->
              <input type="hidden" id="editColorId" name="id" />

              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="colorHex"
                  placeholder="Màu Sắc"
                  name="hexColor"
                  required
                />
                <label for="colorHex">Màu Sắc</label>
              </div>

              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="colorName"
                  placeholder="Tên Màu Sắc"
                  name="name"
                  required
                />
                <label for="colorName">Tên Màu Sắc</label>
              </div>

              <div class="form-check form-switch">
                <input
                  class="form-check-input"
                  type="checkbox"
                  role="switch"
                  id="flexSwitchCheckChecked"
                  name="status"
                  checked
                  value="true"
                />

                <span id="statusText" class="ms-2 fw-bold text-success"
                  >Hoạt Động</span
                >
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Đóng
              </button>
              <button type="submit" class="btn btn-primary">Cập Nhật</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </body>

  <script src="../js/actionDiscount.js"></script>
</html>
