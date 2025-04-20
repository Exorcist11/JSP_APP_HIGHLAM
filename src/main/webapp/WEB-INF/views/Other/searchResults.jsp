<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <style>
  
        .product-card {
            transition: transform 0.3s;
            margin-bottom: 20px;
        }
        .product-card:hover {
            transform: translateY(-5px);
        }
        .product-img {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <!-- Header cố định ở trên cùng -->
    <header>
        <jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
    </header>

    <!-- Nội dung chính -->
    <div class="container mt-4" style="padding-top: 90px;">
        <h2>Kết quả tìm kiếm: <span style="color: red;">${keyword}</span></h2>

        <!-- Danh sách sản phẩm -->
        <c:if test="${not empty products}">
            <div class="row">
                <c:forEach var="product" items="${products}">
                    <div class="col-3">
                        <div class="card" style="width: 18rem; border-style:none">
                            <img src="${product.imgUrl}" class="card-img-top" style="width: 288px; object-fit: cover; object-position: center;" alt="...">
                            <div class="card-body">
                                <h5 class="card-title text-center" style="font-size:13px">${product.name}</h5>
                                <p class="card-text fw-bold text-center" style="font-size: 14px;"><fmt:formatNumber
                                    value="${product.price}"
                                    groupingUsed="true"
                                    maxFractionDigits="0"
                                  /> VND</p>
            
                                <div class="text-center" style="font-size:5px;">
                                    <a href="#" class="btn btn-outline-light text-black">
                                        <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                                    <a href="/product?id=${product.id}" class="btn btn-outline-light text-black">
                                        <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- Không tìm thấy sản phẩm -->
        <c:if test="${empty products}">
            <div class="alert alert-info">
                Không tìm thấy sản phẩm cho từ khóa "<span>${keyword}</span>".
            </div>
        </c:if>
    </div>

    <!-- Footer -->
    <footer class="container py-5">
        <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
