<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Tất cả sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="../css/danhMucAoNam.css" rel="stylesheet"/>
    <style>
        /* Breadcrumb Styling */
        .breadcrumb {
            margin-top: 20px;
            font-size: 14px;
        }
        
        .breadcrumb a {
            color: #333;
            text-decoration: none;
        }
        
        .breadcrumb a:hover {
            color: #2ecc71;
        }
        
        /* Page Title */
        h1 {
            font-size: 28px;
            font-weight: 700;
            position: relative;
            margin-bottom: 30px;
            padding-bottom: 15px;
        }
        
        h1:after {
            content: '';
            position: absolute;
            display: block;
            width: 80px;
            height: 3px;
            background: #2ecc71;
            bottom: 0;
            left: 0;
        }
        
        /* Filter Section */
        .nav-item .btn {
            margin-right: 10px;
            font-size: 14px;
            border: 1px solid #dee2e6;
        }
        
        .mt-text {
            font-size: 18px;
            margin-right: 15px;
            font-weight: 600;
        }
        
        .sort-container {
            margin-left: auto;
            display: flex;
            align-items: center;
        }
        
        .sort-label {
            margin-right: 10px;
            font-size: 14px;
        }
        
        .form-select {
            width: auto;
            font-size: 14px;
        }
        
        /* Product Card Styling */
        .product-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 20px;
            border: none;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .image-product {
            min-height: 288px;
            height: 288px;
            object-fit: cover;
            object-position: center;
        }
        
        .product-info {
            padding: 15px;
            text-align: center;
        }
        
        .product-info p:first-child {
            font-size: 14px;
            font-weight: 500;
            height: 40px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            margin-bottom: 10px;
        }
        
        .price {
            font-size: 16px;
            font-weight: 700;
            color: black;
            margin-bottom: 15px;
        }
        
        .product-actions {
            display: flex;
            flex-direction: row;
            gap: 8px;
            padding: 0 15px 15px;
        }
        
        .product-actions .btn {
            font-size: 14px;
            padding: 8px 0;
            text-align: center;
            transition: all 0.3s ease;
            border-radius: 4px;
        }
        
        .product-actions .btn-dark {
            background-color: black;
            border-color: black;
        }
        
        .product-actions .btn-dark:hover {
            background-color: #c0392b;
            border-color: #c0392b;
            transform: scale(1.02);
        }
        
        .product-actions .btn-outline-dark {
            color: #343a40;
            border-color: #dee2e6;
        }
        
        .product-actions .btn-outline-dark:hover {
            background-color: #f8f9fa;
            color: #343a40;
            transform: scale(1.02);
        }
        
        .product-actions i {
            margin-right: 5px;
        }
        
        /* Pagination Styling */
        .pagination {
            justify-content: center;
            margin: 30px 0;
        }
        
        .pagination .page-link {
            color: #333;
            border-color: #dee2e6;
            margin: 0 3px;
            border-radius: 4px;
        }
        
        .pagination .page-item.active .page-link {
            background-color: #2ecc71;
            border-color: #2ecc71;
        }
        
        .pagination .page-link:hover {
            background-color: #f8f9fa;
            color: #333;
        }
        
        .pagination .page-item.disabled .page-link {
            color: #6c757d;
        }
        
        /* Color Filters */
        .color-box {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin: 5px;
            cursor: pointer;
            border: 2px solid transparent;
            transition: all 0.2s ease;
        }
        
        .color-checkbox {
            display: none;
        }
        
        .color-checkbox:checked + .color-box {
            border-color: #333;
            transform: scale(1.1);
        }
        
        /* Banner */
        .banner-container {
            margin-top: 30px;
            margin-bottom: 30px;
            overflow: hidden;
            border-radius: 8px;
        }
        
        .banner-container img {
            width: 100%;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }
        
        .banner-container img:hover {
            transform: scale(1.01);
        }
        
        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .sort-container {
                margin-top: 15px;
                margin-left: 0;
            }
        }
        
        @media (max-width: 768px) {
            .product-actions {
                flex-direction: column;
            }
            
            .product-actions .btn {
                width: 100%;
                margin-bottom: 8px;
            }
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
</header>

<div class="container" style="margin-top: 90px;">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="home" href="/"><i class="fas fa-home"></i> Trang chủ</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">Tất cả sản phẩm</li>
        </ol>
    </nav>
    <h1 class="mt-3">Tất cả sản phẩm</h1>

    <nav class="navbar-expand-lg mb-4">
        <div class="collapse navbar-collapse d-flex flex-wrap align-items-center" id="navbarNavDarkDropdown">
            <h4 class="mt-text mb-0">Bộ Lọc</h4>
            <ul class="navbar-nav d-flex flex-row flex-wrap">
                <li class="nav-item dropdown mb-2">
                    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        Màu Sắc
                    </button>
                    <ul class="dropdown-menu p-3">
                        <div class="d-flex flex-wrap">
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorRed"/>
                                <div class="color-box" style="background-color: red"></div>
                            </label>
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorBlue"/>
                                <div class="color-box" style="background-color: blue"></div>
                            </label>
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorGreen"/>
                                <div class="color-box" style="background-color: green"></div>
                            </label>
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorBlack"/>
                                <div class="color-box" style="background-color: black"></div>
                            </label>
                            <label>
                                <input type="checkbox" class="color-checkbox" id="colorWhite"/>
                                <div class="color-box" style="background-color: white; border: 1px solid #ddd"></div>
                            </label>
                        </div>
                    </ul>
                </li>
                <li class="nav-item dropdown mb-2">
                    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        Kích Cỡ
                    </button>
                    <ul class="dropdown-menu p-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="sizeS"/>
                            <label class="form-check-label" for="sizeS">S</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="sizeM"/>
                            <label class="form-check-label" for="sizeM">M</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="sizeL"/>
                            <label class="form-check-label" for="sizeL">L</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="sizeXL"/>
                            <label class="form-check-label" for="sizeXL">XL</label>
                        </div>
                    </ul>
                </li>
                <li class="nav-item dropdown mb-2">
                    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        Khoảng Giá
                    </button>
                    <ul class="dropdown-menu p-3">
                        <div class="form-check">
                            <input class="form-check-input price-filter" type="checkbox" id="price1" data-min="0"
                                   data-max="200000"/>
                            <label class="form-check-label" for="price1">Dưới 200,000</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input price-filter" type="checkbox" id="price2" data-min="200000"
                                   data-max="500000"/>
                            <label class="form-check-label" for="price2">Từ 200,000 - 500,000</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input price-filter" type="checkbox" id="price3" data-min="500000"
                                   data-max="1000000"/>
                            <label class="form-check-label" for="price3">Từ 500,000 - 1,000,000</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input price-filter" type="checkbox" id="price4" data-min="1000000"
                                   data-max="9999999"/>
                            <label class="form-check-label" for="price4">Trên 1,000,000</label>
                        </div>
                    </ul>
                </li>
            </ul>

            <div class="sort-container">
                <span class="sort-label">Sắp xếp theo:</span>
                <select class="form-select"
                        onchange="location = '/all-products?page=0&size=${pageSize}&sort=' + this.value;">
                    <option value="createdAt,desc" ${sort == 'createdAt,desc' ? 'selected' : ''}>Mới nhất</option>
                    <option value="price,desc" ${sort == 'price,desc' ? 'selected' : ''}>Giá giảm dần</option>
                    <option value="price,asc" ${sort == 'price,asc' ? 'selected' : ''}>Giá tăng dần</option>
                </select>
            </div>
        </div>
    </nav>

    <div class="row">
        <c:forEach items="${products}" var="p">
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="product-card">
                    <div class="position-relative">
                        <img alt="${p.name}" src="${p.imgUrl}" class="image-product"/>
                    </div>
                    <div class="product-info">
                        <p>${p.name}</p>
                        <p class="price">
                            <fmt:formatNumber value="${p.price}" groupingUsed="true" maxFractionDigits="0"/> VND
                        </p>
                    </div>
                    <div class="product-actions">
                        <a href="/add-to-cart?id=${p.id}" class="btn btn-dark">
                            <i class="fas fa-shopping-cart"></i> Mua nhanh
                        </a>
                        <a href="/product?id=${p.id}" class="btn btn-outline-dark">
                            <i class="fas fa-eye"></i> Xem chi tiết
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                <a class="page-link" href="/all-products?page=${currentPage - 1}&size=${pageSize}&sort=${sort}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link" href="/all-products?page=${i}&size=${pageSize}&sort=${sort}">${i + 1}</a>
                </li>
            </c:forEach>
            <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                <a class="page-link" href="/all-products?page=${currentPage + 1}&size=${pageSize}&sort=${sort}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>

    <div class="banner-container">
        <img src="https://pos.nvncdn.com/be3159-662/bn/20240921_h3xCoY0r.gif" alt="Banner quảng cáo"/>
    </div>
</div>

<footer class="container py-5">
    <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        // Xử lý lọc theo giá
        $('.price-filter').change(function () {
            let minPrice = null;
            let maxPrice = null;
            $('.price-filter:checked').each(function () {
                let min = $(this).data('min');
                let max = $(this).data('max');
                if (minPrice == null || min < minPrice) minPrice = min;
                if (maxPrice == null || max > maxPrice) maxPrice = max;
            });
            let url = '/all-products?page=0&size=${pageSize}&sort=${sort}';
            if (minPrice != null && maxPrice != null) {
                url += '&minPrice=' + minPrice + '&maxPrice=' + maxPrice;
            }
            window.location.href = url;
        });

        // Animation cho phần sản phẩm
        $('.product-card').each(function(i) {
            $(this).css('animation-delay', (i * 0.1) + 's');
        });

        // Xử lý navbar collapse
        $('#navbarNavDarkDropdown').addClass('show');
    });
</script>
</body>
</html>