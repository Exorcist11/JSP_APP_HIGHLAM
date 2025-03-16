<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng ký</title>
    <link rel="stylesheet" href="../css/style.css" />
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
  </head>
  <body
    style="
      background-image: url(../images/banner/bg-login.jpg);
      min-height: 746px;
    "
  >
    <div class="wrapper-register">
      <div class="register">
        <div class="logo-register">
          <a href="/">
            <img src="../images/logo.png" alt="" />
          </a>
        </div>
        <div class="text-welcome">
          <p>Welcome back!</p>
          <p>Thương hiệu thời trang của người Việt</p>
        </div>
        <form
          th:action="@{/t-shirt-luxury/register}"
          method="POST"
          class="d-flex flex-column gap-2"
        >
          <div class="form-group form-container w-75">
            <label for="tenNguoiDung" class="form-label">Tên Người Dùng:</label>
            <i class="ti-user"></i>
            <input
              type="text"
              id="tenNguoiDung"
              name="tenNguoiDung"
              class="form-control"
              required
            />
          </div>
          <div class="form-group form-container w-75">
            <label for="tenDangNhap" class="form-label">Tên Đăng Nhập:</label>
            <i class="ti-id-badge"></i>
            <input
              type="text"
              id="tenDangNhap"
              name="tenDangNhap"
              class="form-control"
              required
            />
          </div>
          <div class="form-group form-container w-75">
            <label for="email" class="form-label">Email:</label>
            <i class="ti-email"></i>
            <input
              type="email"
              id="email"
              name="email"
              class="form-control"
              required
            />
          </div>
          <div class="form-group form-container w-75">
            <label for="matKhau" class="form-label">Mật Khẩu:</label>
            <i class="ti-lock"></i>
            <input
              type="password"
              id="matKhau"
              name="matKhau"
              class="form-control"
              required
            />
          </div>
          <button type="submit" class="btn btn-primary w-25">Đăng Ký</button>
        </form>
        <div class="text-or">
          <div class="line-left"></div>
          <p>hoặc</p>
          <div class="line-right"></div>
        </div>
        <div class="register-by-facebook-google">
          <a class="button-register-by-facebook" href="#">
            <img src="../images/facebook-2-logo-svgrepo-com.svg" alt="" />
            <p class="mb-0 ms-3">Tiếp tục với Facebook</p>
          </a>
          <a class="button-register-by-google" href="#">
            <img
              src="../images/google-logo-search-new-svgrepo-com.svg"
              alt=""
            />
            <p class="mb-0 ms-3">Tiếp tục với Google</p>
          </a>
        </div>
        <div class="change-page-login">
          <a href="/login" class="link-page-login"
            >Đăng nhập nếu bạn đã có tài khoản.</a
          >
        </div>
      </div>
    </div>
    <script
      src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
