<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../DanhMuc/gio-hang.jsp" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <%--
    <link rel="stylesheet" href="../css/sanPhamChiTiet.css" />
    --%>
    <link rel="stylesheet" href="../css/sanPhamChiTiet.css" />
    <link
      rel="shortcut icon"
      href="${pageContext.request.contextPath}/images/favicon.png"
      type="image/x-icon"
    />
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
    <script src="../js/sanPhamChiTiet.js"></script>
  </head>

  <style>
    .btn-group {
      gap: 12px;
    }

    .btn-group label {
      width: 40px;
      height: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }

    .btn-group input:checked + label {
      background-color: #ccc;
      /* Màu xanh khi chọn */
      color: white;
      border-color: #000;
    }
  </style>

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
          <a href="/t-shirt-luxury/trang-chu">
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

    <div class="modal" tabindex="-1" id="bangsize">
      <div class="modal-dialog">
        <div class="modal-content">
          <img src="/images/bangSize/bangsize.png" alt="" />
        </div>
      </div>
    </div>
    <div class="row" style="margin-top: 100px">
      <div class="col-1"></div>
      <div class="col-7">
        <div
          id="carouselExampleControls"
          class="carousel slide"
          data-bs-ride="carousel"
        >
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img
                src="../images/ao_phong_boxy/DEVOTUS/black.webp"
                class="d-block w-100"
                alt="..."
              />
            </div>
            <div class="carousel-item">
              <img
                src="../images/ao_phong_boxy/DEVOTUS/wash.webp"
                class="d-block w-100"
                alt="..."
              />
            </div>
            <div class="carousel-item">
              <img
                src="../images/ao_phong_boxy/DEVOTUS/white.webp"
                class="d-block w-100"
                alt="..."
              />
            </div>
          </div>
          <button
            class="carousel-control-prev"
            type="button"
            data-bs-target="#carouselExampleControls"
            data-bs-slide="prev"
            style="margin-top: 350px"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#carouselExampleControls"
            data-bs-slide="next"
            style="margin-top: 350px"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>

      <div class="col-4">
        <form action="/t-shirt-luxury/san-pham-chi-tiet/add-cart" method="post">
          <input
            type="text"
            value="${spDetail.id}"
            hidden="hidden"
            name="idSPDetail"
          />
          <h6>${itemDetail.tenSanPham}</h6>
          <p>Còn hàng</p>
          <hr />
          <div class="d-flex flex-column gap-3">
            <h6>419,000Đ đ</h6>
            <div>
              <div class="d-flex gap-2 align-items-center">
                <h6 class="mb-0 text-uppercase">Màu sắc</h6>
              </div>

              <div class="btn-group">
                <input
                  type="radio"
                  class="btn-check"
                  name="color"
                  id="whiteC"
                  autocomplete="off"
                  checked
                />
                <label
                  for="whiteC"
                  style="width: 30px; height: 30px"
                  class="btn btn-default rounded-circle "
                ></label>

                <input
                  type="radio"
                  class="btn-check"
                  name="color"
                  id="redC"
                  autocomplete="off"
                />
                <label
                  for="redC"
                  style="width: 30px; height: 30px; background-color: red"
                  class="btn btn-default rounded-circle "
                ></label>
              </div>
            </div>
            <div>
              <div class="d-flex gap-2 align-items-center">
                <h6 class="mb-0 text-uppercase">Kích thước</h6>
                <p
                  href=""
                  class="mb-0 pe-auto"
                  data-bs-toggle="modal"
                  data-bs-target="#bangsize"
                  style="color: black; text-decoration: none"
                >
                  Hướng dẫn chọn size
                </p>
              </div>

              <div class="btn-group">
                <input
                  type="radio"
                  class="btn-check"
                  name="size"
                  id="sizeS"
                  autocomplete="off"
                  checked
                />
                <label class="btn btn-default" for="sizeS">S</label>

                <input
                  type="radio"
                  class="btn-check"
                  name="size"
                  id="sizeM"
                  autocomplete="off"
                />
                <label class="btn btn-default" for="sizeM">M</label>

                <input
                  type="radio"
                  class="btn-check"
                  name="size"
                  id="sizeL"
                  autocomplete="off"
                />
                <label class="btn btn-default" for="sizeL">L</label>

                <input
                  type="radio"
                  class="btn-check"
                  name="size"
                  id="sizeXL"
                  autocomplete="off"
                />
                <label class="btn btn-default" for="sizeXL">XL</label>

                <input
                  type="radio"
                  class="btn-check"
                  name="size"
                  id="sizeXXL"
                  autocomplete="off"
                />
                <label class="btn btn-default" for="sizeXXL">XXL</label>
              </div>
            </div>

            <div class="input-group" style="width: 120px">
              <button
                class="btn btn-outline-secondary"
                type="button"
                id="decrease"
              >
                -
              </button>
              <input
                type="text"
                class="form-control text-center"
                value="1"
                id="quantity"
                readonly
              />
              <button
                class="btn btn-outline-secondary"
                type="button"
                id="increase"
              >
                +
              </button>
            </div>
          </div>

          <!-- <h6>${giaFormatted}</h6>
            
            <div class="color">
                <h6>MÀU SẮC</h6>
                
                <div class="d-flex gap-2">
                    <c:forEach var="ms" items="${}">
                        <input type="radio" class="btn" name="mauSac" value="${ms.id}">
                        
                    </c:forEach>
                </div>
            </div>
            <hr> -->

          <!-- <div class="size" style="margin-top: 5px;">
                <div class="row">
                    <div class="col-4">
                        <h6>KÍCH THƯỚC</h6>
                    </div>
                    <div class="col-6">
                        <a href="" data-bs-toggle="modal" data-bs-target="#bangsize" style="color: black;text-decoration: none">Hướng dẫn
                            chọn size</a>
                    </div>
                </div>
                <div class="d-flex gap-2">
                    <c:forEach var="s" items="${size}">
                        <input type="radio" class="btn" name="size" value="${s.id}">
                        <span>${s.tenSize}</span>
                    </c:forEach>
                </div>
            </div> -->

          <!-- <div class="soLuong" style="margin-top: 10px;">
                <div class="counter">
                    <button type="button" class="btn" id="decrease"><b>-</b></button>
                    <input type="number" id="number" value="1" min="1" style="width: 50px; text-align: center;"
                           name="soLuong">
                    <button type="button" class="btn" id="increase"><b>+</b></button>
                </div>
            </div> -->

          <!-- <span style="color:red">
                ${errorMessage}
            </span> -->
          <!-- <div class="order" style="margin-top: 20px;">
            <div class="size" style="margin-top: 5px;">
                <div class="row">
                    <div class="col-4">
                        <h6>KÍCH THƯỚC</h6>
                    </div>
                    <div class="col-6">
                        <a href="" data-bs-toggle="modal" data-bs-target="#bangsize" style="color: black;">hướng dẫn
                            chọn size</a>
                    </div>
                </div>
                <div class="d-flex gap-2">
                    <c:forEach var="s" items="${size}">
                        <input type="radio" class="btn" name="size" value="${s.id}">
                        <span>${s.tenSize}</span>
                    </c:forEach>
                </div>
            </div> -->
          <!-- <div class="soLuong" style="margin-top: 10px;">
                <div class="counter">
                    <button type="button" class="btn" id="decrease"><b>-</b></button>
                    <input type="number" id="number" value="1" min="1" style="width: 50px; text-align: center;" name="soLuong">
                    <button type="button" class="btn" id="increase"><b>+</b></button>
                </div>
            </div> -->
          <div class="order" style="margin-top: 20px">
            <button type="submit" class="btn btn-dark" style="width: 185px">
              THÊM VÀO GIỎ HÀNG
            </button>
            <!-- <button type="submit" class="btn btn-dark">THÊM VÀO GIỎ HÀNG</button> -->

            <a href="#" class="btn btn-dark" style="margin-left: 5px"
              >MUA NGAY</a
            >
          </div>

          <!-- Thuộc Tính Sản Phẩm  -->
          <div class="accordion" id="accordionExample" style="margin-top: 20px">
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button
                  class="accordion-button"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseOne"
                  aria-expanded="true"
                  aria-controls="collapseOne"
                >
                  THUỘC TÍNH SẢN PHẨM
                </button>
              </h2>
              <div
                id="collapseOne"
                class="accordion-collapse collapse show"
                aria-labelledby="headingOne"
                data-bs-parent="#accordionExample"
              >
                <div class="accordion-body">
                  <P>Chất liệu: 90% Polyester, 9% Rayon, 1% Spandex</P>
                  <P
                    >►Vải Polyester chống nhăn hiệu quả, giữ nhiệt tốt, độ bền
                    cao</P
                  >
                  <P>►Vải Rayon thoáng mát, mềm mại</P>
                  <P
                    >Kiểu dáng:
                    <br />
                    ►Form Classic rộng thoáng, dễ mặc tạo sự thoải mái tối đa
                  </P>
                  <P>
                    Chi tiết:
                    <br />
                    ►Chất liệu có sự kết hợp của vải Rayon an toàn cho da,
                    thoáng khí, hút ẩm tốt và đặc biệt là ít nhăn và có độ bền
                    cao
                  </P>
                  <p>►Thiết kế cổ tròn basic hài hòa, dễ chịu</p>
                  <p>►Áo bo gấu nhẹ nhàng tạo sự gọn gàng, thoải mái</p>
                  <p>
                    ►Áo với hoạ tiết kẻ sọc năng động, dễ dàng đa dạng phong
                    cách
                  </p>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingTwo">
                <button
                  class="accordion-button collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseTwo"
                  aria-expanded="false"
                  aria-controls="collapseTwo"
                >
                  CHÍNH SÁCH SẢN PHẨM
                </button>
              </h2>
              <div
                id="collapseTwo"
                class="accordion-collapse collapse"
                aria-labelledby="headingTwo"
                data-bs-parent="#accordionExample"
              >
                <div class="accordion-body">
                  <p>►Đổi hàng trong vòng 15 ngày.</p>
                  <p>
                    ►Giảm đến 15% trên tổng hóa đơn khi mua hàng ( tại cửa hàng
                    ) vào tháng sinh nhật.
                  </p>
                  <p>
                    ►Giao hàng nội thành Hà Nội chỉ từ 15.000đ trong vòng 24
                    giờ.
                  </p>
                  <p>
                    ►Tích điểm 3-8% giá trị đơn hàng cho mỗi lần mua và trừ tiền
                    vào lần mua tiếp theo.
                  </p>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button
                  class="accordion-button collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseThree"
                  aria-expanded="false"
                  aria-controls="collapseThree"
                >
                  HƯỚNG DẪN BẢO QUẢN
                </button>
              </h2>
              <div
                id="collapseThree"
                class="accordion-collapse collapse"
                aria-labelledby="headingThree"
                data-bs-parent="#accordionExample"
              >
                <div class="accordion-body">
                  <p>
                    ►Có thể giặt tay hay giặt máy đều được (ưu tiên giặt tay để
                    tăng tuổi thọ của sản phẩm)
                  </p>
                  <p>
                    ►Lộn trái sản phẩm khi giặt, không giặt chung sản phẩm trắng
                    với quần áo tối màu.
                  </p>
                  <p>
                    ►Sử dụng xà phòng trung tính,không sử dụng xà phòng có chất
                    tẩy mạnh.
                  </p>
                  <p>►Không sử dụng chất tẩy, không ngâm sản phẩm.</p>
                  <p>
                    ►Hạn chế sấy ở nhiệt độ cao, bảo quản nơi khô ráo, thoáng
                    mát, không phơi trực tiếp dưới ánh nắng mặt trời.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="comment" style="margin-top: 100px">
      <p style="margin-left: 80px"><b>0 bình luận</b></p>
      <div
        class="cmt"
        style="display: flex; align-items: center; gap: 10px; margin: 20px"
      >
        <!-- Hình ảnh đại diện -->
        <img
          src="/images/linhtinh/avt.jpg"
          alt="Avatar"
          style="width: 50px; height: 50px; margin-top: 0"
        />

        <!-- Dòng nhập liệu với chiều rộng lớn hơn (gấp đôi) -->
        <input
          type="text"
          placeholder="Nhập nội dung tại đây"
          style="flex-grow: 1; width: 400px; padding: 10px"
        />
      </div>
      <div>
        <a class="btn btn-primary" type="button" style="margin-left: 80px"
          >Gửi</a
        >
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/productForYou.jsp" />

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
  <script>
    $(document).ready(function () {
      $("form").submit(function (e) {
        let isValid = true;
        let errorMessage = "";

        // Kiểm tra màu sắc
        if ($('input[name="mauSac"]:checked').length === 0) {
          isValid = false;
          errorMessage += "Vui lòng chọn màu sắc!\n";
        }

        // Kiểm tra kích thước
        if ($('input[name="size"]:checked').length === 0) {
          isValid = false;
          errorMessage += "Vui lòng chọn kích thước!\n";
        }

        // Hiển thị lỗi nếu không hợp lệ
        if (!isValid) {
          alert(errorMessage);
          e.preventDefault(); // Ngăn form submit
        }
      });
    });

    document.getElementById("decrease").addEventListener("click", function () {
      let qty = document.getElementById("quantity");
      let value = parseInt(qty.value);
      if (value > 1) qty.value = value - 1;
    });

    document.getElementById("increase").addEventListener("click", function () {
      let qty = document.getElementById("quantity");
      qty.value = parseInt(qty.value) + 1;
    });
  </script>
</html>
