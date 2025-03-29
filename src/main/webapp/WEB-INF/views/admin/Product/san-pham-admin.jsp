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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
    />
    <link rel="stylesheet" href="../css/button.css" />
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
              Quản lý sản phẩm
            </li>
          </ol>
        </nav>
      </nav>
      <!-- End Navbar -->

      <h2 class="">Quản Lý Sản Phẩm</h2>

      <div class="w-100">
        <form action="/admin/products" method="GET" class="row g-1">
          <!-- Ô tìm kiếm -->
          <div class="col-5">
            <input
              name="timKiemSanPham"
              class="form-control"
              type="search"
              placeholder="Tìm sản phẩm"
              aria-label="Search"
              style="font-size: 14px"
              value="${timKiemSanPham}"
            />
          </div>

          <!-- Dropdown trạng thái -->
          <div class="col-2">
            <select
              class="form-select"
              name="trangThai"
              id="trangThai"
              style="font-size: 14px"
            >
              <option value="">Trạng Thái</option>
              <option value="1" th:selected="${sanPham.trangThai == 1}">
                Còn Hàng
              </option>
              <option value="0" th:selected="${sanPham.trangThai == 0}">
                Hết Hàng
              </option>
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
              href="/admin/products"
              style="font-size: 14px"
              class="btn btn-secondary flex-fill mx-1"
            >
              <i class="bi bi-arrow-clockwise"></i> Reset
            </a>

            <button
              type="button"
              class="btn btn-outline-primary flex-fill mx-1"
              style="font-size: 14px"
              data-bs-toggle="modal"
              data-bs-target="#themSanPham"
            >
              <i class="fa-solid fa-circle-plus"></i> Thêm Mới
            </button>
          </div>
        </form>
      </div>

      <table class="table border rounded mt-2">
        <thead>
          <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã Sản Phẩm</th>
            <th scope="col">Tên Sản Phẩm</th>
            <th scope="col">Giá</th>

            <!-- <th scope="col">Danh Mục</th> -->
            <th scope="col">Trạng Thái</th>
            <th scope="col" class="text-end">Hành Động</th>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${empty products}">
              <tr>
                <td colspan="7" class="text-center">
                  Không tìm thấy kết quả nào!
                </td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach items="${products}" var="sp" varStatus="i">
                <tr>
                  <td class="align-middle">${i.index+1}</td>
                  <td class="align-middle">${sp.code}</td>
                  <td class="align-middle">${sp.name}</td>
                  <td class="align-middle">
                    <fmt:formatNumber
                      value="${sp.price}"
                      groupingUsed="true"
                      maxFractionDigits="0"
                    />
                    VND
                  </td>

                  <td class="align-middle">
                    <c:if test="${sp.status == true}">
                      <span class="badge bg-success">Còn Hàng</span>
                    </c:if>
                    <c:if test="${sp.status == false}">
                      <span class="badge bg-danger">Hết Hàng</span>
                    </c:if>
                  </td>
                  <td class="align-middle d-flex justify-content-end gap-2">
                    <a
                      class="btn edit-btn mb-0"
                      data-bs-toggle="modal"
                      data-bs-target="#editModal"
                      data-id="${sp.id}"
                      data-code="${sp.code}"
                      data-name="${sp.name}"
                      data-price="${sp.price}"
                      data-status="${sp.status}"
                      data-description="${sp.description}"
                      data-category="${sp.category.id}"
                      title="Chỉnh Sửa"
                      ><i class="fa-solid fa-pen-to-square"></i
                    ></a>
                    <a
                      class="btn delete-btn mb-0"
                      data-toggle="tooltip"
                      data-placement="top"
                      title="Xóa"
                      data-id="${sp.id}"
                      onclick="return confirmDelete()"
                      ><i class="fa-solid fa-trash"></i
                    ></a>
                    <a
                      href="/admin/products/${sp.id}"
                      class="btn btn-secondary mb-0"
                      data-toggl
                      e="tooltip"
                      data-placement="top"
                      title="Xem Chi Tiết"
                    >
                      <i class="fa-solid fa-eye"></i>
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </main>

    <!-- Modal -->
    <form action="/admin/products/save" method="POST">
      <div
        class="modal fade"
        id="themSanPham"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                Thêm Mới Sản Phẩm
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <!-- Tên Sản Phẩm -->
              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  name="name"
                  required
                />
                <label for="floatingInputTenSanPham"
                  >Tên Sản Phẩm <span class="text-danger">*</span></label
                >
              </div>

              <!-- Giá -->
              <div class="mb-3">
                <label for="price" class="form-label">Giá</label>
                <input
                  type="number"
                  class="form-control"
                  id="price"
                  name="price"
                  required
                  min="0"
                />
              </div>

              <!-- Danh mục sản phẩm -->
              <div class="mb-3">
                <label for="categoryId" class="form-label">Danh mục</label>
                <select
                  class="form-select"
                  id="categoryId"
                  name="categoryId"
                  required
                >
                  <option value="">Chọn danh mục</option>
                  <c:forEach var="category" items="${categories}">
                    <option value="${category.id}">${category.name}</option>
                  </c:forEach>
                </select>
              </div>

              <!-- Mô Tả Sản Phẩm -->
              <div class="mb-3">
                <label for="description" class="form-label">Mô tả</label>
                <textarea
                  class="form-control"
                  id="description"
                  name="description"
                ></textarea>
              </div>

              <p style="color: red">${errorMessageSanPham}</p>
            </div>

            <!-- Footer Modal -->
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

    <!-- Modal Edit -->
    <form id="editCategoryForm" method="post">
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
              <h5 class="modal-title" id="editModalLabel">
                Chỉnh Sửa Sản phẩm
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <!-- Mã Sản Phẩm -->
              <div class="mb-3">
                <label for="code" class="form-label">Mã sản phẩm</label>
                <input
                  type="text"
                  class="form-control"
                  id="code"
                  name="code"
                  required
                />
              </div>

              <!-- Tên Sản Phẩm -->
              <div class="mb-3">
                <label for="nameP" class="form-label">Tên sản phẩm</label>
                <input
                  type="text"
                  class="form-control"
                  id="nameP"
                  name="name"
                  required
                />
              </div>

              <!-- Giá -->
              <div class="mb-3">
                <label for="price" class="form-label">Giá</label>
                <input
                  type="number"
                  class="form-control"
                  id="priceP"
                  name="price"
                  required
                  min="0"
                />
              </div>

              <!-- Danh mục sản phẩm -->
              <div class="mb-3">
                <label for="categoryId" class="form-label">Danh mục</label>
                <select
                  class="form-select"
                  id="categoryIdP"
                  name="categoryId"
                  required
                >
                  <option value="">Chọn danh mục</option>
                  <c:forEach var="category" items="${categories}">
                    <option value="${category.id}">${category.name}</option>
                  </c:forEach>
                </select>
              </div>

              <!-- Mô Tả Sản Phẩm -->
              <div class="mb-3">
                <label for="description" class="form-label">Mô tả</label>
                <textarea
                  class="form-control"
                  id="descriptionP"
                  name="description"
                ></textarea>
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

              <p style="color: red">${errorMessageSanPham}</p>
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

    <script src="../js/actionProduct.js"></script>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var myModal = new bootstrap.Modal(
          document.getElementById("${openModal}")
        );
        myModal.show();
      });
    </script>
  </body>
  <script
    src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"
  ></script>
</html>
