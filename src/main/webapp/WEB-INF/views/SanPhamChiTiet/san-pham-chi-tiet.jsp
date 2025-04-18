<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

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
      color: black;
    }

    .btn-group input:checked + label {
      /* Màu xanh khi chọn */

      border: 2px solid black;
    }
  </style>

  <body>
    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

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
            <c:forEach var="imageUrl" items="${images}" varStatus="status">
              <div class="carousel-item ${status.first ? 'active' : ''}">
                <img
                  src="${imageUrl}"
                  class="d-block w-100"
                  alt="Product Image"
                />
              </div>
            </c:forEach>
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
        <h6 id="productName">${product.name}</h6>
        <p>Còn hàng</p>
        <input type="text" hidden id="productId" value="${product.id}" />

        <hr />
        <div class="d-flex flex-column gap-3">
          <h6 id="price">
            <fmt:formatNumber
              value="${product.price}"
              groupingUsed="true"
              maxFractionDigits="0"
            />
            VND
          </h6>

          <div>
            <div class="d-flex gap-2 align-items-center">
              <h6 class="mb-0 text-uppercase">Màu sắc</h6>
            </div>

            <div class="btn-group">
              <c:forEach items="${colors}" var="item">
                <input
                  type="radio"
                  class="btn-check"
                  name="color"
                  id="color_${item.id}"
                  value="${item.id}"
                  autocomplete="off"
                  data-name="${item.name}"
                  checked
                />

                <label
                  for="color_${item.id}"
                  style="width: 30px; height: 30px; background-color: ${item.hexColor};"
                  class="btn btn-default rounded-circle"
                ></label>
              </c:forEach>
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
              <c:forEach items="${sizes}" var="item">
                <input type="radio" class="btn-check" name="size"
                id="size_${item.id}" autocomplete="off" ${loop.first ? 'checked'
                : ''} value="${item.id}" data-name="${item.name}" />
                <label class="btn btn-default" for="size_${item.id}"
                  >${item.name}</label
                >
              </c:forEach>
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

        <div class="order" style="margin-top: 20px">
          <form method="POST" action="/cart/add" class="d-inline">
            <input type="hidden" name="productID" value="${product.id}" />
            <input type="hidden" name="colorID" id="selectedColorId" />
            <input type="hidden" name="sizeID" id="selectedSizeId" />
            <input
              type="hidden"
              name="quantity"
              id="selectedQuantity"
              value="1"
            />
            <button type="submit" class="btn btn-dark" style="width: 185px">
              THÊM VÀO GIỎ HÀNG
            </button>
          </form>
          <!-- <button type="submit" class="btn btn-dark">THÊM VÀO GIỎ HÀNG</button> -->

          <a class="btn btn-dark" id="buyNow" style="margin-left: 5px"
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
                  ►Chất liệu có sự kết hợp của vải Rayon an toàn cho da, thoáng
                  khí, hút ẩm tốt và đặc biệt là ít nhăn và có độ bền cao
                </P>
                <p>►Thiết kế cổ tròn basic hài hòa, dễ chịu</p>
                <p>►Áo bo gấu nhẹ nhàng tạo sự gọn gàng, thoải mái</p>
                <p>
                  ►Áo với hoạ tiết kẻ sọc năng động, dễ dàng đa dạng phong cách
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
                  ►Giảm đến 15% trên tổng hóa đơn khi mua hàng ( tại cửa hàng )
                  vào tháng sinh nhật.
                </p>
                <p>
                  ►Giao hàng nội thành Hà Nội chỉ từ 15.000đ trong vòng 24 giờ.
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
                  ►Hạn chế sấy ở nhiệt độ cao, bảo quản nơi khô ráo, thoáng mát,
                  không phơi trực tiếp dưới ánh nắng mặt trời.
                </p>
              </div>
            </div>
          </div>
        </div>
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
      // Gán giá trị mặc định cho selectedSizeId và selectedColorId khi trang tải
      const defaultSizeId = $('input[name="size"]:checked').val();
      const defaultColorId = $('input[name="color"]:checked').val();
      $("#selectedSizeId").val(defaultSizeId);
      $("#selectedColorId").val(defaultColorId);

      // Cập nhật colorId khi chọn màu
      $('input[name="color"]').change(function () {
        $("#selectedColorId").val($(this).val());
      });

      // Cập nhật sizeId khi chọn kích thước
      $('input[name="size"]').change(function () {
        const selectedSizeId = $(this).val();
        console.log("Selected Size ID:", selectedSizeId);
        $("#selectedSizeId").val(selectedSizeId);
      });

      // Cập nhật quantity khi nhấn tăng/giảm
      $("#increase").click(function () {
        let qty = parseInt($("#quantity").val());
        $("#quantity").val(qty + 1);
        $("#selectedQuantity").val(qty + 1);
      });

      $("#decrease").click(function () {
        let qty = parseInt($("#quantity").val());
        if (qty > 1) {
          $("#quantity").val(qty - 1);
          $("#selectedQuantity").val(qty - 1);
        }
      });

      // Kiểm tra trước khi submit form
      $('form[action="/cart/add"]').submit(function (e) {
        const sizeId = $("#selectedSizeId").val();
        console.log("Size ID before submit:", sizeId);
        if (!sizeId) {
          e.preventDefault();
          alert("Vui lòng chọn kích thước!");
        }
      });
    });
  </script>

  <!-- <script src="../js/productDetail.js"></script> -->
</html>
