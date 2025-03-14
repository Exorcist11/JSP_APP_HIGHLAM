<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <a href="/t-shirt-luxury/trang-chu">
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
        <a href="/t-shirt-luxury/login">
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
  <div class="header-popup" style="box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1)">
    <div class="logo-header-popup">
      <a href="/t-shirt-luxury/trang-chu">
        <img src="../images/logo.png" alt="" />
      </a>
    </div>
    <ul class="menu-popup">
      <li class="item-danh-muc">
        <a href="/t-shirt-luxury/ao-nam" class="name-danh-muc-popup">Áo Nam </a>
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
        <a href="/t-shirt-luxury/ao-nam" class="ten-danh-muc hover-change-color"
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
        <a href="#" class="name-type hover-change-color">Áo phông cổ chữ V</a>
      </li>

      <li>
        <a href="#" class="name-type hover-change-color">Áo phông cổ tròn</a>
      </li>

      <li>
        <a href="#" class="name-type hover-change-color">Áo phông Oversize</a>
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
