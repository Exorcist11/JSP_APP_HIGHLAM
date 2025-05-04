<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

  <!--     Fonts and icons     -->
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
  <script
    defer
    data-site="YOUR_DOMAIN_HERE"
    src="https://api.nepcha.com/js/nepcha-analytics.js"
  ></script>
  <style>
    .navbar-brand img {
      width: 50px;
      min-height: 50px;
      background-color: #333;
      margin-right: 20px;
    }
  </style>
</head>

<aside
  class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3"
  id="sidenav-main"
>
  <div class="sidenav-header">
    <i
      class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
      aria-hidden="true"
      id="iconSidenav"
    ></i>
    <a class="navbar-brand" href="" target="_blank">
      <img
        src="../images/logo.png"
        alt="T-Luxury Logo"
        width="50"
        height="50"
      />
    </a>
  </div>
  <hr class="horizontal dark mt-0" />
  <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="/admin/dashboard">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 45 40"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>dashboard</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-1716.000000, -439.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(0.000000, 148.000000)">
                      <path
                        class="color-background opacity-6"
                        d="M46.7199583,10.7414583 L40.8449583,0.949791667 C40.4909749,0.360605034 39.8540131,0 39.1666667,0 L7.83333333,0 C7.1459869,0 6.50902508,0.360605034 6.15504167,0.949791667 L0.280041667,10.7414583 C0.0969176761,11.0460037 -1.23209662e-05,11.3946378 -1.23209662e-05,11.75 C-0.00758042603,16.0663731 3.48367543,19.5725301 7.80004167,19.5833333 L7.81570833,19.5833333 C9.75003686,19.5882688 11.6168794,18.8726691 13.0522917,17.5760417 C16.0171492,20.2556967 20.5292675,20.2556967 23.494125,17.5760417 C26.4604562,20.2616016 30.9794188,20.2616016 33.94575,17.5760417 C36.2421905,19.6477597 39.5441143,20.1708521 42.3684437,18.9103691 C45.1927731,17.649886 47.0084685,14.8428276 47.0000295,11.75 C47.0000295,11.3946378 46.9030823,11.0460037 46.7199583,10.7414583 Z"
                      ></path>
                      <path
                        class="color-background"
                        d="M39.198,22.4912623 C37.3776246,22.4928106 35.5817531,22.0149171 33.951625,21.0951667 L33.92225,21.1107282 C31.1430221,22.6838032 27.9255001,22.9318916 24.9844167,21.7998837 C24.4750389,21.605469 23.9777983,21.3722567 23.4960833,21.1018359 L23.4745417,21.1129513 C20.6961809,22.6871153 17.4786145,22.9344611 14.5386667,21.7998837 C14.029926,21.6054643 13.533337,21.3722507 13.0522917,21.1018359 C11.4250962,22.0190609 9.63246555,22.4947009 7.81570833,22.4912623 C7.16510551,22.4842162 6.51607673,22.4173045 5.875,22.2911849 L5.875,44.7220845 C5.875,45.9498589 6.7517757,46.9451667 7.83333333,46.9451667 L19.5833333,46.9451667 L19.5833333,33.6066734 L27.4166667,33.6066734 L27.4166667,46.9451667 L39.1666667,46.9451667 C40.2482243,46.9451667 41.125,45.9498589 41.125,44.7220845 L41.125,22.2822926 C40.4887822,22.4116582 39.8442868,22.4815492 39.198,22.4912623 Z"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/pos">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 43 36"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>point-of-sale</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-2169.000000, -745.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(453.000000, 454.000000)">
                      <path
                        class="color-background opacity-6"
                        d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z"
                      ></path>
                      <path
                        class="color-background"
                        d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Bán tại quầy</span>
        </a>
      </li>
      <li class="nav-item mt-3">
        <h6
          class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6"
        >
          Quản lý
        </h6>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/user">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 46 42"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>users</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-1717.000000, -291.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(1.000000, 0.000000)">
                      <path
                       lictlass="color-background opacity-6"
                        d="M45,0 L26,0 C25.447,0 25,0.447 25,1 L25,20 C25,20.379 25.214,20.725 25.553,20.895 C25.694,20.965 25.848,21 26,21 C26.212,21 26.424,20.933 26.6,20.8 L34.333,15 L45,15 C45.553,15 46,14.553 46,14 L46,1 C46,0.447 45.553,0 45,0 Z"
                      ></path>
                      <path
                        class="color-background"
                        d="M22.883,32.86 C20.761,32.012 17.324,31 13,31 C8.676,31 5.239,32.012 3.116,32.86 C1.224,33.619 0,35.438 0,37.494 L0,41 C0,41.553 0.447,42 1,42 L25,42 C25.553,42 26,41.553 26,41 L26,37.494 C26,35.438 24.776,33.619 22.883,32.86 Z"
                      ></path>
                      <path
                        class="color-background"
                        d="M13,28 C17.432,28 21,22.529 21,18 C21,13.589 17.411,10 13,10 C8.589,10 5,13.589 5,18 C5,22.529 8.568,28 13,28 Z"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Người Dùng</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/order?code=&status=&page=0&size=5">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 40 44"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>orders</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-1870.000000, -591.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(154.000000, 300.000000)">
                      <path
                        class="color-background opacity-6"
                        d="M40,40 L36.3636364,40 L36.3636364,3.63636364 L5.45454545,3.63636364 L5.45454545,0 L38.1818182,0 C39.1854545,0 40,0.814545455 40,1.81818182 L40,40 Z"
                      ></path>
                      <path
                        class="color-background"
                        d="M30.9090909,7.27272727 L1.81818182,7.27272727 C0.814545455,7.27272727 0,8.08727273 0,9.09090909 L0,41.8181818 C0,42.8218182 0.814545455,43.6363636 1.81818182,43.6363636 L30.9090909,43.6363636 C31.9127273,43.6363636 32.7272727,42.8218182 32.7272727,41.8181818 L32.7272727,9.09090909 C32.7272727,8.08727273 31.9127273,7.27272727 30.9090909,7.27272727 Z M18.1818182,34.5454545 L7.27272727,34.5454545 L7.27272727,30.9090909 L18.1818182,30.9090909 L18.1818182,34.5454545 Z M25.4545455,27.2727273 L7.27272727,27.2727273 L7.27272727,23.6363636 L25.4545455,23.6363636 L25.4545455,27.2727273 Z M25.4545455,20 L7.27272727,20 L7.27272727,16.3636364 L25.4545455,16.3636364 L25.4545455,20 Z"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Đơn Hàng</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/products?page=0&size=5">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 40 44"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>products</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-1870.000000, -591.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(154.000000, 300.000000)">
                      <path
                        class="color-background opacity-6"
                        d="M40,40 L36.3636364,40 L36.3636364,3.63636364 L5.45454545,3.63636364 L5.45454545,0 L38.1818182,0 C39.1854545,0 40,0.814545455 40,1.81818182 L40,40 Z"
                      ></path>
                      <path
                        class="color-background"
                        d="M30.9090909,7.27272727 L1.81818182,7.27272727 C0.814545455,7.27272727 0,8.08727273 0,9.09090909 L0,41.8181818 C0,42.8218182 0.814545455,43.6363636 1.81818182,43.6363636 L30.9090909,43.6363636 C31.9127273,43.6363636 32.7272727,42.8218182 32.7272727,41.8181818 L32.7272727,9.09090909 C32.7272727,8.08727273 31.9127273,7.27272727 30.9090909,7.27272727 Z M18.1818182,34.5454545 L7.27272727,34.5454545 L7.27272727,30.9090909 L18.1818182,30.9090909 L18.1818182,34.5454545 Z M25.4545455,27.2727273 L7.27272727,27.2727273 L7.27272727,23.6363636 L25.4545455,23.6363636 L25.4545455,27.2727273 Z M25.4545455,20 L7.27272727,20 L7.27272727,16.3636364 L25.4545455,16.3636364 L25.4545455,20 Z"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Sản phẩm</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/discount">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 40 40"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>discount</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-2020.000000, -442.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(304.000000, 151.000000)">
                      <path
                        class="color-background"
                        d="M10,30 C4.4771525,30 0,25.5228475 0,20 C0,14.4771525 4.4771525,10 10,10 C15.5228475,10 20,14.4771525 20,20 C20,25.5228475 15.5228475,30 10,30 Z M10,14 C6.6862915,14 4,16.6862915 4,20 C4,23.3137085 6.6862915,26 10,26 C13.3137085,26 16,23.3137085 16,20 C16,16.6862915 13.3137085,14 10,14 Z"
                      ></path>
                      <path
                        class="color-background opacity-6"
                        d="M30,10 C25.5228475,10 22,14.4771525 22,20 C22,25.5228475 25.5228475,30 30,30 C35.5228475,30 40,25.5228475 40,20 C40,14.4771525 35.5228475,10 30,10 Z M30,14 C33.3137085,14 36,16.6862915 36,20 C36,23.3137085 33.3137085,26 30,26 C26.6862915,26 24,23.3137085 24,20 C24,16.6862915 26.6862915,14 30,14 Z"
                      ></path>
                      <path
                        class="color-background"
                        d="M10,14 L30,26 M30,14 L10,26"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Giảm giá</span>
        </a>
      </li>
      <li class="nav-item mt-3">
        <h6
          class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6"
        >
          Thuộc tính
        </h6>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/colors">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 40 40"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>colors</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-2020.000000, -442.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(304.000000, 151.000000)">
                      <path
                        class="color-background"
                        d="M20,0 C8.954305,0 0,8.954305 0,20 C0,31.045695 8.954305,40 20,40 C31.045695,40 40,31.045695 40,20 C40,8.954305 31.045695,0 20,0 Z M20,36 C11.163444,36 4,28.836556 4,20 C4,11.163444 11.163444,4 20,4 C28.836556,4 36,11.163444 36,20 C36,28.836556 28.836556,36 20,36 Z"
                      ></path>
                      <path
                        class="color-background opacity-6"
                        d="M20,8 C13.372583,8 8,13.372583 8,20 C8,26.627417 13.372583,32 20,32 C26.627417,32 32,26.627417 32,20 C32,13.372583 26.627417,8 20,8 Z M20,28 C15.581722,28 12,24.418278 12,20 C12,15.581722 15.581722,12 20,12 C24.418278,12 28,15.581722 28,20 C28,24.418278 24.418278,28 20,28 Z"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Màu sắc</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/sizes">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 40 40"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>sizes</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-2020.000000, -442.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(304.000000, 151.000000)">
                      <path
                        class="color-background"
                        d="M12,8 H28 V12 H12 V8 Z M8,16 H32 V20 H8 V16 Z M4,24 H36 V28 H4 V24 Z"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Kích cỡ</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/admin/categories">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 40 40"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>categories</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-2020.000000, -442.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(304.000000, 151.000000)">
                      <path
                        class="color-background"
                        d="M0,8 H8 V0 H0 V8 Z M12,4 H28 V8 H12 V4 Z M0,32 H8 V24 H0 V32 Z M12,28 H28 V32 H12 V28 Z M32,16 H40 V8 H32 V16 Z M32,32 H40 V24 H32 V32 Z"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Danh mục</span>
        </a>
      </li>
      <li class="nav-item mt-3">
        <h6
          class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6"
        >
          Tài khoản
        </h6>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/logout">
          <div
            class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center"
          >
            <svg
              width="12px"
              height="12px"
              viewBox="0 0 40 40"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
            >
              <title>logout</title>
              <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g
                  transform="translate(-2020.000000, -442.000000)"
                  fill="#FFFFFF"
                  fill-rule="nonzero"
                >
                  <g transform="translate(1716.000000, 291.000000)">
                    <g transform="translate(304.000000, 151.000000)">
                      <path
                        class="color-background"
                        d="M14,4 L14,36 L2,36 L2,4 L14,4 Z M18,20 L34,20 L30,16 L30,24 L34,20 Z M38,20 C38,31.045695 29.045695,40 18,40 L18,0 C29.045695,0 38,8.954305 38,20 Z"
                      ></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
          </div>
          <span class="nav-link-text ms-1">Đăng xuất</span>
        </a>
      </li>
    </ul>
  </div>
  <div class="sidenav-footer mx-3">
    <div
      class="card card-background shadow-none card-background-mask-secondary"
      id="sidenavCard"
    >
      <div
        class="full-background"
        style="
          background-image: url('../assets/img/curved-images/white-curved.jpg');
        "
      ></div>
    </div>
  </div>
