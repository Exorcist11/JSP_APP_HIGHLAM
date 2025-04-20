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
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="../css/danhMucAoNam.css" rel="stylesheet"/>
    <style>
        .image-product {
            height: 288px;
            object-fit: cover;
            object-position: center;
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

    <nav class="navbar-expand-lg">
        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
            <h4 class="mt-text">Bộ Lọc</h4>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
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
                            <!-- Add other colors as needed -->
                        </div>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        Kích Cỡ
                    </button>
                    <ul class="dropdown-menu p-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="sizeS"/>
                            <label class="form-check-label" for="sizeS">S</label>
                        </div>
                        <!-- Add other sizes as needed -->
                    </ul>
                </li>
                <li class="nav-item dropdown">
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
            <div class="col-md-3 mb-4">
                <div class="card product-card">
                    <img alt="${p.name}" src="${p.imgUrl}" class="card-img-top image-product"/>
                    <div class="product-info">
                        <p>${p.name}</p>
                        <p class="price">
                            <fmt:formatNumber value="${p.price}" groupingUsed="true" maxFractionDigits="0"/> VND
                        </p>
                    </div>
                    <div class="product-actions">
                        <button class="btn btn-dark">
                            <i class="fas fa-shopping-cart"></i> Mua nhanh
                        </button>
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
                <a class="page-link" href="/all-products?page=${currentPage - 1}&size=${pageSize}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link" href="/all-products?page=${i}&size=${pageSize}">${i + 1}</a>
                </li>
            </c:forEach>
            <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                <a class="page-link" href="/all-products?page=${currentPage + 1}&size=${pageSize}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>

    <div class="row mt-5" style="padding-left: 2rem">
        <img src="https://pos.nvncdn.com/be3159-662/bn/20240921_h3xCoY0r.gif" alt=""/>
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
    });
</script>
</body>
</html>