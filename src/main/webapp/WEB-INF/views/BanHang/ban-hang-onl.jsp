<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Thanh toán đơn hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <style>
          .quantity-btn {
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ddd;
            background: #f8f9fa;
            cursor: pointer;
          }

          .quantity-control {
            display: flex;
            align-items: flex-start;
            gap: 10px;
          }

          .mt-90 {
            margin-top: 90px;
          }

          .cart-item {
            border-bottom: 1px solid #eee;
            padding: 15px 0;
          }

          .cart-summary {
            background-color: #f7f7f7;
            padding: 20px;
            border-radius: 5px;
          }

          .btn-checkout {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #000;
            color: #fff;
            border: none;
          }

          .quantity-input {
            width: 50px;
            text-align: center;
            margin: 0 10px;
          }

          .img-product {
            max-height: 150px;
            object-position: center;
            object-fit: cover;
          }
        </style>
      </head>

      <body class="container mt-90">
        <jsp:include page="/WEB-INF/views/fragments/header.jsp" />
        <form method="post" action="/cart/checkout">
          <div class="row">
            <div class="col-6 ">
              <a href="/cart" style="text-decoration: none">Giỏ hàng > </a> Thanh
              toán
              <div class="TTGH mt-2">
                <h5>Thông tin giao hàng</h5>
                <div class="mb-3">
                  <input style="width: 600px; height: 50px" class="form-control me-2" placeholder="Họ và tên"
                    name="recipientName" required />
                </div>
                <div class="mb-3">
                  <input style="width: 600px; height: 50px" class="form-control me-2" placeholder="Email"
                    name="guestEmail" required />
                </div>
                <div class="mb-3">
                  <input style="width: 600px; height: 50px" class="form-control me-2" placeholder="Số điện thoại"
                    name="recipientPhone" required />
                </div>

                <!-- Chọn địa chỉ -->
                <div class="mb-3">
                  <select id="province" name="province" class="form-select mb-2" style="width: 600px; height: 50px"
                    required>
                    <option value="">Chọn Tỉnh/Thành phố</option>
                  </select>
                </div>
                <div class="mb-3">
                  <select id="district" name="district" class="form-select mb-2" style="width: 600px; height: 50px"
                    required disabled>
                    <option value="">Chọn Quận/Huyện</option>
                  </select>
                </div>
                <div class="mb-3">
                  <select id="ward" name="ward" class="form-select mb-2" style="width: 600px; height: 50px" required
                    disabled>
                    <option value="">Chọn Phường/Xã</option>
                  </select>
                </div>
                <div class="mb-3">
                  <input style="width: 600px; height: 50px" class="form-control me-2" placeholder="Số nhà, tên đường"
                    name="addressDetail" required />
                </div>
                <input type="hidden" id="fullAddress" name="recipientAddress" />

                <div class="mb-3">
                  <textarea style="width: 600px; height: 100px" class="form-control me-2" placeholder="Ghi chú"
                    name="note"></textarea>
                </div>
              </div>
              <div>
                <h5 class="fw-normal">Phương thức thanh toán</h5>
                <div class="d-flex">
                  <input type="radio" id="cod" value="1" checked name="trangThai" />
                  <label for="cod" style="margin-left: 10px; cursor: pointer">
                    Thanh toán khi nhận hàng (COD)
                  </label>
                </div>
                <div class="d-flex">
                  <input type="radio" id="online" value="2" name="trangThai" />
                  <label for="online" style="margin-left: 10px; cursor: pointer">
                    Thanh toán trực tuyến
                  </label>
                </div>
              </div>
            </div>

            <div class="col-6" style="background-color: rgb(247, 247, 247)">
              <c:if test="${not empty cartItems}">
                <c:forEach var="item" items="${cartItems}">
                  <div class="cart-item row">
                    <div class="col-md-3">
                      <img src="${item.imageUrl}" alt="${item.productName}" width="150px" height="150px"
                        class="img-product">
                    </div>
                    <div class="col-md-5">
                      <h6>${item.productName}</h6>
                      <p>Màu: ${item.colorName} | Size: ${item.sizeName}</p>
                      <p>
                        <fmt:formatNumber value="${item.price}" groupingUsed="true" maxFractionDigits="0" />₫
                      </p>
                    </div>
                    <div class="col-md-2 quantity-control">
                      <span class="quantity-btn minus">-</span>
                      <span>${item.quantity}</span>
                      <span class="quantity-btn plus">+</span>
                    </div>
                    <div class="col-md-2 text-end">
                      <p>
                        <fmt:formatNumber value="${item.price * item.quantity}" groupingUsed="true"
                          maxFractionDigits="0" />₫
                      </p>
                      <button class="btn btn-sm btn-link text-danger remove-btn">Xóa</button>
                    </div>
                  </div>
                </c:forEach>
              </c:if>
              <c:if test="${empty cartItems}">
                <p>Giỏ hàng trống!</p>
              </c:if>

              <hr />
              <h6 class="fw-normal">Phí vận chuyển: 35,000₫</h6>
              <hr />
              <div class="d-flex justify-content-between">
                <h5 class="fw-normal">Tổng cộng:</h5>
                <p id="total-price">
                  VND <strong>
                    <fmt:formatNumber value="${totalPrice}" groupingUsed="true" maxFractionDigits="0" />₫
                  </strong>
                </p>
              </div>
              <button type="submit" style="height: 40px;width: 100%; " class="btn btn-dark">
                Hoàn tất đơn hàng
              </button>
            </div>
          </div>
        </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
          document.addEventListener("DOMContentLoaded", async function () {
            const provinceSelect = document.getElementById("province");
            const districtSelect = document.getElementById("district");
            const wardSelect = document.getElementById("ward");
            const addressDetailInput = document.querySelector(
              'input[name="addressDetail"]'
            );
            const fullAddressInput = document.getElementById("fullAddress");

            // API URLs
            const API_BASE_URL = "https://vn-public-apis.fpo.vn";

            // Fetch provinces
            await fetch(API_BASE_URL + `/provinces/getAll?limit=-1`)
              .then((response) => response.json())
              .then((data) => {
                if (data.data && data.data.data && data.data.data.length > 0) {
                  data.data.data.forEach((province) => {
                    const option = document.createElement("option");
                    option.value = province.code;
                    option.textContent = province.name_with_type;
                    provinceSelect.appendChild(option);
                  });
                } else {
                  console.error("Error fetching provinces:", data);
                }
              })
              .catch((error) => console.error("Error fetching provinces:", error));

            // Event listener for province selection
            provinceSelect.addEventListener("change", async function () {
              // Clear district and ward selects
              districtSelect.innerHTML =
                '<option value="">Chọn Quận/Huyện</option>';
              wardSelect.innerHTML = '<option value="">Chọn Phường/Xã</option>';

              // Reset disabled status
              districtSelect.disabled = true;
              wardSelect.disabled = true;

              const provinceCode = this.value;
              if (provinceCode) {
                console.log("PROVINCE CODE: ", provinceCode);
                // Enable district select
                districtSelect.disabled = false;

                // Fetch districts for selected province
                await fetch(
                  API_BASE_URL +
                  `/districts/getByProvince?provinceCode=` +
                  provinceCode +
                  `&limit=-1`
                )
                  .then((response) => response.json())
                  .then((data) => {
                    if (data.data && data.data.data && data.data.data.length > 0) {
                      data.data.data.forEach((district) => {
                        const option = document.createElement("option");
                        option.value = district.code;
                        option.textContent = district.name_with_type;
                        districtSelect.appendChild(option);
                      });
                    } else {
                      console.error("Error fetching districts:", data);
                    }
                  })
                  .catch((error) =>
                    console.error("Error fetching districts:", error)
                  );
              }

              updateFullAddress();
            });

            // Event listener for district selection
            districtSelect.addEventListener("change", async function () {
              // Clear ward select
              wardSelect.innerHTML = '<option value="">Chọn Phường/Xã</option>';
              wardSelect.disabled = true;

              const districtCode = this.value;

              if (districtCode) {
                // Enable ward select
                wardSelect.disabled = false;

                // Fetch wards for selected district
                await fetch(
                  API_BASE_URL +
                  `/wards/getByDistrict?districtCode=` +
                  districtCode +
                  `&limit=-1`
                )
                  .then((response) => response.json())
                  .then((data) => {
                    if (data.data && data.data.data && data.data.data.length > 0) {
                      data.data.data.forEach((ward) => {
                        const option = document.createElement("option");
                        option.value = ward.code;
                        option.textContent = ward.name_with_type;
                        wardSelect.appendChild(option);
                      });
                    } else {
                      console.error("Error fetching wards:", data);
                    }
                  })
                  .catch((error) => console.error("Error fetching wards:", error));
              }

              updateFullAddress();
            });

            // Event listeners for updating full address
            wardSelect.addEventListener("change", updateFullAddress);
            addressDetailInput.addEventListener("input", updateFullAddress);

            // Function to update full address
            function updateFullAddress() {
              const provinceText =
                provinceSelect.options[provinceSelect.selectedIndex]?.text || "";
              const districtText =
                districtSelect.options[districtSelect.selectedIndex]?.text || "";
              const wardText =
                wardSelect.options[wardSelect.selectedIndex]?.text || "";
              const addressDetail = addressDetailInput.value || "";

              // Combine all parts to create full address
              let parts = [
                addressDetail,
                wardText,
                districtText,
                provinceText,
              ].filter(Boolean);
              fullAddressInput.value = parts.join(", ");
            }

            // Form submission logic
            document
              .querySelector("form")
              .addEventListener("submit", function (event) {
                const province = provinceSelect.value;
                const district = districtSelect.value;
                const ward = wardSelect.value;
                const addressDetail = addressDetailInput.value.trim();

                if (!province || !district || !ward || !addressDetail) {
                  event.preventDefault();
                  alert("Vui lòng nhập đầy đủ thông tin địa chỉ");
                }
              });
          });

          document.querySelectorAll(".quantity-btn").forEach((btn) => {
            btn.addEventListener("click", function () {
              const isPlus = this.classList.contains("plus");
              const quantityElement = this.parentElement.querySelector(
                "span:not(.quantity-btn)"
              );
              let quantity = parseInt(quantityElement.textContent);

              if (isPlus) {
                quantity++;
              } else if (quantity > 1) {
                quantity--;
              }

              quantityElement.textContent = quantity;
              // Here you would update the cart in localStorage and recalculate total
            });
          });
          document.querySelectorAll(".remove-btn").forEach((btn) => {
            btn.addEventListener("click", function () {
              const itemElement = this.closest(".cart-item");
              // Here you would remove the item from localStorage
              itemElement.remove();
              // Update cart count and total
            });
          });
        </script>
      </body>

      </html>