<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
    .card-img-top {
        height: 288px;
        object-fit: cover;
        object-position: center;
    }
    
    .product-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border-radius: 8px;
        overflow: hidden;
        margin-bottom: 20px;
    }
    
    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.1);
    }
    
    .product-name {
        font-size: 14px;
        font-weight: 500;
        height: 40px;
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
    
    .product-price {
        font-size: 16px;
        font-weight: 700;
        color: #212529;
    }
    
    .btn-quick-buy {
        background-color: #212529;
        color: white;
        border-radius: 4px;
        font-weight: 500;
        padding: 8px 16px;
        transition: all 0.3s ease;
        width: 48%;
        font-size: 13px;
    }
    
    .btn-quick-buy:hover {
        background-color: #c0392b;
        transform: scale(1.05);
        color: white;
    }
    
    .btn-details {
        background-color: #f8f9fa;
        color: #343a40;
        border: 1px solid #dee2e6;
        border-radius: 4px;
        font-weight: 500;
        padding: 8px 16px;
        transition: all 0.3s ease;
        width: 48%;
        font-size: 13px;
    }
    
    .btn-details:hover {
        background-color: #e9ecef;
        color: #212529;
    }
    
    .action-buttons {
        display: flex;
        justify-content: space-between;
        margin-top: 12px;
    }
    
    .section-title {
        position: relative;
        font-size: 28px;
        font-weight: 700;
        margin-bottom: 30px;
        padding-bottom: 15px;
    }
    
    .section-title:after {
        content: '';
        position: absolute;
        display: block;
        width: 80px;
        height: 3px;
        background: #e74c3c;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
    }
    
    .view-more-btn {
        background-color: white;
        color: #333;
        border: 2px solid #333;
        padding: 10px 25px;
        font-weight: 600;
        border-radius: 4px;
        transition: all 0.3s ease;
    }
    
    .view-more-btn:hover {
        background-color: #333;
        color: white;
    }
    
    .icon-cart, .icon-eye {
        margin-right: 6px;
    }
    
    .modal-quick-buy .modal-content {
        border-radius: 10px;
        overflow: hidden;
        border: none;
        box-shadow: 0 15px 30px rgba(0,0,0,0.1);
    }
    
    .modal-quick-buy .modal-header {
        background-color: #e9ecef;
        color: black;
        border-bottom: none;
        padding: 1.5rem;
    }
    
    .modal-quick-buy .modal-title {
        font-weight: 700;
        font-size: 1.25rem;
    }
    
    .modal-product-img {
        width: 100%;
        height: 300px;
        object-fit: cover;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.08);
    }
    
    .modal-product-name {
        font-size: 1.5rem;
        font-weight: 600;
        margin-top: 1rem;
        margin-bottom: 0.5rem;
    }
    
    .modal-product-price {
        font-size: 1.75rem;
        font-weight: 700;
        color: #212529;
        margin-bottom: 1.5rem;
    }
    
    .modal-product-description {
        color: #6c757d;
        margin-bottom: 1.5rem;
        line-height: 1.6;
    }
    
    .quantity-input {
        display: flex;
        align-items: center;
        margin-bottom: 1.5rem;
    }
    
    .quantity-input .form-control {
        width: 80px;
        text-align: center;
        border-radius: 0;
        height: 40px;
    }
    
    .quantity-input .btn {
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        font-weight: bold;
    }
    
    .quantity-input .btn:hover {
        background-color: #e9ecef;
    }
    
    .btn-add-to-cart {
        background-color: #212529;
        color: white;
        font-weight: 600;
        padding: 12px 24px;
        border-radius: 5px;
        transition: all 0.3s ease;
        width: 100%;
        margin-bottom: 15px;
    }
    
    .btn-add-to-cart:hover {
        background-color: #c0392b;
        transform: translateY(-2px);
        box-shadow: 0 5px 10px rgba(0,0,0,0.1);
    }
    
    .btn-continue-shopping {
        background-color: transparent;
        color: #6c757d;
        font-weight: 600;
        padding: 12px 24px;
        border: 1px solid #dee2e6;
        border-radius: 5px;
        transition: all 0.3s ease;
        width: 100%;
    }
    
    .btn-continue-shopping:hover {
        background-color: #f8f9fa;
        color: #343a40;
    }
    
    .availability {
        font-size: 0.9rem;
        color: #e74c3c;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
    }
    
    .availability i {
        margin-right: 0.5rem;
    }
    
    .modal-quick-buy .modal-footer {
        border-top: none;
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    
    .btn {
        margin: 0;
        height: fit-content;
    }

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

    .error-message {
        color: #c0392b;
        font-size: 0.9rem;
        margin-top: 0.5rem;
        display: none;
    }
</style>

<div class="container py-5">
    <div class="text-center mb-5">
        <h1 class="section-title">SẢN PHẨM BÁN CHẠY</h1>
    </div>

    <div class="row">
        <c:forEach var="spNew" items="${bestSeller}">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product-card border">
                    <div class="position-relative">
                        <img src="${spNew.imgUrl}" class="card-img-top" alt="${spNew.name}">
                        <div class="position-absolute top-0 end-0 m-2">
                            <span class="badge bg-danger">Hot</span>
                        </div>
                    </div>
                    <div class="card-body p-3">
                        <h5 class="product-name text-center">${spNew.name}</h5>
                        <p class="product-price text-center mb-2">
                            <fmt:formatNumber value="${spNew.price}" groupingUsed="true" maxFractionDigits="0"/> VND
                        </p>
                        
                        <div class="action-buttons">
                            <a href="javascript:void(0)" class="btn btn-quick-buy" onclick="openQuickBuyModal('${spNew.id}')">
                                <i class="fa-solid fa-cart-shopping icon-cart"></i>Mua Nhanh
                            </a>
                            <a href="/product?id=${spNew.id}" class="btn btn-details">
                                <i class="fa-solid fa-eye icon-eye"></i>Chi tiết
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="text-center mt-5">
        <a class="btn view-more-btn" href="/all-products">XEM THÊM</a>
    </div>
</div>

<!-- Quick Buy Modal -->
<div class="modal fade modal-quick-buy" id="quickBuyModal" tabindex="-1" role="dialog" aria-labelledby="quickBuyModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="quickBuyModalLabel">Mua nhanh sản phẩm</h5>
                <button type="button" style="color: white;" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-5">
                        <img id="modalProductImg" src="" alt="Product Image" class="modal-product-img">
                    </div>
                    <div class="col-md-7">
                        <h3 id="modalProductName" class="modal-product-name"></h3>
                        <p id="modalProductPrice" class="modal-product-price"></p>
                        
                        <div class="availability" id="modalAvailability">
                            <i class="fa-solid fa-check-circle"></i> 
                            <span></span>
                        </div>
                        
                        <p id="modalProductDescription" class="modal-product-description"></p>
                        
                        <form id="quickBuyForm" method="POST" action="/cart/add">
                            <input type="hidden" name="productID" id="productId" value="">
                            <input type="hidden" name="colorID" id="selectedColorId" />
                            <input type="hidden" name="sizeID" id="selectedSizeId" />
                            <input type="hidden" name="quantity" id="selectedQuantity" value="1" />
                            
                            <!-- Color Selection -->
                            <div class="form-group mb-3">
                                <label class="mb-2 text-uppercase">Màu sắc</label>
                                <div class="btn-group" id="colorOptions"></div>
                            </div>
                            
                            <!-- Size Selection -->
                            <div class="form-group mb-3">
                                <div class="d-flex gap-2 align-items-center">
                                    <label class="mb-2 text-uppercase">Kích thước</label>
                                    <a href="#" class="mb-0" data-bs-toggle="modal" data-bs-target="#bangsize" style="color: black; text-decoration: none">
                                        Hướng dẫn chọn size
                                    </a>
                                </div>
                                <div class="btn-group" id="sizeOptions"></div>
                            </div>
                            
                            <!-- Quantity Selection -->
                            <div class="form-group mb-4">
                                <label for="quantity">Số lượng:</label>
                                <div class="quantity-input">
                                    <button type="button" class="btn" id="decreaseQuantity">-</button>
                                    <input type="text" class="form-control" id="quantity" value="1" min="1">
                                    <button type="button" class="btn" id="increaseQuantity">+</button>
                                </div>
                            </div>
                            
                            <div class="error-message" id="errorMessage">
                                Vui lòng chọn kích thước và màu sắc hợp lệ
                            </div>
                            
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-add-to-cart" id="addToCartBtn" disabled>
                                    <i class="fa-solid fa-cart-shopping mr-2"></i> Thêm vào giỏ hàng
                                </button>
                                <button type="button" class="btn btn-continue-shopping" data-bs-dismiss="modal">
                                    Tiếp tục mua sắm
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Size Chart Modal -->
<div class="modal" tabindex="-1" id="bangsize">
    <div class="modal-dialog">
        <div class="modal-content">
            <img src="/images/bangSize/bangsize.png" alt="Bảng size" />
        </div>
    </div>
</div>

<script>
    let selectedSize = null;
    let selectedColor = null;
    let availableQuantity = 0;

    function openQuickBuyModal(productId) {
        fetch('/api/product/quick-buy?id=' + productId)
            .then(function(response) { return response.json(); })
            .then(function(data) {
                // Populate product details
                document.getElementById('modalProductName').textContent = data.product.name || 'Sản phẩm không xác định';
                document.getElementById('modalProductPrice').textContent = new Intl.NumberFormat('vi-VN').format(data.product.price) + ' VND';
                document.getElementById('modalProductImg').src = data.images[0] || '/images/placeholder.png';
                document.getElementById('modalProductDescription').textContent = data.product.description || 'Không có mô tả sản phẩm.';
                document.getElementById('productId').value = data.product.id;
                document.getElementById('modalAvailability').querySelector('span').textContent = 'Đang kiểm tra...';

                // Reset form
                document.getElementById('quantity').value = '1';
                document.getElementById('selectedQuantity').value = '1';
                document.getElementById('errorMessage').style.display = 'none';
                document.getElementById('addToCartBtn').disabled = true;

                // Populate color options using string concatenation
                let colorOptionsHtml = '';
                for (let i = 0; i < data.colors.length; i++) {
                    let color = data.colors[i];
                    let checked = i === 0 ? ' checked' : '';
                    colorOptionsHtml += '<input type="radio" class="btn-check color-option" name="color" id="color_' + color.id + '" value="' + color.id + '" data-name="' + color.name + '" data-available-sizes="' + color.availableSizeIds.join(',') + '"' + checked + '>' +
                                       '<label for="color_' + color.id + '" class="color-option" style="background-color:' + color.colorCode + '" title="' + color.name + '"></label>';
                }
                document.getElementById('colorOptions').innerHTML = colorOptionsHtml;

                // Populate size options using string concatenation
                let sizeOptionsHtml = '';
                for (let i = 0; i < data.sizes.length; i++) {
                    let size = data.sizes[i];
                    let checked = i === 0 ? ' checked' : '';
                    sizeOptionsHtml += '<input type="radio" class="btn-check size-option" name="size" id="size_' + size.id + '" value="' + size.id + '" data-name="' + size.name + '" data-available-colors="' + size.availableColorIds.join(',') + '"' + checked + '>' +
                                      '<label for="size_' + size.id + '" class="btn btn-default">' + size.name + '</label>';
                }
                document.getElementById('sizeOptions').innerHTML = sizeOptionsHtml;

                // Initialize selections
                selectedColor = document.querySelector('input[name="color"]:checked') ? document.querySelector('input[name="color"]:checked').value : null;
                selectedSize = document.querySelector('input[name="size"]:checked') ? document.querySelector('input[name="size"]:checked').value : null;
                
                // Update hidden inputs
                if (selectedColor) document.getElementById('selectedColorId').value = selectedColor;
                if (selectedSize) document.getElementById('selectedSizeId').value = selectedSize;

                // Check availability
                checkAvailability(productId);

                // Open modal
                $('#quickBuyModal').modal('show');
            })
            .catch(function(error) {
                console.error('Error:', error);
                alert('Không thể tải thông tin sản phẩm.');
            });
    }

    // Handle color and size selection
    document.getElementById('colorOptions').addEventListener('change', function(e) {
        if (e.target.name === 'color') {
            selectedColor = e.target.value;
            document.getElementById('selectedColorId').value = selectedColor;
            let availableSizes = e.target.dataset.availableSizes.split(',').filter(function(id) { return id.trim() !== ''; });
            
            let sizeInputs = document.querySelectorAll('input[name="size"]');
            for (let i = 0; i < sizeInputs.length; i++) {
                let sizeInput = sizeInputs[i];
                let sizeId = sizeInput.value;
                let sizeLabel = sizeInput.nextElementSibling;
                if (availableSizes.length > 0 && !availableSizes.includes(sizeId)) {
                    sizeInput.disabled = true;
                    sizeLabel.classList.add('disabled');
                    if (selectedSize === sizeId) {
                        selectedSize = null;
                        sizeInput.checked = false;
                        document.getElementById('selectedSizeId').value = '';
                    }
                } else {
                    sizeInput.disabled = false;
                    sizeLabel.classList.remove('disabled');
                }
            }

            checkAvailability(document.getElementById('productId').value);
            updateButtonState();
        }
    });

    document.getElementById('sizeOptions').addEventListener('change', function(e) {
        if (e.target.name === 'size') {
            selectedSize = e.target.value;
            document.getElementById('selectedSizeId').value = selectedSize;
            let availableColors = e.target.dataset.availableColors.split(',').filter(function(id) { return id.trim() !== ''; });
            
            let colorInputs = document.querySelectorAll('input[name="color"]');
            for (let i = 0; i < colorInputs.length; i++) {
                let colorInput = colorInputs[i];
                let colorId = colorInput.value;
                let colorLabel = colorInput.nextElementSibling;
                if (availableColors.length > 0 && !availableColors.includes(colorId)) {
                    colorInput.disabled = true;
                    colorLabel.classList.add('disabled');
                    if (selectedColor === colorId) {
                        selectedColor = null;
                        colorInput.checked = false;
                        document.getElementById('selectedColorId').value = '';
                    }
                } else {
                    colorInput.disabled = false;
                    colorLabel.classList.remove('disabled');
                }
            }

            checkAvailability(document.getElementById('productId').value);
            updateButtonState();
        }
    });

    // Handle quantity changes
    document.getElementById('decreaseQuantity').addEventListener('click', function() {
        let quantityInput = document.getElementById('quantity');
        let currentValue = parseInt(quantityInput.value);
        if (currentValue > 1) {
            quantityInput.value = (currentValue - 1).toString();
            document.getElementById('selectedQuantity').value = quantityInput.value;
        }
        updateButtonState();
    });

    document.getElementById('increaseQuantity').addEventListener('click', function() {
        let quantityInput = document.getElementById('quantity');
        let currentValue = parseInt(quantityInput.value);
        if (currentValue < availableQuantity) {
            quantityInput.value = (currentValue + 1).toString();
            document.getElementById('selectedQuantity').value = quantityInput.value;
        } else {
            alert('Số lượng không được vượt quá số lượng còn lại: ' + availableQuantity);
        }
        updateButtonState();
    });

    document.getElementById('quantity').addEventListener('input', function(e) {
        let value = e.target.value.replace(/[^0-9]/g, '');
        if (value === '' || parseInt(value) < 1) {
            e.target.value = '1';
            document.getElementById('selectedQuantity').value = '1';
        } else if (parseInt(value) > availableQuantity) {
            e.target.value = availableQuantity.toString();
            document.getElementById('selectedQuantity').value = availableQuantity.toString();
            alert('Số lượng không được vượt quá số lượng còn lại: ' + availableQuantity);
        } else {
            e.target.value = value;
            document.getElementById('selectedQuantity').value = value;
        }
        updateButtonState();
    });

    // Check availability
    function checkAvailability(productId) {
        let quantityDisplay = document.getElementById('modalAvailability').querySelector('span');
        if (selectedSize && selectedColor) {
            quantityDisplay.textContent = 'Đang kiểm tra...';
            fetch('/product/quantity?productId=' + productId + '&sizeId=' + selectedSize + '&colorId=' + selectedColor)
                .then(function(response) { return response.json(); })
                .then(function(data) {
                    availableQuantity = data.quantity || 0;
                    quantityDisplay.textContent = availableQuantity > 0 ? 'Còn ' + availableQuantity + ' sản phẩm' : 'Hết hàng';
                    
                    let quantityInput = document.getElementById('quantity');
                    let currentQty = parseInt(quantityInput.value);
                    if (currentQty > availableQuantity) {
                        quantityInput.value = availableQuantity > 0 ? '1' : '0';
                        document.getElementById('selectedQuantity').value = quantityInput.value;
                    }
                    updateButtonState();
                })
                .catch(function(error) {
                    console.error('Error fetching quantity:', error);
                    availableQuantity = 0;
                    quantityDisplay.textContent = 'Lỗi kiểm tra số lượng';
                    updateButtonState();
                });
        } else {
            availableQuantity = 0;
            quantityDisplay.textContent = 'Vui lòng chọn kích thước và màu sắc';
            document.getElementById('quantity').value = '1';
            document.getElementById('selectedQuantity').value = '1';
            updateButtonState();
        }
    }

    // Update button state
    function updateButtonState() {
        let addToCartBtn = document.getElementById('addToCartBtn');
        let errorMessage = document.getElementById('errorMessage');
        let quantity = parseInt(document.getElementById('quantity').value);

        if (selectedSize && selectedColor && availableQuantity > 0 && quantity > 0) {
            addToCartBtn.disabled = false;
            errorMessage.style.display = 'none';
        } else {
            addToCartBtn.disabled = true;
            errorMessage.style.display = 'block';
        }
    }

    // Handle form submission
    document.getElementById('quickBuyForm').addEventListener('submit', function(e) {
        let quantity = parseInt(document.getElementById('quantity').value);
        
        if (!selectedSize || !selectedColor || availableQuantity === 0 || quantity === 0) {
            e.preventDefault();
            document.getElementById('errorMessage').style.display = 'block';
            return;
        }

        if (quantity > availableQuantity) {
            e.preventDefault();
            alert('Số lượng không được vượt quá số lượng còn lại: ' + availableQuantity);
            return;
        }

        // Form submission will proceed to /cart/add
    });
</script>