<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>T-SHIRT LUXURY</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      inegrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/fragments/headerProduct.jsp" />
    <!-- End Header -->

    <div class="container-fluid">
      <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-primary">
          <div
            class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white"
          >
            <a
              href="/"
              class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none"
            >
              <span class="fs-5 d-none d-sm-inline">Menu</span>
            </a>
            <ul
              class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start text-white"
              id="menu"
            >
              <li class="nav-item">
                <a href="#" class="nav-link align-middle px-0 text-white">
                  <i class="fs-4 bi-house"></i>
                  <span class="ms-1 d-none d-sm-inline">Home</span>
                </a>
              </li>
              <li>
                <a
                  href="#submenu1"
                  data-bs-toggle="collapse"
                  class="nav-link px-0 align-middle text-white"
                >
                  <i class="fs-4 bi-speedometer2"></i>
                  <span class="ms-1 d-none d-sm-inline">Dashboard</span>
                </a>
              </li>

              <li>
                <a href="#" class="nav-link px-0 align-middle text-white">
                  <i class="fs-4 bi-table"></i>
                  <span class="ms-1 d-none d-sm-inline">Orders</span></a
                >
              </li>
              <li>
                <a
                  href="#submenu2"
                  data-bs-toggle="collapse"
                  class="nav-link px-0 align-middle text-white"
                >
                  <i class="fs-4 bi-bootstrap"></i>
                  <span class="ms-1 d-none d-sm-inline">Bootstrap</span></a
                >
                <ul
                  class="collapse nav flex-column ms-1"
                  id="submenu2"
                  data-bs-parent="#menu"
                >
                  <li class="w-100">
                    <a href="#" class="nav-link px-0 text-white">
                      <span class="d-none d-sm-inline">Item</span> 1</a
                    >
                  </li>
                  <li>
                    <a href="#" class="nav-link px-0 text-white">
                      <span class="d-none d-sm-inline">Item</span> 2</a
                    >
                  </li>
                </ul>
              </li>
              <li>
                <a
                  href="#submenu3"
                  data-bs-toggle="collapse"
                  class="nav-link px-0 align-middle text-white"
                >
                  <i class="fs-4 bi-grid"></i>
                  <span class="ms-1 d-none d-sm-inline">Products</span>
                </a>
                <ul
                  class="collapse nav flex-column ms-1"
                  id="submenu3"
                  data-bs-parent="#menu"
                >
                  <li class="w-100">
                    <a href="#" class="nav-link px-0 text-white">
                      <span class="d-none d-sm-inline">Product</span> 1</a
                    >
                  </li>
                  <li>
                    <a href="#" class="nav-link px-0 text-white">
                      <span class="d-none d-sm-inline">Product</span> 2</a
                    >
                  </li>
                  <li>
                    <a href="#" class="nav-link px-0 text-white">
                      <span class="d-none d-sm-inline">Product</span> 3</a
                    >
                  </li>
                  <li>
                    <a href="#" class="nav-link px-0 text-white">
                      <span class="d-none d-sm-inline">Product</span> 4</a
                    >
                  </li>
                </ul>
              </li>
              <li>
                <a href="#" class="nav-link px-0 align-middle text-white">
                  <i class="fs-4 bi-people"></i>
                  <span class="ms-1 d-none d-sm-inline">Customers</span>
                </a>
              </li>
            </ul>
            <hr />
            <div class="dropdown pb-4 w-100">
              <a
                href="/logout"
                class="d-flex align-items-center text-white text-decoration-none"
                id="dropdownUser1"
                aria-expanded="false"
              >
                <span class="d-none d-sm-inline mx-1 btn btn-light w-100"
                  >Đăng xuất</span
                >
              </a>
            </div>
          </div>
        </div>
        <div class="col py-3">Content area...</div>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
  </body>
</html>
