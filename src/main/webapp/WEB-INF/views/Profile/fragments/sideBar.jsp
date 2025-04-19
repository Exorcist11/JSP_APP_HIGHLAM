<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div
  class="d-flex flex-column align-items-stretch px-3 pt-3 text-white bg-dark"
  style="min-height: 600px; width: 300px; height: 100%"
>
  <!-- Brand/Logo -->
  <a
    href="/"
    class="d-flex align-items-center px-3 py-2 mb-3 text-white text-decoration-none"
  >
    <span class="fs-4 fw-bold">LUXURY</span>
  </a>

  <!-- Menu Items -->
  <ul class="nav nav-pills flex-column mb-auto" id="sidebarMenu">
    <li class="nav-item">
      <a href="/profile" class="nav-link text-white py-2 px-3 rounded">
        <i class="bi bi-person me-2"></i>
        <span>Thông tin cá nhân</span>
      </a>
    </li>
    <li class="nav-item">
      <a href="/history" class="nav-link text-white py-2 px-3 rounded">
        <i class="bi bi-clock-history me-2"></i>
        <span>Lịch sử mua hàng</span>
      </a>
    </li>
  </ul>

  <!-- Logout -->
  <hr class="my-3" />
  <div class="px-3 pb-3">
    <a href="/logout" class="btn btn-outline-light w-100">
      <i class="bi bi-box-arrow-right me-2"></i>
      Đăng xuất
    </a>
  </div>
</div>

<!-- JavaScript for Active Menu -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const currentPath = window.location.pathname;
    const menuLinks = document.querySelectorAll("#sidebarMenu .nav-link");

    menuLinks.forEach((link) => {
      if (link.getAttribute("href") === currentPath) {
        link.classList.add("active");
      } else {
        link.classList.remove("active");
      }
    });
  });
</script>

<style>
  /* Custom styles for better appearance */
  .nav-link {
    transition: background-color 0.2s ease;
  }

  .nav-link:hover {
    background-color: rgba(255, 255, 255, 0.1);
  }

  .nav-link.active {
    background-color: #0d6efd !important;
    color: white !important;
  }

  /* Responsive adjustments */
  @media (max-width: 576px) {
    .d-flex {
      width: 100% !important;
    }
  }
</style>
