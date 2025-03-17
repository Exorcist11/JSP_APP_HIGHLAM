<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<header>
  <div class="wrapper">
    <img
      class="banner-top"
      src="../images/banner/banner1.jpg"
      alt="T-shirt Luxury"
    />
    <div class="side-bar">
      <div class="header-popup" style="justify-content: center">
        <div class="logo-header-popup">
          <a href="#">
            <img src="../images/logo.png" alt="" />
          </a>
        </div>
        <ul class="menu-popup">
          <li class="item-danh-muc">
            <a href="/ao-nam" class="name-danh-muc-popup">Áo Nam </a>
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
          <a
            href="#"
            data-bs-toggle="offcanvas"
            data-bs-target="#cartDrawer"
            aria-controls="cartDrawer"
          >
            <i class="fa-solid fa-cart-shopping ps-5 pe-3"></i>
          </a>
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
            <img src="../images/ao_phong_unisex/LABUBU/pink.webp" alt="" />
            <img src="../images/ao_phong_oversize/DREW/brow.webp" alt="" />
            <img
              src="../images/ao_phong_polo/LazyCityCycle/black.webp"
              alt=""
            />
          </ul>
        </div>
      </div>

      <div class="danh-muc">
        <ul>
          <li class="item-danh-muc">
            <a href="/ao-nam" class="ten-danh-muc hover-change-color"
              >Áo Nam
            </a>
          </li>
          <li class="item-danh-muc">
            <a href="#" class="ten-danh-muc hover-change-color">Quần Nam</a>
          </li>
          <li>
            <a href="#" class="ten-danh-muc hover-change-color">Phụ kiện</a>
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
            <i class="fa-regular fa-user"></i>
            <li class="button-login">
              <a href="/login" class="ten-danh-muc hover-change-color"
                >ĐĂNG NHẬP</a
              >
            </li>
            <li class="button-sign-in">
              <a href="/register" class="ten-danh-muc hover-change-color"
                >ĐĂNG KÝ</a
              >
            </li>
          </ul>
        </ul>
      </div>
      <div class="logo-header">
        <a href="#">
          <img src="../images/logo.png" alt="" />
        </a>
      </div>
      <div class="search-favourite-cart">
        <form action="" class="form-search">
          <i class="fa-solid fa-magnifying-glass"></i>
          <input
            class="input-search"
            type="text"
            name=""
            id=""
            placeholder="Tìm kiếm"
          />
        </form>

        <a th:unless="${session.loggedInUser != null}" href="/login">
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
    </div>
  </div>
</header>
