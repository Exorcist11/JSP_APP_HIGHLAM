<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link
      rel="apple-touch-icon"
      sizes="76x76"
      href="../assets/img/apple-icon.png"
    />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <title>Quản lý người dùng | T-Luxury</title>
    <!-- Fonts and icons -->
    <link
      href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,800"
      rel="stylesheet"
    />
    <!-- Nucleo Icons -->
    <link
      href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-icons.css"
      rel="stylesheet"
    />
    <link
      href="https://demos.creative-tim.com/soft-ui-dashboard/assets/css/nucleo-svg.css"
      rel="stylesheet"
    />
    <!-- Font Awesome Icons -->
    <script
      src="https://kit.fontawesome.com/42d5adcbca.js"
      crossorigin="anonymous"
    ></script>
    <!-- CSS Files -->
    <link rel="stylesheet" href="../css/soft-ui-dashboard.css" />
    <!-- Nepcha Analytics (nepcha.com) -->
    <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
    <script
      defer
      data-site="YOUR_DOMAIN_HERE"
      src="https://api.nepcha.com/js/nepcha-analytics.js"
    ></script>
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

  <body class="g-sidenav-show bg-gray-100">
    <!-- <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" /> -->

    <div class="mt-3">
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
                Quản lý người dùng
              </li>
            </ol>
          </nav>
        </nav>
        <!-- End Navbar -->

        <div>
          <h2>Quản Lý Người Dùng</h2>
          <div>
            <nav>
              <div class="">
                <form
                  action="/t-shirt-luxury/admin/timNguoiDung"
                  method="GET"
                  class="row g-1 w-100"
                >
                  <!-- Ô tìm kiếm -->
                  <div class="col-5">
                    <input
                      name="timKiemNguoiDung"
                      class="form-control"
                      type="search"
                      placeholder="Tìm tên người dùng"
                      aria-label="Search"
                      style="font-size: 14px"
                      value="${timKiemNguoiDung}"
                    />
                  </div>

                  <!-- Dropdown trạng thái -->
                  <div class="col-5 d-flex justify-content-between">
                    <button
                      style="font-size: 14px"
                      class="btn btn-success flex-fill mx-1"
                      type="submit"
                    >
                      <i class="bi bi-search me-1"></i> Tìm Kiếm
                    </button>

                    <a
                      href="/t-shirt-luxury/admin/timNguoiDung"
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
                      data-bs-target="#themNguoiDung"
                    >
                      <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                    </button>
                  </div>
                </form>
              </div>
            </nav>
          </div>

          <table class="table border rounded">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tên Người Dùng</th>
                <th scope="col">Email</th>
                <th scope="col">Chức Vụ</th>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Hành Động</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${listUser}" var="nd" varStatus="i">
                <tr>
                  <th class="text-center" scope="row">${i.index + 1}</th>
                  <td>${nd.username}</td>
                  <td>${nd.email}</td>
                  <td>${nd.role}</td>
                  <td>
                    <c:if test="${nd.status == true}">
                      <span class="badge bg-success">Hoạt Động</span>
                    </c:if>
                    <c:if test="${nd.status == false}">
                      <span class="badge bg-danger">Không Hoạt Động</span>
                    </c:if>
                  </td>
                  <td>
                    <a
                      class="btn edit-btn"
                      data-bs-toggle="modal"
                      data-bs-target="#editModal"
                      data-id="${nd.id}"
                      data-username="${nd.username}"
                      data-status="${nd.status}"
                      data-email="${nd.email}"
                      data-role="${nd.role}"
                      title="Chỉnh Sửa"
                    >
                      <i class="fa-solid fa-pen-to-square"></i>
                    </a>

                    <a
                      onclick="return confirmDelete()"
                      class="btn delete-btn"
                      data-toggle="tooltip"
                      data-placement="top"
                      data-id="${nd.id}"
                      title="Xóa"
                    >
                      <i class="fa-solid fa-trash"></i>
                    </a>

                    <a
                      href="/admin/nguoi-dung-chi-tiet"
                      class="btn"
                      data-placement="top"
                      title="Xem Chi Tiết"
                    >
                      <i class="fa-solid fa-eye"></i>
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>

        <!-- Modal Thêm Mới -->
        <div
          class="modal fade"
          id="themNguoiDung"
          tabindex="-1"
          aria-labelledby="exampleModalLabel"
          aria-hidden="true"
        >
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                  Thêm Mới Người Dùng
                </h5>
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                ></button>
              </div>
              <form action="/admin/user/post" method="POST">
                <div class="modal-body d-flex flex-column gap-2">
                  <div class="form-group">
                    <label class="mb-1" for="username">Tên Người Dùng:</label>
                    <input
                      type="string"
                      class="form-control"
                      id="username"
                      aria-describedby="emailHelp"
                      placeholder="Nhập tên người dùng"
                      name="username"
                      required
                    />
                  </div>

                  <div class="form-group">
                    <label class="mb-1" for="email">Email:</label>
                    <input
                      type="email"
                      name="email"
                      class="form-control"
                      id="email"
                      aria-describedby="email"
                      placeholder="Nhập Email"
                    />
                  </div>

                  <div class="form-group">
                    <label class="mb-1" for="password">Mật Khẩu:</label>
                    <input
                      type="password"
                      class="form-control"
                      id="password"
                      aria-describedby="password"
                      placeholder="Nhập mật khẩu"
                      name="password"
                    />
                  </div>

                  <div class="form-group">
                    <label class="mb-1" for="password">Vai Trò:</label>
                    <select id="role" name="role" class="form-select">
                      <option value="USER">USER</option>
                      <option value="ADMIN">ADMIN</option>
                    </select>
                  </div>

                  <div class="form-group">
                    <label class="mb-1" for="password">Trạng Thái:</label>
                    <select id="status" name="status" class="form-select">
                      <option value="1">Hoạt Động</option>
                      <option value="0">Không Hoạt Động</option>
                    </select>
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
                  <button type="submit" class="btn btn-success">
                    Thêm Mới
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>

        <!-- Modal Edit -->
        <form id="editUserForm" method="POST">
          <div
            class="modal fade"
            id="editModal"
            tabindex="-1"
            aria-labelledby="editModalLabel"
            aria-hidden="true"
          >
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="editModalLabel">
                    Chỉnh Sửa Người Dùng
                  </h5>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div class="modal-body d-flex flex-column gap-2">
                  <input type="hidden" id="userId" name="id" />

                  <div class="form-group">
                    <label class="mb-1" for="username">Tên Người Dùng:</label>
                    <input
                      type="text"
                      class="form-control"
                      id="usernameU"
                      name="username"
                      placeholder="Nhập tên người dùng"
                      required
                      readonly
                    />
                  </div>

                  <div class="form-group">
                    <label class="mb-1" for="email">Email:</label>
                    <input
                      type="email"
                      class="form-control"
                      id="emailU"
                      name="email"
                      placeholder="Nhập Email"
                    />
                  </div>

                  <div class="form-group">
                    <label class="mb-1" for="password">Mật Khẩu:</label>
                    <input
                      type="password"
                      class="form-control"
                      id="passwordU"
                      name="password"
                      placeholder="Nhập mật khẩu"
                    />
                  </div>

                  <div class="form-group">
                    <label class="mb-1" for="role">Vai Trò:</label>
                    <select id="roleU" name="role" class="form-select">
                      <option value="USER">USER</option>
                      <option value="ADMIN">ADMIN</option>
                    </select>
                  </div>

                  <div class="form-group">
                    <label class="mb-1" for="status">Trạng Thái:</label>
                    <select id="statusU" name="status" class="form-select">
                      <option value="true">Hoạt Động</option>
                      <option value="false">Không Hoạt Động</option>
                    </select>
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
                  <button type="submit" class="btn btn-success">
                    Cập Nhật
                  </button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/actionUser.js"></script>
  </body>
</html>
