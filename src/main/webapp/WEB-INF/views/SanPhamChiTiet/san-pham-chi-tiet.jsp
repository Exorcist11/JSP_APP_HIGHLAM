<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.util.stream.Collectors" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><c:out value="${product.name}"/> - T-shirt Luxury</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sanPhamChiTiet.css" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sanPhamChiTiet.js"></script>

    <style>
        .btn-group {
            gap: 12px;
        }

        .product-img-item {
          height: 600px;
          object-fit: cover;
          object-position: center;
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
            border: 2px solid black;
        }

        .color-option {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 1px solid #ccc;
        }

        .disabled {
            opacity: 0.4;
            cursor: not-allowed;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

    <div class="container mt-3" style="padding-top: 90px;">
      <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="<c:url value='/'/>">Trang chủ</a></li>
              <li class="breadcrumb-item"><a href="<c:url value='/san-pham'/>">Sản phẩm</a></li>
              <li class="breadcrumb-item active" aria-current="page"><c:out value="${product.name}"/></li>
          </ol>
      </nav>
    </div>

    <div class="modal" tabindex="-1" id="bangsize">
        <div class="modal-dialog">
            <div class="modal-content">
                <img src="/images/bangSize/bangsize.png" alt="Bảng size" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-1"></div>
        <div class="col-7">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach var="imageUrl" items="${images}" varStatus="status">
                        <div class="carousel-item ${status.first ? 'active' : ''}">
                            <img src="${imageUrl}" class="d-block w-100 product-img-item" alt="Product Image" />
                        </div>
                    </c:forEach>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="prev" style="margin-top: 350px">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="next" style="margin-top: 350px">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="col-4">
            <h6 id="productName"><c:out value="${product.name}"/></h6>
            <div class="mb-3">
                <span class="text-muted" id="availableQuantity"></span>
            </div>
            <input type="text" hidden id="productId" value="${product.id}" />

            <hr />
            <div class="d-flex flex-column gap-3">
                <h6 id="price">
                    <fmt:formatNumber value="${product.price}" groupingUsed="true" maxFractionDigits="0"/> VND
                </h6>

                <div>
                    <div class="d-flex gap-2 align-items-center">
                        <h6 class="mb-0 text-uppercase">Màu sắc</h6>
                    </div>
                    <div class="btn-group">
                        <c:forEach items="${colors}" var="item" varStatus="status">
                            <% 
                                List<Long> availableSizeIds = (List<Long>) ((Map<String, Object>) pageContext.getAttribute("item")).get("availableSizeIds");
                                String availableSizes = availableSizeIds != null ? availableSizeIds.stream()
                                    .map(String::valueOf)
                                    .collect(Collectors.joining(",")) : "";
                            %>
                            <input type="radio" class="btn-check color-option" name="color" id="color_${item.id}"
                                   value="${item.id}" autocomplete="off" data-name="${item.name}"
                                   data-available-sizes="<%= availableSizes %>"
                                   ${status.first ? 'checked' : ''} />
                            <label for="color_${item.id}" class="color-option"
                                   style="background-color: ${item.colorCode};"></label>
                        </c:forEach>
                    </div>
                </div>

                <div>
                    <div class="d-flex gap-2 align-items-center">
                        <h6 class="mb-0 text-uppercase">Kích thước</h6>
                        <p href="" class="mb-0 pe-auto" data-bs-toggle="modal" data-bs-target="#bangsize"
                           style="color: black; text-decoration: none">
                            Hướng dẫn chọn size
                        </p>
                    </div>
                    <div class="btn-group">
                        <c:forEach items="${sizes}" var="item" varStatus="status">
                            <% 
                                List<Long> availableColorIds = (List<Long>) ((Map<String, Object>) pageContext.getAttribute("item")).get("availableColorIds");
                                String availableColors = availableColorIds != null ? availableColorIds.stream()
                                    .map(String::valueOf)
                                    .collect(Collectors.joining(",")) : "";
                            %>
                            <input type="radio" class="btn-check size-option" name="size" id="size_${item.id}"
                                   value="${item.id}" autocomplete="off" data-name="${item.name}"
                                   data-available-colors="<%= availableColors %>"
                                   ${status.first ? 'checked' : ''} />
                            <label class="btn btn-default" for="size_${item.id}">${item.name}</label>
                        </c:forEach>
                    </div>
                </div>

                <div class="input-group" style="width: 120px">
                    <button class="btn btn-outline-secondary" type="button" id="decrease">-</button>
                    <input type="text" class="form-control text-center" value="1" id="quantity" readonly />
                    <button class="btn btn-outline-secondary" type="button" id="increase">+</button>
                </div>
            </div>

            <div class="order" style="margin-top: 20px">
                <form method="POST" action="/cart/add" class="d-inline">
                    <input type="hidden" name="productID" value="${product.id}" />
                    <input type="hidden" name="colorID" id="selectedColorId" />
                    <input type="hidden" name="sizeID" id="selectedSizeId" />
                    <input type="hidden" name="quantity" id="selectedQuantity" value="1" />
                    <button type="submit" class="btn btn-dark" id="addToCartBtn" style="width: 185px" disabled>
                        THÊM VÀO GIỎ HÀNG
                    </button>
                </form>
                <a class="btn btn-dark" id="buyNow" style="margin-left: 5px" disabled>MUA NGAY</a>
            </div>

            <div class="alert alert-danger d-none mt-3" id="errorMessage">
                Vui lòng chọn kích thước và màu sắc hợp lệ
            </div>

            <!-- Thuộc Tính Sản Phẩm -->
            <div class="accordion" id="accordionExample" style="margin-top: 20px">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            THUỘC TÍNH SẢN PHẨM
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p>Chất liệu: 90% Polyester, 9% Rayon, 1% Spandex</p>
                            <p>►Vải Polyester chống nhăn hiệu quả, giữ nhiệt tốt, độ bền cao</p>
                            <p>►Vải Rayon thoáng mát, mềm mại</p>
                            <p>Kiểu dáng:<br />►Form Classic rộng thoáng, dễ mặc tạo sự thoải mái tối đa</p>
                            <p>Chi tiết:<br />►Chất liệu có sự kết hợp của vải Rayon an toàn cho da, thoáng khí, hút ẩm tốt và đặc biệt là ít nhăn và có độ bền cao</p>
                            <p>►Thiết kế cổ tròn basic hài hòa, dễ bearers</p>
                            <p>►Áo bo gấu nhẹ nhàng tạo sự gọn gàng, thoải mái</p>
                            <p>►Áo với hoạ tiết kẻ sọc năng động, dễ dàng đa dạng phong cách</p>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            CHÍNH SÁCH SẢN PHẨM
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p>►Đổi hàng trong vòng 15 ngày.</p>
                            <p>►Giảm đến 15% trên tổng hóa đơn khi mua hàng ( tại cửa hàng ) vào tháng sinh nhật.</p>
                            <p>►Giao hàng nội thành Hà Nội chỉ từ 15.000đ trong vòng 24 giờ.</p>
                            <p>►Tích điểm 3-8% giá trị đơn hàng cho mỗi lần mua và trừ tiền vào lần mua tiếp theo.</p>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            HƯỚNG DẪN BẢO QUẢN
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <p>►Có thể giặt tay hay giặt máy đều được (ưu tiên giặt tay để tăng tuổi thọ của sản phẩm)</p>
                            <p>►Lộn trái sản phẩm khi giặt, không giặt chung sản phẩm trắng với quần áo tối màu.</p>
                            <p>►Sử dụng xà phòng trung tính, không sử dụng xà phòng có chất tẩy mạnh.</p>
                            <p>►Không sử dụng chất tẩy, không ngâm sản phẩm.</p>
                            <p>►Hạn chế sấy ở nhiệt độ cao, bảo quản nơi khô ráo, thoáng mát, không phơi trực tiếp dưới ánh nắng mặt trời.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/productForYou.jsp" />
    <div class="container">
      <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Global variables
            let selectedSize = document.querySelector('input[name="size"]:checked').value;
            let selectedColor = document.querySelector('input[name="color"]:checked').value;
            let availableQuantity = 0;
            let quantityInput = document.getElementById('quantity');

            // Initialize hidden inputs
            document.getElementById('selectedSizeId').value = selectedSize;
            document.getElementById('selectedColorId').value = selectedColor;

            // Check availability on page load
            checkAvailability();

            // Update color selection
            document.querySelectorAll('input[name="color"]').forEach(colorInput => {
                colorInput.addEventListener('change', function () {
                    selectedColor = this.value;
                    console.log('Selected Color ID:', selectedColor);
                    document.getElementById('selectedColorId').value = selectedColor;

                    // Get available sizes for this color
                    let availableSizes = this.dataset.availableSizes?.split(',').filter(id => id.trim() !== '') || [];
                    console.log('Available sizes for color', selectedColor, ':', availableSizes);

                    // Enable/disable size options
                    document.querySelectorAll('input[name="size"]').forEach(sizeInput => {
                        const sizeId = sizeInput.value;
                        const sizeLabel = sizeInput.nextElementSibling;
                        if (availableSizes.length > 0 && !availableSizes.includes(sizeId)) {
                            sizeInput.disabled = true;
                            sizeLabel.classList.add('disabled');
                            if (selectedSize === sizeId) {
                                selectedSize = null;
                                document.getElementById('selectedSizeId').value = '';
                                document.querySelectorAll('input[name="size"]').forEach(s => s.checked = false);
                            }
                        } else {
                            sizeInput.disabled = false;
                            sizeLabel.classList.remove('disabled');
                        }
                    });

                    // Reset quantity
                    quantityInput.value = 1;
                    document.getElementById('selectedQuantity').value = 1;

                    // Check availability
                    checkAvailability();
                    updateButtons();
                });
            });

            // Update size selection
            document.querySelectorAll('input[name="size"]').forEach(sizeInput => {
                sizeInput.addEventListener('change', function () {
                    selectedSize = this.value;
                    console.log('Selected Size ID:', selectedSize);
                    document.getElementById('selectedSizeId').value = selectedSize;

                    // Get available colors for this size
                    let availableColors = this.dataset.availableColors?.split(',').filter(id => id.trim() !== '') || [];
                    console.log('Available colors for size', selectedSize, ':', availableColors);

                    // Enable/disable color options
                    document.querySelectorAll('input[name="color"]').forEach(colorInput => {
                        const colorId = colorInput.value;
                        const colorLabel = colorInput.nextElementSibling;
                        if (availableColors.length > 0 && !availableColors.includes(colorId)) {
                            colorInput.disabled = true;
                            colorLabel.classList.add('disabled');
                            if (selectedColor === colorId) {
                                selectedColor = null;
                                document.getElementById('selectedColorId').value = '';
                                document.querySelectorAll('input[name="color"]').forEach(c => c.checked = false);
                            }
                        } else {
                            colorInput.disabled = false;
                            colorLabel.classList.remove('disabled');
                        }
                    });

                    // Reset quantity
                    quantityInput.value = 1;
                    document.getElementById('selectedQuantity').value = 1;

                    // Check availability
                    checkAvailability();
                    updateButtons();
                });
            });

            // Handle quantity increase
            document.getElementById('increase').addEventListener('click', function () {
                let qty = parseInt(quantityInput.value);
                if (qty < availableQuantity) {
                    qty += 1;
                    quantityInput.value = qty;
                    document.getElementById('selectedQuantity').value = qty;
                } else {
                    alert('Số lượng không được vượt quá số lượng còn lại: ' + availableQuantity);
                }
            });

            // Handle quantity decrease
            document.getElementById('decrease').addEventListener('click', function () {
                let qty = parseInt(quantityInput.value);
                if (qty > 1) {
                    qty -= 1;
                    quantityInput.value = qty;
                    document.getElementById('selectedQuantity').value = qty;
                }
            });

            // Check product availability via Fetch
            function checkAvailability() {
                const quantityDisplay = document.getElementById('availableQuantity');
                if (selectedSize && selectedColor) {
                    quantityDisplay.textContent = 'Đang kiểm tra...';
                    fetch("/product/quantity?productId=" + ${product.id} + "&sizeId=" + selectedSize + "&colorId=" + selectedColor)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            availableQuantity = data.quantity || 0;
                            console.log('Quantity for product', ${product.id}, 'size', selectedSize, 'color', selectedColor, ':', availableQuantity);
                            if (availableQuantity > 0) {
                                quantityDisplay.textContent = 'Còn ' + availableQuantity + ' sản phẩm';
                            } else {
                                quantityDisplay.textContent = 'Hết hàng';
                            }
                            // Reset quantity if current quantity exceeds available
                            let currentQty = parseInt(quantityInput.value);
                            if (currentQty > availableQuantity) {
                                quantityInput.value = availableQuantity > 0 ? 1 : 0;
                                document.getElementById('selectedQuantity').value = availableQuantity > 0 ? 1 : 0;
                            }
                            updateButtons();
                        })
                        .catch(error => {
                            console.error('Error fetching quantity:', error);
                            availableQuantity = 0;
                            quantityDisplay.textContent = 'Lỗi kiểm tra số lượng';
                            updateButtons();
                        });
                } else {
                    availableQuantity = 0;
                    quantityDisplay.textContent = '';
                    quantityInput.value = 1;
                    document.getElementById('selectedQuantity').value = 1;
                    updateButtons();
                }
            }

            // Update button states
            function updateButtons() {
                const addToCartBtn = document.getElementById('addToCartBtn');
                const buyNowBtn = document.getElementById('buyNow');
                const errorMessage = document.getElementById('errorMessage');

                if (selectedSize && selectedColor && availableQuantity > 0 && parseInt(quantityInput.value) > 0) {
                    addToCartBtn.disabled = false;
                    buyNowBtn.classList.remove('disabled');
                    errorMessage.classList.add('d-none');
                } else {
                    addToCartBtn.disabled = true;
                    buyNowBtn.classList.add('disabled');
                    errorMessage.classList.remove('d-none');
                    errorMessage.textContent = 'Vui lòng chọn kích thước và màu sắc hợp lệ';
                }
            }

            // Buy now
            document.getElementById('buyNow').addEventListener('click', function (e) {
                if (!selectedSize || !selectedColor || availableQuantity === 0 || parseInt(quantityInput.value) === 0) {
                    e.preventDefault();
                    return;
                }
                window.location.href = "/checkout?productId=" + ${product.id} + "&sizeId=" + selectedSize + "&colorId=" + selectedColor + "&quantity=" + quantityInput.value;
            });

            // Validate form submission
            document.querySelector('form[action="/cart/add"]').addEventListener('submit', function (e) {
                if (!selectedSize || !selectedColor || availableQuantity === 0 || parseInt(quantityInput.value) === 0) {
                    e.preventDefault();
                    alert("Vui lòng chọn kích thước, màu sắc hợp lệ và số lượng lớn hơn 0!");
                } else if (parseInt(quantityInput.value) > availableQuantity) {
                    e.preventDefault();
                    alert("Số lượng không được vượt quá số lượng còn lại: " + availableQuantity);
                }
            });
        });
    </script>
</body>
</html>