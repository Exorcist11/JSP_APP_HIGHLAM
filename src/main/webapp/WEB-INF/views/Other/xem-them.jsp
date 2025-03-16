<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <link rel="stylesheet" href="../css/xem-them.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script src="../js/xem-them.js"></script>
    <title>Document</title>
  </head>
  <body>
    <div class="wrapper">
      <div
        class="header d-flex"
        style="
          box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
          padding: 10px 0px;
          gap: 382px;
          justify-content: space-between;
          z-index: 5;
        "
      >
        <div
          class="icon-bar"
          style="
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 35px;
            padding-left: 10px;
          "
        >
          <i class="fa-solid fa-bars d-flex"></i>
        </div>
        <div class="logo-and-search d-flex" style="gap: 164px">
          <div class="logo-header-popup">
            <a href="/">
              <img src="../images/logo.png" alt="" />
            </a>
          </div>
          <div class="search-favourite-cart-popup" style="margin-left: 0">
            <form action="" class="form-search-popup">
              <i class="fa-solid fa-magnifying-glass"></i>
              <input
                class="input-search-popup"
                type="text"
                name=""
                id=""
                placeholder="Tìm kiếm"
              />
            </form>
            <a href="#">
              <i class="fa-regular fa-user ps-5"></i>
            </a>
            <a href="#">
              <i class="fa-regular fa-heart ps-5"></i>
            </a>
            <a href="#">
              <i class="fa-solid fa-cart-shopping ps-5 pe-3"></i>
            </a>
          </div>
        </div>

        <div class="type-tshirt-popup">
          <ul>
            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông Boxy</a>
            </li>
            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông cổ chữ V</a>
            </li>

            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông cổ tròn</a>
            </li>

            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông Oversize</a>
            </li>
            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông Polo</a>
            </li>
            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông Unisex</a>
            </li>
          </ul>
          <ul class="img-type-tshirt-popup">
            <img src="./images/pink.webp" alt="" />
            <img src="./images/brow.webp" alt="" />
            <img src="./images/black.webp" alt="" />
          </ul>
        </div>
      </div>
      <div
        class="header-popup"
        style="box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1)"
      >
        <div class="logo-header-popup">
          <a href="/">
            <img src="../images/logo.png" alt="" />
          </a>
        </div>
        <ul class="menu-popup">
          <li class="item-danh-muc">
            <a href="#" class="name-danh-muc-popup">Áo Nam </a>
          </li>
          <li class="item-danh-muc">
            <a href="#" class="name-danh-muc-popup">Quần Nam</a>
          </li>
          <li><a href="#" class="name-danh-muc-popup">Phụ kiện</a></li>
          <li><a href="#" class="name-danh-muc-popup">Album</a></li>
          <li><a href="#" class="name-danh-muc-popup">Tin tức</a></li>
        </ul>
        <div class="search-favourite-cart-popup">
          <form action="" class="form-search-popup">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input
              class="input-search-popup"
              type="text"
              name=""
              id=""
              placeholder="Tìm kiếm"
            />
          </form>
          <a href="#">
            <i class="fa-regular fa-user ps-5"></i>
          </a>
          <a href="#">
            <i class="fa-regular fa-heart ps-5"></i>
          </a>
          <a href="#">
            <i class="fa-solid fa-cart-shopping ps-5 pe-3"></i>
          </a>
        </div>
        <div class="type-tshirt-popup" style="display: none">
          <ul>
            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông Boxy</a>
            </li>
            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông cổ chữ V</a>
            </li>

            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông cổ tròn</a>
            </li>

            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông Oversize</a>
            </li>
            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông Polo</a>
            </li>
            <li>
              <a href="#" class="name-type-tshirt-popup">Áo phông Unisex</a>
            </li>
          </ul>
          <ul class="img-type-tshirt-popup">
            <img src="./images/pink.webp" alt="" />
            <img src="./images/brow.webp" alt="" />
            <img src="./images/black.webp" alt="" />
          </ul>
        </div>
      </div>
      <div
        class="danh-muc-page-ctsp"
        style="
          display: none;
          position: absolute;
          background-color: #ffff;
          top: 0;
          z-index: 6;
        "
      >
        <ul>
          <li
            class="item-danh-muc-ctsp"
            style="border-right: 1px solid #000; padding: 0 10px"
          >
            <a href="#" class="ten-danh-muc hover-change-color">Áo Nam </a>
          </li>
          <li class="item-danh-muc-ctsp">
            <a
              href="#"
              class="ten-danh-muc hover-change-color"
              style="border-right: 1px solid #000; padding: 0 10px"
              >Quần Nam
            </a>
          </li>
          <li>
            <a
              href="#"
              class="ten-danh-muc hover-change-color"
              style="border-right: 1px solid #000; padding: 0 10px"
              >Phụ kiện
            </a>
          </li>
        </ul>
        <ul id="type-tshirt">
          <li>
            <a href="#" class="name-type hover-change-color">Áo phông Boxy</a>
          </li>
          <li>
            <a href="#" class="name-type hover-change-color"
              >Áo phông cổ chữ V</a
            >
          </li>

          <li>
            <a href="#" class="name-type hover-change-color"
              >Áo phông cổ tròn</a
            >
          </li>

          <li>
            <a href="#" class="name-type hover-change-color"
              >Áo phông Oversize</a
            >
          </li>
          <li>
            <a href="#" class="name-type hover-change-color">Áo phông Polo</a>
          </li>
          <li>
            <a href="#" class="name-type hover-change-color">Áo phông Unisex</a>
          </li>
          <ul class="login-and-signin">
            <i class="fa-regular fa-user pe-3"></i>
            <li class="button-login pe-3">
              <a href="#" class="ten-danh-muc hover-change-color">ĐĂNG NHẬP</a>
            </li>
            <li class="button-sign-in">
              <a href="#" class="ten-danh-muc hover-change-color">ĐĂNG KÝ</a>
            </li>
          </ul>
        </ul>
      </div>
    </div>
    <div>
      <a href="/" style="font-size: small; color: black; text-decoration: none"
        ><i class="fa-solid fa-house"></i>Trang chủ |
      </a>
      <a
        href=""
        class="fw-lighter"
        style="font-size: small; color: black; text-decoration: none"
        >Sản phẩm</a
      >
    </div>

    <h4 style="margin-top: 30px">Sản phẩm</h4>
    <div class="row" style="margin-top: 50px">
      <div class="col-3">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-10">
            <div class="d-flex align-items-center">
              <p class="fw-lighter mb-0" style="font-size: medium">BỘ LỌC</p>
              <div class="ms-3" style="width: 200px">
                <form>
                  <select
                    id="fruits"
                    class="form-select"
                    aria-label="Default select example"
                  >
                    <option selected>Chọn khoảng giá</option>
                    <option value="1">200.000-500.000</option>
                    <option value="2">500.000-1.000.000</option>
                    <option value="3">>1.000.000</option>
                  </select>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-6"></div>
      <div class="col-2">
        <div class="d-flex align-items-center">
          <p class="mb-0" style="font-size: small"><b>sắp xếp theo</b></p>
          <div class="ms-3" style="width: 150px">
            <form>
              <select
                id="price-range"
                class="form-select"
                aria-label="Default select example"
                style="font-size: 12px; padding: 3px; height: auto"
              >
                <option selected>Mặc định</option>
                <option value="1">Giá tăng dần</option>
                <option value="2">Giá giảm dần</option>
                <option value="3">sale</option>
              </select>
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="row mt-5" style="padding-left: 2rem">
      <div class="col-3">
        <div class="card" style="width: 18rem; border-style: none">
          <img
            src="../images/ao_phong_boxy/DEVOTUS/black.webp"
            class="card-img-top"
            alt="..."
          />
          <div class="card-body">
            <h5 class="card-title text-center" style="font-size: 13px">
              Áo Phông DEVOTUS
            </h5>
            <p class="card-text fw-bold text-center" style="font-size: 14px">
              449,000₫
            </p>

            <div class="text-center" style="font-size: 5px">
              <a href="#" class="btn btn-outline-light">
                <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a
              >
              <a
                href="/t-shirt-luxury/san-pham-chi-tiet"
                class="btn btn-outline-light"
              >
                <i class="fa-solid fa-eye"></i>Xem chi tiết</a
              >
            </div>
          </div>
        </div>
      </div>

      <div class="col-3">
        <div class="card" style="width: 18rem; border-style: none">
          <img
            src="../images/ao_phong_boxy/HEAVEN/red.webp"
            class="card-img-top"
            alt="..."
          />
          <div class="card-body">
            <h5 class="card-title text-center" style="font-size: 13px">
              Áo Phông HEAVEN
            </h5>
            <p class="card-text fw-bold text-center" style="font-size: 14px">
              449,000₫
            </p>
            <div class="text-center" style="font-size: 5px">
              <a href="#" class="btn btn-outline-light">
                <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a
              >
              <a href="#" class="btn btn-outline-light">
                <i class="fa-solid fa-eye"></i>Xem chi tiết</a
              >
            </div>
          </div>
        </div>
      </div>

      <div class="col-3">
        <div class="card" style="width: 18rem; border-style: none">
          <img
            src="../images/ao_phong_oversize/BUNNY/gray.webp"
            class="card-img-top"
            alt="..."
          />
          <div class="card-body">
            <h5 class="card-title text-center" style="font-size: 13px">
              Áo Phông BUNNY
            </h5>
            <p class="card-text fw-bold text-center" style="font-size: 14px">
              449,000₫
            </p>
            <div class="text-center" style="font-size: 5px">
              <a href="#" class="btn btn-outline-light">
                <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a
              >
              <a href="#" class="btn btn-outline-light">
                <i class="fa-solid fa-eye"></i>Xem chi tiết</a
              >
            </div>
          </div>
        </div>
      </div>

      <div class="col-3">
        <div class="card" style="width: 18rem; border-style: none">
          <img
            src="../images/ao_phong_boxy/NO-END/black.webp"
            class="card-img-top"
            alt="..."
          />
          <div class="card-body">
            <h5 class="card-title text-center" style="font-size: 13px">
              Áo Phông NO-END
            </h5>
            <p class="card-text fw-bold text-center" style="font-size: 14px">
              489,000₫
            </p>
            <div class="text-center" style="font-size: 5px">
              <a href="#" class="btn btn-outline-light">
                <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a
              >
              <a href="#" class="btn btn-outline-light">
                <i class="fa-solid fa-eye"></i>Xem chi tiết</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="py-5">
      <div class="row">
        <div class="col-6 col-md-2 mb-3">
          <h5 style="font-size: 14px">VỀ CHÚNG TÔI</h5>
          <ul class="nav flex-column mt-4">
            <li class="nav-item mb-2">
              <h6 class="" style="font-size: 14px">
                Công ty TNHH T-Shirt LUXURY Việt Nam
              </h6>
            </li>
            <li class="nav-item mb-2">
              <h6 class="" style="font-size: 14px">Địa chỉ:</h6>
              Số 344 Cầu Giấy, Phường Dịch Vọng, Quận Cầu Giấy, Thành phố Hà Nội
            </li>

            <li class="nav-item mb-2">
              <h6 class="" style="font-size: 14px">Mã số doanh nghiệp:</h6>
              9999999999 do Sở kế hoạch và đầu tư thành phố Hà Nội cấp ngày
              17/09/2019
            </li>

            <li class="nav-item mb-2">
              <h6 class="" style="font-size: 14px">Điện thoại:</h6>
              0982.022.969
            </li>
            <li class="nav-item mb-2">
              <img
                src="https://krik.vn/img/bocongthuong.png"
                width="200px"
                alt=""
              />
            </li>
          </ul>
        </div>

        <div class="col-6 col-md-2 mb-3">
          <h5 style="font-size: 14px">CHÍNH SÁCH VÀ QUY ĐỊNH</h5>
          <ul class="nav flex-column mt-4">
            <li class="nav-item mb-2">
              <a
                href="#"
                class="text-dark"
                style="text-decoration: none; font-size: 15px"
                >Cách thức đặt hàng</a
              >
            </li>

            <li class="nav-item mb-2 mt-2">
              <a
                href="#"
                class="text-dark"
                style="text-decoration: none; font-size: 15px"
                >Chính sách thành viên</a
              >
            </li>

            <li class="nav-item mb-2 mt-2">
              <a
                href="#"
                class="text-dark"
                style="text-decoration: none; font-size: 15px"
                >Chính sách giao hàng</a
              >
            </li>

            <li class="nav-item mb-2 mt-2">
              <a
                href="#"
                class="text-dark"
                style="text-decoration: none; font-size: 15px"
                >Quy định đổi trả</a
              >
            </li>

            <li class="nav-item mb-2 mt-2">
              <a
                href="#"
                class="text-dark"
                style="text-decoration: none; font-size: 15px"
                >Hình thức thanh toán</a
              >
            </li>

            <li class="nav-item mb-2 mt-2">
              <a
                href="#"
                class="text-dark"
                style="text-decoration: none; font-size: 15px"
                >Chính sách bảo mật</a
              >
            </li>

            <li class="nav-item mb-2 mt-2">
              <a
                href="#"
                class="text-dark"
                style="text-decoration: none; font-size: 15px"
                >Chính sách xử lý khiếu nại</a
              >
            </li>

            <li class="nav-item mb-2 mt-2">
              <a
                href="#"
                class="text-dark"
                style="text-decoration: none; font-size: 15px"
                >Chính sách kiểm hàng</a
              >
            </li>
          </ul>
        </div>

        <div class="col-6 col-md-3 mb-3">
          <h5 style="font-size: 14px">HỆ THỐNG CỬA HÀNG</h5>
          <ul class="nav flex-column">
            <li class="nav-item mb-2">
              <h6 class="" style="font-size: 14px">
                <i class="fa-solid fa-caret-right"></i> CỬA HÀNG SỐ 99
              </h6>
              <p>168 Hoàng Văn Thụ, Phường Hoàng Văn Thụ, TP.Bắc Giang</p>
              <p>Tel: 0348.600.168</p>
            </li>

            <li class="nav-item mb-2">
              <h6 class="" style="font-size: 14px">
                <i class="fa-solid fa-caret-right"></i> CỬA HÀNG SỐ 88
              </h6>
              <p>
                1239 Giải Phóng, Phường Thịnh Liệt, Quận Hai Bà Trưng, TP Hà Nội
              </p>
              <p>Tel: 0375.88.1239</p>
            </li>
            <li class="nav-item mb-2">
              <h6 class="" style="font-size: 14px">
                <i class="fa-solid fa-caret-right"></i> XEM THÊM TOÀN BỘ CỬA
                HÀNG
              </h6>
            </li>
          </ul>
        </div>

        <div class="col-md-5 mb-3">
          <form>
            <h5>Subscribe to our newsletter</h5>
            <p>Monthly digest of what's new and exciting from us.</p>
            <div class="d-flex flex-column flex-sm-row w-100 gap-2">
              <label for="newsletter1" class="visually-hidden"
                >Email address</label
              >
              <input
                id="newsletter1"
                type="text"
                class="form-control"
                placeholder="Email address"
              />
              <button class="btn btn-primary" type="button">Subscribe</button>
            </div>
          </form>
        </div>
      </div>

      <div
        class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top"
      >
        <p>© 2024 T-Shirt LUXURY, Inc. All rights reserved.</p>
        <ul class="list-unstyled d-flex">
          <li class="ms-3">
            <a class="link-body-emphasis" href="#"
              ><svg class="bi" width="24" height="24">
                <use xlink:href="#twitter"></use></svg
            ></a>
          </li>
          <li class="ms-3">
            <a class="link-body-emphasis" href="#"
              ><svg class="bi" width="24" height="24">
                <use xlink:href="#instagram"></use></svg
            ></a>
          </li>
          <li class="ms-3">
            <a class="link-body-emphasis" href="#"
              ><svg class="bi" width="24" height="24">
                <use xlink:href="#facebook"></use></svg
            ></a>
          </li>
        </ul>
      </div>
    </footer>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
