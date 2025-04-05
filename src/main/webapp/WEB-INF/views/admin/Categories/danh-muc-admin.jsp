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

    <style>
      .offcanvas-wider {
        width: 40vw !important;
        max-width: 700px;
      }
    </style>
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
              Quản lý danh mục
            </li>
          </ol>
        </nav>
      </nav>
      <!-- End Navbar -->

      <div>
        <h2 class="">Quản Lý Danh Mục</h2>

        <div class="p-2 bd-highlight d-flex justify-content-end">
          <button
            type="button"
            class="btn btn-outline-success"
            style="font-size: 14px"
            data-bs-toggle="modal"
            data-bs-target="#themSanPham"
          >
            <i class="fa-solid fa-circle-plus"></i> Thêm Mới
          </button>
        </div>

        <table
          class="table border rounded table-middle"
          style="font-size: 14px"
        >
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Tên Danh Mục</th>
              <th scope="col">Trạng Thái</th>
              <th scope="col" class="text-end">Hành Động</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${categories}" varStatus="i" var="dm">
              <tr class="mb-0">
                <td class="align-middle" scope="row">${i.index + 1}</td>
                <td class="align-middle">${dm.name}</td>
                <td class="align-middle">
                  <c:if test="${dm.status == true}">
                    <span class="badge bg-success">Hoạt Động</span>
                  </c:if>
                  <c:if test="${dm.status == false}">
                    <span class="badge bg-danger">Không Hoạt Động</span>
                  </c:if>
                </td>
                <td class="d-flex gap-2 align-middle justify-content-end">
                  <a
                    style="font-size: 14px; height: fit-content"
                    class="btn edit-btn mb-0"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#editOffcanvas"
                    data-id="${dm.id}"
                    data-name="${dm.name}"
                    data-status="${dm.status}"
                    title="Chỉnh Sửa"
                  >
                    <i class="fa-solid fa-pen-to-square"></i>
                  </a>
                  <a
                    style="font-size: 14px; height: fit-content"
                    onclick="return confirmDelete()"
                    class="btn delete-btn mb-0"
                    data-toggle="tooltip"
                    data-placement="top"
                    data-id="${dm.id}"
                    title="Xóa"
                  >
                    <i class="fa-solid fa-trash"></i>
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>

    <!-- Add Category Modal -->
    <form method="POST" action="/admin/categories/save">
      <div
        class="modal fade"
        id="themSanPham"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content" style="font-size: 14px">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                Thêm Mới Danh Mục
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="floatingInput"
                  placeholder="Tên Danh Mục"
                  name="name"
                  required
                />
                <label for="floatingInput"
                  >Tên Danh Mục <span class="text-danger">*</span></label
                >
              </div>
              <div class="mb-3 mt-3">
                <label for="exampleFormControlTextarea1" class="form-label"
                  >Mô tả</label
                >
                <textarea
                  class="form-control"
                  id="exampleFormControlTextarea1"
                  rows="3"
                  name="moTa"
                ></textarea>
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
                style="font-size: 14px"
              >
                Đóng
              </button>
              <button
                type="submit"
                class="btn btn-success"
                style="font-size: 14px"
              >
                Thêm Mới
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>

    <!-- Edit Category Offcanvas -->
    <div
      class="offcanvas offcanvas-end offcanvas-wider"
      tabindex="-1"
      id="editOffcanvas"
      aria-labelledby="editOffcanvasLabel"
    >
      <div class="offcanvas-header">
        <h3 class="offcanvas-title" id="editOffcanvasLabel">
          Chỉnh Sửa Danh Mục
        </h3>
        <button
          type="button"
          class="btn-close"
          data-bs-dismiss="offcanvas"
          aria-label="Close"
        ></button>
      </div>

      <div class="offcanvas-body" style="font-size: 14px">
        <!-- Form chính chỉnh sửa category -->
        <form id="editCategoryForm" method="post">
          <input type="hidden" id="editCategoryId" name="id" />

          <div class="form-floating mb-3">
            <input
              type="text"
              class="form-control"
              id="categoryName"
              placeholder="Tên Danh Mục"
              name="name"
              required
            />
            <label for="categoryName"
              >Tên Danh Mục <span class="text-danger">*</span></label
            >
          </div>

          <div class="mb-3 mt-3">
            <label for="cDescription" class="form-label">Mô tả</label>
            <textarea
              class="form-control"
              id="cDescription"
              rows="3"
              name="moTa"
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
        </form>

        <!-- Phần quản lý category detail -->
        <h5 class="mt-4">Danh mục chi tiết</h5>

        <!-- Form thêm mới category detail -->
        <form id="addDetailForm" class="mb-3">
          <div class="d-flex gap-2">
            <input type="hidden" id="categoryIdForDetail" name="categoryId" />
            <input
              type="text"
              class="form-control"
              id="detailName"
              name="name"
              placeholder="Tên danh mục chi tiết"
              required
            />
            <button
              type="submit"
              class="btn btn-outline-success"
              style="font-size: 14px; margin-bottom: 0"
            >
              <i class="fa-solid fa-circle-plus"></i>
            </button>
          </div>
        </form>

        <!-- Bảng hiển thị danh sách category detail -->
        <div class="table-responsive">
          <table class="table border rounded" style="font-size: 14px">
            <thead>
              <tr>
                <th>Tên</th>
                <th>Trạng thái</th>
                <th class="text-end">Hành động</th>
              </tr>
            </thead>
            <tbody id="categoryDetailsTable">
              <!-- Nội dung sẽ được load bằng AJAX -->
            </tbody>
          </table>
        </div>

        <!-- Nút submit cho form chính -->
        <div class="mt-4 d-flex justify-content-end gap-2">
          <button type="submit" form="editCategoryForm" class="btn btn-primary">
            Cập Nhật
          </button>
          <button
            type="button"
            class="btn btn-secondary"
            data-bs-dismiss="offcanvas"
          >
            Đóng
          </button>
        </div>
      </div>
    </div>

    <script src="../js/categoryAction.js"></script>
  </body>
</html>
