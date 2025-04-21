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
                            <a href="/add-to-cart?id=${spNew.id}" class="btn btn-quick-buy">
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