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
    <link rel="stylesheet" href="../css/button.css" />

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
              Quản lý kích cỡ
            </li>
          </ol>
        </nav>
      </nav>
      <div>
        <div class="row">
          <h2 class="">Quản Lý Size</h2>

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

          <table class="table border rounded" style="font-size: 14px">
            <thead>
              <tr>
                <th scope="col" class="col-1">#</th>
                <th scope="col" class="col-3">Tên Size</th>
                <th scope="col" class="col-4">Mô tả</th>
                <th scope="col" class="col-2">Trạng Thái</th>
                <th scope="col" class="col-2 text-end">Hành Động</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${sizes}" var="s" varStatus="i">
                <tr>
                  <th class="align-middle" scope="row">${i.index + 1}</th>
                  <td class="align-middle">${s.name}</td>
                  <td class="align-middle">${s.description}</td>
                  <td class="align-middle">
                    <c:if test="${s.status == true}">
                      <span class="badge bg-success">Hoạt Động</span>
                    </c:if>
                    <c:if test="${s.status == false}">
                      <span class="badge bg-danger">Không Hoạt Động</span>
                    </c:if>
                  </td>
                  <td class="align-middle d-flex justify-content-end gap-2">
                    <a
                      class="btn edit-btn mb-0"
                      data-bs-toggle="modal"
                      data-bs-target="#editSizeModal"
                      data-id="${s.id}"
                      data-name="${s.name}"
                      data-description="${s.description}"
                      data-status="${s.status}"
                      title="Chỉnh Sửa"
                    >
                      <i class="fa-solid fa-pen-to-square"></i>
                    </a>
                    <a
                      href="javascript:void(0);"
                      class="btn delete-btn mb-0"
                      data-id="${s.id}"
                    >
                      <i class="fa-solid fa-trash"></i>
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </main>

    <!-- Modal -->
    <form action="/admin/sizes/save" method="post">
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
              <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Size</h5>
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
                  placeholder="Tên Size"
                  name="name"
                />
                <label for="floatingInput">Tên Size</label>
              </div>

              <div class="mb-3 mt-3">
                <label for="exampleFormControlTextarea1" class="form-label"
                  >Mô tả</label
                >
                <textarea
                  class="form-control"
                  id="exampleFormControlTextarea1"
                  rows="3"
                  name="description"
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

    <form id="editSizeForm" method="post">
      <div
        class="modal fade"
        id="editSizeModal"
        tabindex="-1"
        aria-labelledby="editModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content" style="font-size: 14px">
            <div class="modal-header">
              <h5 class="modal-title" id="editModalLabel">Chỉnh Sửa Size</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <!-- ID Ẩn -->
              <input type="hidden" id="editSizeId" name="id" />

              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="editSizeName"
                  name="name"
                  placeholder="Tên Size"
                />
                <label for="editSizeName">Tên Size</label>
              </div>

              <div class="mb-3">
                <label for="editSizeDescription" class="form-label"
                  >Mô tả</label
                >
                <textarea
                  class="form-control"
                  id="editSizeDescription"
                  name="description"
                  rows="3"
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

  <script src="../js/actionSize.js"></script>
</html>
