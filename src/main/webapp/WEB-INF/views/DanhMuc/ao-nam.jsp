<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="gio-hang.jsp" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Áo Nam</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
    <link href="../css/danhMucAoNam.css" rel="stylesheet" />
  </head>
  <body>
    <header>
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
              <!--mở Drawer giỏ hàng -->
              <a
                href="#"
                data-bs-toggle="offcanvas"
                data-bs-target="#cartDrawer"
                aria-controls="cartDrawer"
              >
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
              <a href="/t-shirt-luxury/ao-nam" class="name-danh-muc-popup"
                >Áo Nam
              </a>
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
                id="3"
                placeholder="Tìm kiếm"
              />
            </form>
            <a href="#">
              <i class="fa-regular fa-user ps-5"></i>
            </a>
            <a href="#">
              <i class="fa-regular fa-heart ps-5"></i>
            </a>
            <a
              href="#"
              data-bs-toggle="offcanvas"
              data-bs-target="#cartDrawer"
              aria-controls="cartDrawer"
            >
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
              <a
                href="/t-shirt-luxury/ao-nam"
                class="ten-danh-muc hover-change-color"
                >Áo Nam
              </a>
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
              <a href="#" class="name-type hover-change-color"
                >Áo phông Unisex</a
              >
            </li>
            <ul class="login-and-signin">
              <i class="fa-regular fa-user pe-3"></i>
              <li class="button-login pe-3">
                <a
                  href="/login"
                  class="ten-danh-muc hover-change-color"
                  >ĐĂNG NHẬP</a
                >
              </li>
              <li class="button-sign-in">
                <a
                  href="/register"
                  class="ten-danh-muc hover-change-color"
                  >ĐĂNG KÝ</a
                >
              </li>
            </ul>
          </ul>
        </div>
      </div>
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

      <nav class="navbar navbar-expand-lg">
        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
          <h4 class="mt-text">Bộ Lọc</h4>
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <button
                class="btn btn-light dropdown-toggle"
                href="#"
                id="navbarDarkDropdownMenuLink"
                role="button"
                aria-expanded="false"
              >
                Màu Sắc
              </button>
              <ul
                class="dropdown-menu p-3"
                aria-labelledby="dropdownMenuButton1"
              >
                <div class="d-flex flex-wrap">
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorRed"
                    />
                    <div class="color-box" style="background-color: red"></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorBrown"
                    />
                    <div
                      class="color-box"
                      style="background-color: brown"
                    ></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorPink"
                    />
                    <div class="color-box" style="background-color: pink"></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorBlack"
                    />
                    <div
                      class="color-box"
                      style="background-color: black"
                    ></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorBlue"
                    />
                    <div class="color-box" style="background-color: blue"></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorYellow"
                    />
                    <div
                      class="color-box"
                      style="background-color: yellow"
                    ></div>
                  </label>
                </div>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <button
                class="btn btn-light dropdown-toggle"
                href="#"
                id="2"
                role="button"
                aria-expanded="false"
              >
                Kích Cỡ
              </button>
              <ul
                class="dropdown-menu p-3"
                aria-labelledby="dropdownMenuButton2"
              >
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="sizeS"
                  />
                  <label class="form-check-label" for="sizeS">S</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="sizeM"
                  />
                  <label class="form-check-label" for="sizeM">M</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="sizeL"
                  />
                  <label class="form-check-label" for="sizeL">L</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="sizeXL"
                  />
                  <label class="form-check-label" for="sizeXL">XL</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="size2XL"
                  />
                  <label class="form-check-label" for="size2XL">2XL</label>
                </div>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <button
                class="btn btn-light dropdown-toggle"
                href="#"
                id="1"
                role="button"
                aria-expanded="false"
              >
                Khoảng Giá
              </button>
              <ul
                class="dropdown-menu p-3"
                aria-labelledby="dropdownMenuButton3"
              >
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="price1"
                  />
                  <label class="form-check-label" for="price1"
                    >Dưới 200,000</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="price2"
                  />
                  <label class="form-check-label" for="price2"
                    >Từ 200,000 - 500,000</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="price3"
                  />
                  <label class="form-check-label" for="price3"
                    >Từ 500,000 - 1,000,000</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="price4"
                  />
                  <label class="form-check-label" for="price4"
                    >Trên 1,000,000</label
                  >
                </div>
              </ul>
            </li>
          </ul>

          <div class="sort-container">
            <span class="sort-label">Sắp xếp theo:</span>
            <select
              class="form-select dropdown"
              aria-label="Default select example"
            >
              <option
                class="btn btn-secondary dropdown-toggle"
                type="button"
                id="dropdownMenuButton"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                selected
              >
                Mới nhất
              </option>
              <option class="dropdown-item" href="#" value="1">Mới nhất</option>
              <option class="dropdown-item" href="#" value="2">
                Giá giảm dần
              </option>
              <option class="dropdown-item" href="#" value="3">
                Giá tăng dần
              </option>
            </select>
          </div>
        </div>
      </nav>

      <div class="row">
        <div class="col-md-3">
          <div class="card product-card">
            <img
              alt="Anh1"
              src="../images/ao_phong_boxy/DEVOTUS/black.webp"
              width="600"
            />
            <div class="product-info">
              <div class="colors">
                <img
                  alt="option 1"
                  height="20"
                  src="../images/ao_phong_boxy/DEVOTUS/black.webp"
                  width="20"
                />
              </div>
              <p>Áo Phông Regular 1307</p>
              <p class="price">249,000₫</p>
            </div>
            <div class="product-actions">
              <button class="btn btn-dark">
                <i class="fas fa-shopping-cart"></i> Mua nhanh
              </button>
              <a
                href="/t-shirt-luxury/san-pham-chi-tiet"
                class="btn btn-outline-dark"
                ><i class="fas fa-eye"></i> Xem chi tiết</a
              >
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img
              alt="Anh2"
              src="../images/ao_phong_unisex/1969/black.webp"
              width="600"
            />
            <div class="product-info">
              <div class="colors">
                <img
                  alt="option 2"
                  height="20"
                  src="../images/ao_phong_unisex/1969/black.webp"
                  width="20"
                />
              </div>
              <p>Áo Nỉ Classic 4114</p>
              <p class="price">419,000₫</p>
            </div>
            <div class="product-actions">
              <button class="btn btn-dark">
                <i class="fas fa-shopping-cart"></i> Mua nhanh
              </button>
              <button class="btn btn-outline-dark">
                <i class="fas fa-eye"></i> Xem chi tiết
              </button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img
              alt="Anh3"
              src="../images/ao_phong_unisex/1969/white.webp"
              width="600"
            />
            <div class="product-info">
              <div class="colors">
                <img
                  alt=" option 3"
                  height="20"
                  src="../images/ao_phong_unisex/Airplane/white.webp"
                  width="20"
                />
              </div>
              <p>Áo Phông Fitted 1298</p>
              <p class="price">249,000₫</p>
            </div>
            <div class="product-actions">
              <button class="btn btn-dark">
                <i class="fas fa-shopping-cart"></i> Mua nhanh
              </button>
              <button class="btn btn-outline-dark">
                <i class="fas fa-eye"></i> Xem chi tiết
              </button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img
              alt="Anh4"
              src="../images/ao_phong_unisex/BACISTEE/green.webp"
              width="600"
            />
            <div class="product-info">
              <div class="colors">
                <img
                  alt=" option 4"
                  height="20"
                  src="../images/ao_phong_unisex/BACISTEE/green.webp"
                  width="20"
                />
              </div>
              <p>Áo Khoác Kaki Regular 5106</p>
              <p class="price">639,000₫</p>
            </div>
            <div class="product-actions">
              <button class="btn btn-dark">
                <i class="fas fa-shopping-cart"></i> Mua nhanh
              </button>
              <button class="btn btn-outline-dark">
                <i class="fas fa-eye"></i> Xem chi tiết
              </button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img
              alt="Anh5"
              src="../images/ao_phong_unisex/SMILE/black.webp"
              width="600"
            />
            <div class="product-info">
              <div class="colors">
                <img
                  alt=" option 5"
                  height="20"
                  src="../images/ao_phong_unisex/SMILE/black.webp"
                  width="20"
                />
              </div>
              <p>Áo Khoác Kaki Regular 5106</p>
              <p class="price">639,000₫</p>
            </div>
            <div class="product-actions">
              <button class="btn btn-dark">
                <i class="fas fa-shopping-cart"></i> Mua nhanh
              </button>
              <button class="btn btn-outline-dark">
                <i class="fas fa-eye"></i> Xem chi tiết
              </button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img
              alt="Anh6"
              src="../images/ao_phong_unisex/LABUBU/black.webp"
              width="600"
            />
            <div class="product-info">
              <div class="colors">
                <img
                  alt="option 6"
                  height="20"
                  src="../images/ao_phong_unisex/LABUBU/black.webp"
                  width="20"
                />
              </div>
              <p>Áo Khoác Kaki Regular 5106</p>
              <p class="price">639,000₫</p>
            </div>
            <div class="product-actions">
              <button class="btn btn-dark">
                <i class="fas fa-shopping-cart"></i> Mua nhanh
              </button>
              <button class="btn btn-outline-dark">
                <i class="fas fa-eye"></i> Xem chi tiết
              </button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img
              alt="Anh7"
              src="../images/ao_phong_co_tron/LADOS/blueMin.webp"
              width="600"
            />
            <div class="product-info">
              <div class="colors">
                <img
                  alt="option 7"
                  height="20"
                  src="../images/ao_phong_co_tron/LADOS/blueMin.webp"
                  width="20"
                />
              </div>
              <p>Áo Khoác Kaki Regular 5106</p>
              <p class="price">639,000₫</p>
            </div>
            <div class="product-actions">
              <button class="btn btn-dark">
                <i class="fas fa-shopping-cart"></i> Mua nhanh
              </button>
              <button class="btn btn-outline-dark">
                <i class="fas fa-eye"></i> Xem chi tiết
              </button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img
              alt="Anh8"
              src="../images/ao_phong_co_tron/S2SPORT/crem.webp"
              width="600"
            />
            <div class="product-info">
              <div class="colors">
                <img
                  alt="option 8"
                  height="20"
                  src="../images/ao_phong_co_tron/S2SPORT/crem.webp"
                  width="20"
                />
              </div>
              <p>Áo Khoác Kaki Regular 5106</p>
              <p class="price">639,000₫</p>
            </div>
            <div class="product-actions">
              <button class="btn btn-dark">
                <i class="fas fa-shopping-cart"></i> Mua nhanh
              </button>
              <button class="btn btn-outline-dark">
                <i class="fas fa-eye"></i> Xem chi tiết
              </button>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card product-card">
            <img
              alt="Anh9"
              src="../images/ao_phong_unisex/Airplane/black.webp"
              width="600"
            />
            <div class="product-info">
              <div class="colors">
                <img
                  alt="option 9"
                  height="20"
                  src="../images/ao_phong_unisex/Airplane/black.webp"
                  width="20"
                />
              </div>
              <p>Áo Khoác Kaki Regular 5106</p>
              <p class="price">639,000₫</p>
            </div>
            <div class="product-actions">
              <button class="btn btn-dark">
                <i class="fas fa-shopping-cart"></i> Mua nhanh
              </button>
              <button class="btn btn-outline-dark">
                <i class="fas fa-eye"></i> Xem chi tiết
              </button>
            </div>
          </div>
        </div>
      </div>

      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>

      <div class="row mt-5" style="padding-left: 2rem">
        <img
          src="https://pos.nvncdn.com/be3159-662/bn/20240921_h3xCoY0r.gif"
          alt=""
        />
      </div>
    </div>

    <footer class="container py-5">
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
            <a class="link-body-emphasis" href="#">
              <svg class="bi" width="24" height="24">
                <use xlink:href="#twitter"></use>
              </svg>
            </a>
          </li>
          <li class="ms-3">
            <a class="link-body-emphasis" href="#">
              <svg class="bi" width="24" height="24">
                <use xlink:href="#instagram"></use>
              </svg>
            </a>
          </li>
          <li class="ms-3">
            <a class="link-body-emphasis" href="#">
              <svg class="bi" width="24" height="24">
                <use xlink:href="#facebook"></use>
              </svg>
            </a>
          </li>
        </ul>
      </div>
    </footer>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
  </body>
</html>
