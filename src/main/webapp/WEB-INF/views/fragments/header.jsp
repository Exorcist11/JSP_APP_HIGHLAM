<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>T-Luxury - Menu Navigation</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <!-- Font Awesome for icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
    <style>
      /* Custom Navbar Styling */
      .navbar {
        background-color: #ffffff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 15px 0;
        position: fixed; /* Cố định navbar */
        top: 0;
        left: 0;
        width: 100%;
        z-index: 50; /* Đảm bảo navbar ở trên cùng */
      }

      .navbar-brand img {
        width: 50px;
        height: 50px;
        background-color: #333;
        margin-right: 20px;
      }

      .nav-item {
        position: relative;
        margin-right: 15px;
      }

      .nav-link {
        font-size: 1.1rem;
        font-weight: 500;
        color: #333;
        padding: 10px 15px;
        transition: color 0.3s ease, background-color 0.3s ease;
        display: flex;
        align-items: center;
      }

      .nav-link:hover {
        color: #007bff;
        background-color: #f8f9fa;
        border-radius: 5px;
      }

      .nav-link i {
        margin-left: 5px;
        font-size: 0.9rem;
      }

      /* Dropdown Styling */
      .dropdown-menu {
        display: none; /* Ẩn mặc định */
        background-color: #ffffff;
        border: none;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        border-radius: 8px;
        padding: 10px 0;
        min-width: 200px;
        position: absolute;
        top: 100%; /* Đặt ngay dưới nav-link */
        left: 0;
        z-index: 1000;
      }

      /* Hiển thị dropdown khi hover */
      .nav-item:hover .dropdown-menu {
        display: block; /* Hiển thị khi hover */
        animation: fadeIn 0.3s ease-in-out;
      }

      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(10px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      .dropdown-item {
        font-size: 1rem;
        color: #333;
        padding: 10px 20px;
        transition: background-color 0.3s ease, color 0.3s ease;
      }

      .dropdown-item:hover {
        background-color: #007bff;
        color: #ffffff;
        border-radius: 4px;
      }

      /* Search Form Styling */
      .search-form {
        position: relative;
        max-width: 250px;
        margin-right: 20px;
      }

      .search-form input {
        border-radius: 25px;
        padding: 8px 40px 8px 15px;
        border: 1px solid #ddd;
        transition: border-color 0.3s ease;
      }

      .search-form input:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
      }

      .search-form button {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        color: #666;
        transition: color 0.3s ease;
      }

      .search-form button:hover {
        color: #007bff;
      }

      /* Icon Links */
      .icon-link {
        font-size: 1.2rem;
        color: #333;
        padding: 0 15px;
        transition: color 0.3s ease;
      }

      .icon-link:hover {
        color: #007bff;
      }

      /* Responsive Adjustments */
      @media (max-width: 991px) {
        .navbar {
          position: fixed; /* Giữ cố định trên mobile */
        }

        .dropdown-menu {
          display: none !important; /* Ẩn hover trên mobile */
        }

        .nav-item .dropdown-menu.show {
          display: block !important; /* Hiển thị khi click trên mobile */
        }

        .nav-link {
          padding: 10px;
        }

        .search-form {
          margin-right: 10px;
        }

        .icon-link {
          padding: 0 10px;
        }
      }
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg">
      <div class="container">
        <a href="/" class="navbar-brand">
          <img
            src="../images/logo.png"
            alt="T-Luxury Logo"
            width="50"
            height="50"
          />
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <c:forEach var="category" items="${lst_categories}">
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="categoryDropdown${category.id}"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  ${category.name}
                </a>
                <ul
                  class="dropdown-menu"
                  aria-labelledby="categoryDropdown${category.id}"
                >
                  <c:forEach var="detail" items="${category.categoryDetails}">
                    <li>
                      <a
                        class="dropdown-item"
                        href="/category?categoryDetailId=${detail.id}"
                        >${detail.name}</a
                      >
                    </li>
                  </c:forEach>
                </ul>
              </li>
            </c:forEach>
          </ul>
          <!-- Search form -->
          <form class="d-flex search-form">
            <input
              class="form-control"
              type="search"
              placeholder="Tìm kiếm sản phẩm..."
              aria-label="Search"
            />
            <button type="submit">
              <i class="fas fa-search"></i>
            </button>
          </form>
          <a href="/login" class="icon-link">
            <i class="fa-regular fa-user"></i>
          </a>
          <a
            href="/cart"
            class="icon-link"
            data-bs-toggle="offcanvas"
            data-bs-target="#cartDrawer"
            aria-controls="cartDrawer"
          >
            <i class="fa-solid fa-cart-shopping"></i>
          </a>
        </div>
      </div>
    </nav>

    <div class="drawer">
      <div
        class="offcanvas offcanvas-end "
        tabindex="-1"
        id="cartDrawer"
        aria-labelledby="cartDrawerLabel"
   
      >
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="cartDrawerLabel">Giỏ hàng</h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
          ></button>
        </div>
        <div class="offcanvas-body">
          <div id="cartItems">
            <c:forEach items="${cartItems}" var="item">
              <div class="cart-item d-flex align-items-center gap-2">
                <div class="cart-item-image">
                  <img
                    src="${item.imageUrl}"
                    alt="Product"
                    class="img-fluid"
                    width="150px"
                    height="150px"
                  />
                </div>
                <div
                  class="d-flex align-items-center justify-content-between w-100"
                >
                  <div class="cart-item-info">
                    <h6 class="mb-1">
                      ${item.productName} - ${item.colorName} - ${item.sizeName}
                    </h6>

                    <p class="mb-1">
                      <fmt:formatNumber
                        value="${item.price}"
                        groupingUsed="true"
                        maxFractionDigits="0"
                      />
                      đ x ${item.quantity}
                    </p>
                  </div>
                  <form method="POST" action="/cart/remove" class="d-inline">
                    <input
                      type="hidden"
                      name="productDetailId"
                      value="${item.productDetailId}"
                    />
                    <button type="submit" class="btn btn-danger btn-sm">
                      Xóa
                    </button>
                  </form>
                </div>
              </div>
              <hr />
            </c:forEach>
          </div>
          <div class="d-flex justify-content-between">
            <strong>Tổng tiền tạm tính:</strong>
            <span id="totalPrice">
              <fmt:formatNumber
                value="${totalPrice}"
                groupingUsed="true"
                maxFractionDigits="0"
              />
              đ
            </span>
          </div>
          <a class="btn btn-dark w-100 mt-3" href="/cart/checkout"
            >TIẾN HÀNH ĐẶT HÀNG</a
          >
          <a href="/cart" class="btn btn-light w-100 mt-2 text-center"
            >Xem chi tiết giỏ hàng ➔</a
          >
        </div>
      </div>
    </div>

    <!-- Bootstrap JS -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script>
      // JavaScript để hỗ trợ hover trên desktop và click trên mobile
      document.addEventListener("DOMContentLoaded", function () {
        if (window.innerWidth > 991) {
          // Chỉ áp dụng hover trên desktop
          document
            .querySelectorAll(".nav-item.dropdown")
            .forEach(function (item) {
              item.addEventListener("mouseenter", function () {
                let dropdownMenu = this.querySelector(".dropdown-menu");
                dropdownMenu.classList.add("show");
              });
              item.addEventListener("mouseleave", function () {
                let dropdownMenu = this.querySelector(".dropdown-menu");
                dropdownMenu.classList.remove("show");
              });
            });
        }
      });
    </script>
  </body>
</html>
