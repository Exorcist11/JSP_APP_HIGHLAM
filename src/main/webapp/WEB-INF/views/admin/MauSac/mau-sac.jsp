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
              Quản lý màu sắc
            </li>
          </ol>
        </nav>
      </nav>

      <h2 class="">Quản Lý Màu Sắc</h2>

      <div class="p-2 bd-highlight d-flex justify-content-end">
        <button
          type="button"
          class="btn btn-outline-success"
          data-bs-toggle="modal"
          style="font-size: 14px"
          data-bs-target="#themSanPham"
        >
          <i class="fa-solid fa-circle-plus"></i> Thêm Mới
        </button>
      </div>

      <table class="table border rounded">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Mã Màu Sắc</th>
            <th scope="col">Tên Màu Sắc</th>

            <th scope="col">Trạng Thái</th>
            <th scope="col" class="text-end">Hành Động</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${colors}" var="ms" varStatus="i">
            <tr>
              <th class="align-middle" scope="row">${i.index + 1}</th>
              <td class="align-middle">${ms.hexColor}</td>
              <td class="align-middle">${ms.name}</td>

              <td class="align-middle">
                <c:if test="${ms.status == true}">
                  <span class="badge bg-success">Hoạt Động</span>
                </c:if>
                <c:if test="${ms.status == false}">
                  <span class="badge bg-danger">Không Hoạt Động</span>
                </c:if>
              </td>
              <td class="align-middle d-flex justify-content-end gap-2">
                <a
                  class="btn edit-btn mb-0"
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
                  class="btn delete-btn mb-0"
                  data-toggle="tooltip"
                  data-placement="top"
                  data-id="${ms.id}"
                  title="Xóa"
                  ><i class="fa-solid fa-trash"></i
                ></a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </main>

    <!-- Modal -->
    <form action="/admin/colors/save" method="post">
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
                Thêm Mới Màu Sắc
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
                  placeholder="Màu Sắc"
                  name="hexColor"
                  required
                />
                <label for="floatingInput">Màu Sắc</label>
              </div>

              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="floatingInput"
                  placeholder="Tên Màu Sắc"
                  name="name"
                  required
                />
                <label for="floatingInput">Tên Màu Sắc</label>
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

  <script src="../js/actionColor.js"></script>
</html>
