<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
    .card-img-top {
        height: 288px;
        object-fit: cover;
        object-position: center;
    }
</style>

<div class="text-center mt-5" style="padding-left:2rem">
    <H1 class="text-center" style="font-size: 30px;">SẢN PHẨM MỚI</H1>
</div>

<div class="row mt-5" style="padding-left:2rem">
    <c:forEach var="spNew" items="${sanPhamList}">
        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="${spNew.imgUrl}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">${spNew.name}</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;"><fmt:formatNumber
                        value="${spNew.price}"
                        groupingUsed="true"
                        maxFractionDigits="0"
                      /> VND</p>

                    <div class="text-center" style="font-size:5px;">
                        <a href="#" class="btn btn-outline-light text-black">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="/product?id=${spNew.id}" class="btn btn-outline-light text-black">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="text-center mt-4" style="padding-left:2rem">
    <a class="btn btn-outline-dark" href="/all-products">Xem Thêm</a>
</div>