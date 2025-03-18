<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div
  class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white"
  style="min-height: 600px"
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
      <a href="/profile" class="nav-link align-middle px-0 text-white">
        <i class="fs-4 bi-house"></i>
        <span class="ms-1 d-none d-sm-inline">Thông tin cá nhân</span>
      </a>
    </li>
    <li>
      <a
        href="#submenu1"
        data-bs-toggle="collapse"
        class="nav-link px-0 align-middle text-white"
      >
        <i class="fs-4 bi-speedometer2"></i>
        <span class="ms-1 d-none d-sm-inline">Lịch sử mua hàng</span>
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
      <span class="d-none d-sm-inline mx-1 btn btn-light w-100">Đăng xuất</span>
    </a>
  </div>
</div>
