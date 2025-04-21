<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html> 
<html> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tìm kiếm - ${keyword}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon"/>
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
        .search-title {
            font-size: 28px;
            font-weight: 700;
            position: relative;
            margin-bottom: 30px;
            padding-bottom: 15px;
        }
        
        .search-title:after {
            content: '';
            position: absolute;
            display: block;
            width: 80px;
            height: 3px;
            background: #2ecc71;
            bottom: 0;
            left: 0;
        }
        
        .search-keyword {
            color: #2ecc71;
            font-weight: 700;
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
        
        .card-img-top {
            height: 288px;
            object-fit: cover;
            object-position: center;
        }
        
        .card-body {
            padding: 15px;
        }
        
        .card-title {
            font-size: 14px;
            font-weight: 500;
            height: 40px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            margin-bottom: 10px;
        }
        
        .card-text {
            font-size: 16px;
            font-weight: 700;
            color: #2ecc71;
            margin-bottom: 15px;
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 12px;
        }

        .action-buttons .btn {
            font-size: 13px;
            font-weight: 500;
            padding: 8px 16px;
            transition: all 0.3s ease;
        }
        
        .action-buttons .btn-quick-buy {
            background-color: black;
            color: white;
            border-radius: 4px;
            font-weight: 500;
            padding: 8px 16px;
            transition: all 0.3s ease;
            font-size: 13px;
            width: 48%;
        }
        
        .action-buttons .btn-quick-buy:hover {
            background-color: #c0392b;
            transform: scale(1.02);
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
            font-size: 13px;
            width: 48%;
        }
        
        .btn-details:hover {
            background-color: #e9ecef;
            color: #212529;
            transform: scale(1.02);
        }
        
        .icon-cart, .icon-eye {
            margin-right: 6px;
        }
        
        /* No Results Message */
        .no-results {
            text-align: center;
            padding: 40px 0;
            background-color: #f8f9fa;
            border-radius: 8px;
            margin-top: 20px;
        }
        
        .no-results i {
            font-size: 48px;
            color: #6c757d;
            margin-bottom: 15px;
        }
        
        .no-results h4 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .no-results p {
            font-size: 16px;
            color: #6c757d;
            margin-bottom: 20px;
        }
        
        .btn-back-home {
            background-color: #2ecc71;
            color: white;
            border-radius: 4px;
            font-weight: 500;
            padding: 10px 20px;
            transition: all 0.3s ease;
        }
        
        .btn-back-home:hover {
            background-color: #27ae60;
            color: white;
        }
        
        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .search-title {
                font-size: 24px;
            }
        }
        
        @media (max-width: 768px) {
            .col-3 {
                width: 50%;
            }
        }
        
        @media (max-width: 576px) {
            .col-3 {
                width: 100%;
            }
            
            .card {
                width: 100% !important;
            }
        }
    </style>
</head>
<body>
    <!-- Header cố định ở trên cùng -->
    <header>
        <jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
    </header>
    
    <!-- Nội dung chính -->
    <div class="container" style="margin-top: 90px;">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a class="home" href="/"><i class="fas fa-home"></i> Trang chủ</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Kết quả tìm kiếm</li>
            </ol>
        </nav>
        
        <h2 class="search-title">Kết quả tìm kiếm: <span class="search-keyword">"${keyword}"</span></h2>
        
        <!-- Danh sách sản phẩm -->
        <c:if test="${not empty products}">
            <div class="row">
                <c:forEach var="product" items="${products}">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                        <div class="product-card card">
                            <div class="position-relative">
                                <img src="${product.imgUrl}" class="card-img-top" alt="${product.name}">
                            </div>
                            <div class="card-body text-center">
                                <h5 class="card-title">${product.name}</h5>
                                <p class="card-text">
                                    <fmt:formatNumber value="${product.price}" groupingUsed="true" maxFractionDigits="0"/> VND
                                </p>
                                
                                <div class="action-buttons">
                                    <a href="/add-to-cart?id=${product.id}" class="btn btn-quick-buy">
                                        <i class="fas fa-shopping-cart icon-cart"></i>Mua Nhanh
                                    </a>
                                    <a href="/product?id=${product.id}" class="btn btn-details">
                                        <i class="fas fa-eye icon-eye"></i>Chi tiết
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        
        <!-- Không tìm thấy sản phẩm -->
        <c:if test="${empty products}">
            <div class="no-results">
                <i class="fas fa-search"></i>
                <h4>Không tìm thấy sản phẩm</h4>
                <p>Không tìm thấy sản phẩm nào phù hợp với từ khóa "<span class="search-keyword">${keyword}</span>".</p>
                <p>Vui lòng thử lại với từ khóa khác hoặc xem các sản phẩm có sẵn của chúng tôi.</p>
                <a href="/" class="btn btn-back-home">Quay lại trang chủ</a>
            </div>
        </c:if>
        
        <!-- Đề xuất sản phẩm liên quan -->
        <c:if test="${not empty relatedProducts}">
            <div class="mt-5">
                <h3 class="mb-4">Có thể bạn quan tâm</h3>
                <div class="row">
                    <c:forEach var="related" items="${relatedProducts}">
                        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                            <div class="product-card card">
                                <div class="position-relative">
                                    <img src="${related.imgUrl}" class="card-img-top" alt="${related.name}">
                                </div>
                                <div class="card-body text-center">
                                    <h5 class="card-title">${related.name}</h5>
                                    <p class="card-text">
                                        <fmt:formatNumber value="${related.price}" groupingUsed="true" maxFractionDigits="0"/> VND
                                    </p>
                                    
                                    <div class="action-buttons">
                                        <a href="/add-to-cart?id=${related.id}" class="btn btn-quick-buy">
                                            <i class="fas fa-shopping-cart icon-cart"></i>Mua Nhanh
                                        </a>
                                        <a href="/product?id=${related.id}" class="btn btn-details">
                                            <i class="fas fa-eye icon-eye"></i>Chi tiết
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </div>
    
    <!-- Footer -->
    <footer class="container py-5">
        <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
    </footer>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</body>
</html>