</aside>

<script>
  var ctx = document.getElementById("chart-bars").getContext("2d");

  new Chart(ctx, {
    type: "bar",
    data: {
      labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      datasets: [
        {
          label: "Sales",
          tension: 0.4,
          borderWidth: 0,
          borderRadius: 4,
          borderSkipped: false,
          backgroundColor: "#fff",
          data: [450, 200, 100, 220, 500, 100, 400, 230, 500],
          maxBarThickness: 6,
        },
      ],
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false,
        },
      },
      interaction: {
        intersect: false,
        mode: "index",
      },
      scales: {
        y: {
          grid: {
            drawBorder: false,
            display: false,
            drawOnChartArea: false,
            drawTicks: false,
          },
          ticks: {
            suggestedMin: 0,
            suggestedMax: 500,
            beginAtZero: true,
            padding: 15,
            font: {
              size: 14,
              family: "Inter",
              style: "normal",
              lineHeight: 2,
            },
            color: "#fff",
          },
        },
        x: {
          grid: {
            drawBorder: false,
            display: false,
            drawOnChartArea: false,
            drawTicks: false,
          },
          ticks: {
            display: false,
          },
        },
      },
    },
  });

  var ctx2 = document.getElementById("chart-line").getContext("2d");

  var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);

  gradientStroke1.addColorStop(1, "rgba(203,12,159,0.2)");
  gradientStroke1.addColorStop(0.2, "rgba(72,72,176,0.0)");
  gradientStroke1.addColorStop(0, "rgba(203,12,159,0)"); //purple colors

  var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);

  gradientStroke2.addColorStop(1, "rgba(20,23,39,0.2)");
  gradientStroke2.addColorStop(0.2, "rgba(72,72,176,0.0)");
  gradientStroke2.addColorStop(0, "rgba(20,23,39,0)"); //purple colors

  new Chart(ctx2, {
    type: "line",
    data: {
      labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      datasets: [
        {
          label: "Mobile apps",
          tension: 0.4,
          borderWidth: 0,
          pointRadius: 0,
          borderColor: "#cb0c9f",
          borderWidth: 3,
          backgroundColor: gradientStroke1,
          fill: true,
          data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
          maxBarThickness: 6,
        },
        {
          label: "Websites",
          tension: 0.4,
          borderWidth: 0,
          pointRadius: 0,
          borderColor: "#3A416F",
          borderWidth: 3,
          backgroundColor: gradientStroke2,
          fill: true,
          data: [30, 90, 40, 140, 290, 290, 340, 230, 400],
          maxBarThickness: 6,
        },
      ],
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false,
        },
      },
      interaction: {
        intersect: false,
        mode: "index",
      },
      scales: {
        y: {
          grid: {
            drawBorder: false,
            display: true,
            drawOnChartArea: true,
            drawTicks: false,
            borderDash: [5, 5],
          },
          ticks: {
            display: true,
            padding: 10,
            color: "#b2b9bf",
            font: {
              size: 11,
              family: "Inter",
              style: "normal",
              lineHeight: 2,
            },
          },
        },
        x: {
          grid: {
            drawBorder: false,
            display: false,
            drawOnChartArea: false,
            drawTicks: false,
            borderDash: [5, 5],
          },
          ticks: {
            display: true,
            color: "#b2b9bf",
            padding: 20,
            font: {
              size: 11,
              family: "Inter",
              style: "normal",
              lineHeight: 2,
            },
          },
        },
      },
    },
  });
</script>
<script>
  var win = navigator.platform.indexOf("Win") > -1;
  if (win && document.querySelector("#sidenav-scrollbar")) {
    var options = {
      damping: "0.5",
    };
    Scrollbar.init(document.querySelector("#sidenav-scrollbar"), options);
  }
</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="../assets/js/soft-ui-dashboard.min.js?v=1.1.0"></script>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll(".nav-link");

    navLinks.forEach((link) => {
      const linkHref = link.getAttribute("href");
      const linkPath = new URL(linkHref, window.location.origin).pathname;

      if (
        currentPath === linkPath ||
        (linkPath !== "/" && currentPath.startsWith(linkPath))
      ) {
        link.classList.add("active");
      } else {
        link.classList.remove("active");
      }
    });
  });
</script>