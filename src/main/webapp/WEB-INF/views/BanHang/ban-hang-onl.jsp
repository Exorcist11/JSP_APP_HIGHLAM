<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Thanh toán đơn hàng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
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
      height: 100px;
      object-position: center;
      object-fit: cover;
    }

    .img-fluid-cart {
      height: 70px;
      width: 120px;
      object-position: center;
      object-fit: cover;
    }
    
    .address-card {
      background-color: #f9f9f9;
      border: 1px solid #eee;
      border-radius: 8px;
      padding: 15px;
      margin-bottom: 20px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }
    
    .payment-method {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 15px;
      margin-bottom: 20px;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    
    .payment-method:hover {
      background-color: #f9f9f9;
    }
    
    .payment-method.selected {
      border-color: #000;
      background-color: #f9f9f9;
    }
    
    .payment-method-icon {
      font-size: 24px;
      margin-right: 10px;
    }
    
    .checkout-steps {
      display: flex;
      justify-content: space-between;
      margin-bottom: 30px;
      position: relative;
    }
    
    .checkout-step {
      text-align: center;
      position: relative;
      z-index: 1;
    }
    
    .step-number {
      width: 30px;
      height: 30px;
      border-radius: 50%;
      background-color: #ddd;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 10px;
    }
    
    .active-step .step-number {
      background-color: #000;
      color: #fff;
    }
    
    .step-line {
      position: absolute;
      top: 15px;
      left: 15%;
      right: 15%;
      height: 2px;
      background-color: #ddd;
      z-index: 0;
    }
    
    .product-summary {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      padding: 20px;
      margin-bottom: 20px;
    }
  </style>
</head>

<body class="container mt-90">
  <jsp:include page="/WEB-INF/views/fragments/header.jsp" />
  
  <!-- Checkout Steps -->
  <!-- <div class="checkout-steps mb-4">
    <div class="step-line"></div>
    <div class="checkout-step">
      <div class="step-number">1</div>
      <div class="step-label">Giỏ hàng</div>
    </div>
    <div class="checkout-step active-step">
      <div class="step-number">2</div>
      <div class="step-label">Thanh toán</div>
    </div>
    <div class="checkout-step">
      <div class="step-number">3</div>
      <div class="step-label">Hoàn tất</div>
    </div>
  </div> -->
  
  <div class="mb-4">
    <a href="/cart" class="text-decoration-none"><i class="fas fa-arrow-left me-2"></i>Quay lại giỏ hàng</a>
  </div>
  
  <form method="post" action="/cart/checkout" id="checkoutForm">
    <div class="row">
      <div class="col-md-7">
        <div class="mb-4">
          <h4>Thông tin giao hàng</h4>
          <div class="card shadow-sm">
            <div class="card-body">
              <!-- Phần người dùng đã đăng nhập -->
              <c:if test="${not empty loggedInUser}">
                <div class="mb-3">
                  <label for="savedAddresses" class="form-label">Chọn địa chỉ giao hàng của bạn</label>
                  <select id="savedAddresses" name="profileId" class="form-select" required>
                    <option value="">-- Vui lòng chọn địa chỉ --</option>
                    <c:forEach var="profile" items="${userProfiles}">
                      <option value="${profile.id}"
                              data-fullname="${profile.fullName}"
                              data-phone="${profile.phoneNumber}"
                              data-detail="${profile.detail}"
                              data-province-code="${profile.provinceCode}"
                              data-province-name="${profile.provinceName}"
                              data-district-code="${profile.districtCode}"
                              data-district-name="${profile.districtName}"
                              data-ward-code="${profile.wardCode}"
                              data-ward-name="${profile.wardName}">
                        ${profile.fullName} - ${profile.detail}, ${profile.wardName}, ${profile.districtName}, ${profile.provinceName}
                      </option>
                    </c:forEach>
                  </select>
                  <div class="mt-3 d-flex justify-content-end">
                    <a href="/profile" class="btn btn-outline-primary btn-sm">
                      <i class="fas fa-edit me-1"></i>Quản lý địa chỉ
                    </a>
                  </div>
                </div>
                
                <!-- Hiển thị thông tin địa chỉ đã chọn -->
                <div id="selectedAddressInfo" class="address-card mt-3" style="display: none;">
                  <div class="d-flex justify-content-between align-items-start mb-2">
                    <h6 class="mb-0"><i class="fas fa-map-marker-alt me-2"></i>Địa chỉ giao hàng</h6>
                  </div>
                  <div class="mb-2">
                    <strong>Người nhận:</strong> <span id="info-fullname"></span>
                  </div>
                  <div class="mb-2">
                    <strong>Số điện thoại:</strong> <span id="info-phone"></span>
                  </div>
                  <div>
                    <strong>Địa chỉ:</strong> <span id="info-address"></span>
                  </div>
                  
                  <!-- Hidden fields để gửi dữ liệu -->
                  <input type="hidden" name="recipientName" id="recipientName">
                  <input type="hidden" name="recipientPhone" id="recipientPhone">
                  <input type="hidden" name="province" id="province">
                  <input type="hidden" name="district" id="district">
                  <input type="hidden" name="ward" id="ward">
                  <input type="hidden" name="addressDetail" id="addressDetail">
                  <input type="hidden" name="recipientAddress" id="fullAddress">
                </div>
              </c:if>
              
              <!-- Phần dành cho khách vãng lai -->
              <c:if test="${empty loggedInUser}">
                <div class="mb-3">
                  <label for="recipientName" class="form-label">Họ và tên</label>
                  <input type="text" class="form-control" name="recipientName" id="recipientName" required />
                </div>
                <div class="mb-3">
                  <label for="guestEmail" class="form-label">Email</label>
                  <input type="email" class="form-control" name="guestEmail" id="guestEmail" required />
                </div>
                <div class="mb-3">
                  <label for="recipientPhone" class="form-label">Số điện thoại</label>
                  <input type="tel" class="form-control" name="recipientPhone" id="recipientPhone" required />
                </div>
              
                <div class="mb-3">
                  <label for="province" class="form-label">Tỉnh/Thành phố</label>
                  <select id="province" name="province" class="form-select" required>
                    <option value="">-- Chọn Tỉnh/Thành phố --</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="district" class="form-label">Quận/Huyện</label>
                  <select id="district" name="district" class="form-select" required disabled>
                    <option value="">-- Chọn Quận/Huyện --</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="ward" class="form-label">Phường/Xã</label>
                  <select id="ward" name="ward" class="form-select" required disabled>
                    <option value="">-- Chọn Phường/Xã --</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="addressDetail" class="form-label">Số nhà, tên đường</label>
                  <input type="text" class="form-control" name="addressDetail" id="addressDetail" required />
                </div>
                <input type="hidden" id="fullAddress" name="recipientAddress" />
              </c:if>
              
              <div class="mb-3">
                <label for="note" class="form-label">Ghi chú đơn hàng (tùy chọn)</label>
                <textarea class="form-control" name="note" id="note" rows="3" placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa điểm giao hàng chi tiết hơn."></textarea>
              </div>
            </div>
          </div>
        </div>
        
        <div class="mb-4">
          <h4>Phương thức thanh toán</h4>
          <div class="card shadow-sm">
            <div class="card-body">
              <div class="payment-method selected" data-value="1">
                <div class="form-check">
                  <input type="radio" id="cod" value="1" checked name="trangThai" class="form-check-input" />
                  <label for="cod" class="form-check-label">
                    <span class="d-flex align-items-center">
                      <i class="fas fa-money-bill-wave payment-method-icon"></i>
                      <span>
                        <strong>Thanh toán khi nhận hàng (COD)</strong>
                        <div class="text-muted small">Quý khách sẽ thanh toán bằng tiền mặt khi nhận hàng</div>
                      </span>
                    </span>
                  </label>
                </div>
              </div>
              
              <div class="payment-method mt-3" data-value="2">
                <div class="form-check">
                  <input type="radio" id="online" value="2" name="trangThai" class="form-check-input" />
                  <label for="online" class="form-check-label">
                    <span class="d-flex align-items-center">
                      <i class="fas fa-credit-card payment-method-icon"></i>
                      <span>
                        <strong>Thanh toán trực tuyến (VNPay)</strong>
                        <div class="text-muted small">Thanh toán an toàn qua cổng thanh toán VNPay</div>
                      </span>
                    </span>
                  </label>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-5">
        <div class="product-summary">
          <h4 class="mb-3">Tóm tắt đơn hàng</h4>
          
          <c:if test="${not empty cartItems}">
            <div class="cart-items-container" style="max-height: 350px;">
              <c:forEach var="item" items="${cartItems}">
                <div class="cart-item row">
                  <div class="col-3">
                    <img src="${item.imageUrl}" alt="${item.productName}" class="img-fluid-cart rounded img-product">
                  </div>
                  <div class="col-5">
                    <h6 class="mb-1">${item.productName}</h6>
                    <p class="small mb-1">Màu: ${item.colorName} | Size: ${item.sizeName}</p>
                    <p class="small mb-0">
                      <fmt:formatNumber value="${item.price}" groupingUsed="true" maxFractionDigits="0" />₫
                    </p>
                  </div>
                  <div class="col-2 quantity-control align-items-center">
                    <input type="hidden" name="code" id="code" value="${item.productDetailCode}">
                    <span class="quantity-btn minus"><i class="fas fa-minus"></i></span>
                    <span>${item.quantity}</span>
                    <span class="quantity-btn plus"><i class="fas fa-plus"></i></span>
                  </div>
                  <div class="col-2 text-end">
                    <p class="mb-1">
                      <fmt:formatNumber value="${item.price * item.quantity}" groupingUsed="true" maxFractionDigits="0" />₫
                    </p>
                  </div>
                </div>
                <hr class="my-2">
              </c:forEach>
            </div>
          </c:if>
          <c:if test="${empty cartItems}">
            <div class="alert alert-warning">
              <i class="fas fa-exclamation-circle me-2"></i>Giỏ hàng trống!
            </div>
          </c:if>
          
          <div class="card-body p-0 mt-3">
            <div class="d-flex justify-content-between mb-2">
              <span>Tạm tính:</span>
              <span><fmt:formatNumber value="${totalPrice}" groupingUsed="true" maxFractionDigits="0" />₫</span>
            </div>
            <div class="d-flex justify-content-between mb-2">
              <span>Phí vận chuyển:</span>
              <span>35,000₫</span>
            </div>
            <div class="d-flex justify-content-between mb-2" id="discountSection" style="display: none;">
              <span>Giảm giá:</span>
              <span class="text-success" id="discountAmount">-0₫</span>
            </div>
            <hr>
            <div class="discount-code-section mb-3">
              <div class="input-group">
                <input
                  type="text"
                  id="couponCode"
                  class="form-control"
                  placeholder="Nhập mã giảm giá"
                />
                <button class="btn btn-outline-dark" type="button" id="applyCoupon">
                  Áp dụng
                </button>
              </div>
              <div id="couponMessage" class="small mt-1"></div>
            </div>
            <hr>
            <div class="d-flex justify-content-between mb-2">
              <h5>Tổng cộng:</h5>
              <h5 class="text-danger">
                <fmt:formatNumber value="${totalPrice}" groupingUsed="true" maxFractionDigits="0" />₫
              </h5>
            </div>
            <div class="mt-3">
              <button type="submit" class="btn btn-dark w-100 py-3"
                      ${empty cartItems ? 'disabled' : ''}>
                  <i class="fas fa-lock me-2"></i>Hoàn tất đơn hàng
              </button>
            </div>
            <div class="text-center mt-3">
              <small class="text-muted">
                <i class="fas fa-shield-alt me-1"></i>Thông tin thanh toán của bạn được bảo mật
              </small>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", async function () {
      // Xử lý phương thức thanh toán
      const paymentMethods = document.querySelectorAll('.payment-method');
      paymentMethods.forEach(method => {
        method.addEventListener('click', function() {
          // Bỏ chọn tất cả
          paymentMethods.forEach(m => m.classList.remove('selected'));
          // Chọn phương thức hiện tại
          this.classList.add('selected');
          // Check radio button
          const radio = this.querySelector('input[type="radio"]');
          radio.checked = true;
        });
      });
      
      // Phần xử lý địa chỉ cho khách vãng lai
      const isLoggedIn = document.getElementById("savedAddresses") !== null;
      
      if (!isLoggedIn) {
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
            '<option value="">-- Chọn Quận/Huyện --</option>';
          wardSelect.innerHTML = '<option value="">-- Chọn Phường/Xã --</option>';

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
          wardSelect.innerHTML = '<option value="">-- Chọn Phường/Xã --</option>';
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
      } else {
        // Xử lý cho người dùng đã đăng nhập
        const savedAddressesSelect = document.getElementById("savedAddresses");
        const selectedAddressInfo = document.getElementById("selectedAddressInfo");
        
        // Hidden fields
        const recipientNameInput = document.getElementById("recipientName");
        const recipientPhoneInput = document.getElementById("recipientPhone");
        const provinceInput = document.getElementById("province");
        const districtInput = document.getElementById("district");
        const wardInput = document.getElementById("ward");
        const addressDetailInput = document.getElementById("addressDetail");
        const fullAddressInput = document.getElementById("fullAddress");
        
        // Info display elements
        const infoFullname = document.getElementById("info-fullname");
        const infoPhone = document.getElementById("info-phone");
        const infoAddress = document.getElementById("info-address");
        
        savedAddressesSelect.addEventListener("change", function() {
          const selectedOption = this.options[this.selectedIndex];
          
          if (this.value) {
            // Show the address info card
            selectedAddressInfo.style.display = "block";
            
            // Extract data from the selected option
            const fullName = selectedOption.getAttribute("data-fullname");
            const phone = selectedOption.getAttribute("data-phone");
            const detail = selectedOption.getAttribute("data-detail");
            const provinceCode = selectedOption.getAttribute("data-province-code");
            const provinceName = selectedOption.getAttribute("data-province-name");
            const districtCode = selectedOption.getAttribute("data-district-code");
            const districtName = selectedOption.getAttribute("data-district-name");
            const wardCode = selectedOption.getAttribute("data-ward-code");
            const wardName = selectedOption.getAttribute("data-ward-name");
            console.log("DETAIL: ", detail);
            console.log("WARD NAME: ", wardName);
            console.log("DISTRICT NAME: ", districtName);
            console.log("PROVINCE NAME: ", provinceName);
            
            // Set visible info
            infoFullname.textContent = fullName;
            infoPhone.textContent = phone;
            infoAddress.textContent = detail + ", " + wardName + ", " + districtName + ", " + provinceName;
            
            // Update hidden fields
            recipientNameInput.value = fullName;
            recipientPhoneInput.value = phone;
            provinceInput.value = provinceCode;
            districtInput.value = districtCode;
            wardInput.value = wardCode;
            addressDetailInput.value = detail;
            fullAddressInput.value = `${detail}, ${wardName}, ${districtName}, ${provinceName}`;
          } else {
            // Hide the address info card if no address is selected
            selectedAddressInfo.style.display = "none";
          }
        });
      }

      // Form submission validation
      document
        .querySelector("form")
        .addEventListener("submit", function (event) {
          const isLoggedIn = document.getElementById("savedAddresses") !== null;
          
          if (isLoggedIn) {
            // For logged-in users, check if an address is selected
            const savedAddressesSelect = document.getElementById("savedAddresses");
            if (!savedAddressesSelect.value) {
              event.preventDefault();
              alert("Vui lòng chọn địa chỉ giao hàng");
            }
          } else {
            // For guests, validate address inputs
            const province = document.getElementById("province").value;
            const district = document.getElementById("district").value;
            const ward = document.getElementById("ward").value;
            const addressDetail = document.getElementById("addressDetail").value.trim();

            if (!province || !district || !ward || !addressDetail) {
              event.preventDefault();
              alert("Vui lòng nhập đầy đủ thông tin địa chỉ");
            }
          }
        });
    });

    // Xử lý số lượng sản phẩm
    document.querySelectorAll(".quantity-btn").forEach((btn) => {
      btn.addEventListener("click", async function () {
        const isPlus = this.classList.contains("plus");
        const quantityElement = this.parentElement.querySelector(
          "span:not(.quantity-btn)"
        );
        let quantity = parseInt(quantityElement.textContent);
        let code = this.closest(".quantity-control").querySelector("input[name='code']").value;

        if (isPlus) {
          quantity++;
        } else if (quantity > 1) {
          quantity--;
        }

        quantityElement.textContent = quantity;
        
        try {
          const response = await fetch("/api/updateCart?code=" + encodeURIComponent(code) + "&quantity=" + quantity, {
            method: "POST"
          });
          
          if (!response.ok) {
            throw new Error("Lỗi khi cập nhật giỏ hàng");
          }
          
          const data = await response.text();
          console.log("Server:", data);
          window.location.reload();
        } catch (error) {
          console.error("Lỗi:", error);
          alert("Có lỗi xảy ra khi cập nhật giỏ hàng. Vui lòng thử lại.");
        }
      });
    });
    
    // Xử lý nút xóa (nếu cần)
    document.querySelectorAll(".remove-btn").forEach((btn) => {
      btn.addEventListener("click", async function(e) {
        e.preventDefault();
        const itemElement = this.closest(".cart-item");
        const code = itemElement.querySelector("input[name='code']").value;
        
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?")) {
          try {
            const response = await fetch("/api/removeFromCart?code=" + encodeURIComponent(code), {
              method: "POST"
            });
            
            if (!response.ok) {
              throw new Error("Lỗi khi xóa sản phẩm khỏi giỏ hàng");
            }
            
            window.location.reload();
          } catch (error) {
            console.error("Lỗi:", error);
            alert("Có lỗi xảy ra khi xóa sản phẩm. Vui lòng thử lại.");
          }
        }
      });
    });
  </script>
 
</body>

</html>