<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Áo Nam</title>
    <!-- Combined CSS links -->
    link rel="stylesheet" href="../css/style.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <link rel="stylesheet" href="../css/danhMucAoNam.css" />
  </head>
  <body>
    <header>
      <jsp:include page="/WEB-INF/views/fragments/header.jsp" />
    </header>

    <div class="container">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a class="home" href="/"><i class="fas fa-home"></i> Trang chủ</a>
          </li>
          <li class="breadcrumb-item active" aria-current="page">Áo Nam</li>
        </ol>
      </nav>
      <h1 class="mt-3">Áo Nam</h1>

      <nav class="navbar-expand-lg">
        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
          <h4 class="mt-text">Bộ Lọc</h4>
          <ul class="navbar-nav">
            <!-- Color Filter -->
            <li class="nav-item dropdown">
              <button
                class="btn btn-light dropdown-toggle"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Màu Sắc
              </button>
              <ul class="dropdown-menu p-3">
                <div class="d-flex flex-wrap">
                  <c:forEach
                    var="color"
                    items="${['Red', 'Brown', 'Pink', 'Black', 'Blue', 'Yellow']}"
                  >
                    <label class="color-option">
                      <input
                        type="checkbox"
                        class="color-checkbox"
                        id="color${color}"
                      />
                      <div
                        class="color-box"
                        style="background-color: ${color.toLowerCase()}"
                      ></div>
                    </label>
                  </c:forEach>
                </div>
              </ul>
            </li>

            <!-- Size Filter -->
            <li class="nav-item dropdown">
              <button
                class="btn btn-light dropdown-toggle"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Kích Cỡ
              </button>
              <ul class="dropdown-menu p-3">
                <c:forEach var="size" items="${['S', 'M', 'L', 'XL', '2XL']}">
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="size${size}"
                    />
                    <label class="form-check-label" for="size${size}"
                      >${size}</label
                    >
                  </div>
                </c:forEach>
              </ul>
            </li>

            <!-- Price Filter -->
            <li class="nav-item dropdown">
              <button
                class="btn btn-light dropdown-toggle"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Khoảng Giá
              </button>
              <ul class="dropdown-menu p-3">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="price1" />
                  <label class="form-check-label" for="price1"
                    >Dưới 200,000</label
                  >
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="price2" />
                  <label class="form-check-label" for="price2"
                    >Từ 200,000 - 500,000</label
                  >
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="price3" />
                  <label class="form-check-label" for="price3"
                    >Từ 500,000 - 1,000,000</label
                  >
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="price4" />
                  <label class="form-check-label" for="price4"
                    >Trên 1,000,000</label
                  >
                </div>
              </ul>
            </li>
          </ul>

          <!-- Sorting -->
          <div class="sort-container">
            <span class="sort-label">Sắp xếp theo:</span>
            <select class="form-select">
              <option value="1" selected>Mới nhất</option>
              <option value="2">Giá giảm dần</option>
              <option value="3">Giá tăng dần</option>
            </select>
          </div>
        </div>
      </nav>

      <!-- Product Listing -->
      <div class="row">
        <c:forEach items="${products}" var="p">
          <div class="col-md-3 mb-4">
            <div class="card product-card h-100">
              <img
                src="${p.imgUrl}"
                alt="${p.name}"
                class="card-img-top product-image"
              />
              <div class="card-body product-info">
                <div class="colors">
                  <img
                    src="../images/ao_phong_boxy/DEVOTUS/black.webp"
                    alt="color option"
                    width="20"
                    height="20"
                  />
                </div>
                <h5 class="product-name">${p.name}</h5>
                <p class="price">
                  <fmt:formatNumber
                    value="${p.price}"
                    groupingUsed="true"
                    maxFractionDigits="0"
                  />
                  VND
                </p>
              </div>
              <div class="card-footer product-actions">
                <button class="btn btn-dark btn-sm">
                  <i class="fas fa-shopping-cart"></i> Mua nhanh
                </button>
                <a
                  href="/product?id=${p.id}"
                  class="btn btn-outline-dark btn-sm"
                >
                  <i class="fas fa-eye"></i> Xem chi tiết
                </a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>

      <!-- Pagination -->
      <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <c:forEach begin="1" end="${totalPages}" var="i">
            <li class="page-item ${currentPage == i ? 'active' : ''}">
              <a class="page-link" href="?page=${i}">${i}</a>
            </li>
          </c:forEach>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>

      <!-- Banner -->
      <div class="row mt-5">
        <div class="col-12">
          <img
            src="https://pos.nvncdn.com/be3159-662/bn/20240921_h3xCoY0r.gif"
            alt="Promotional banner"
            class="img-fluid"
          />
        </div>
      </div>
    </div>

    <footer class="container py-5">
      <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
    </footer>

    <!-- Combined JS at bottom -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
