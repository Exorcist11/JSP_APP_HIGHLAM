<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="text-center mt-5" style="padding-left:2rem">
    <H1 class="text-center" style="font-size: 30px;">SẢN PHẨM MỚI</H1>
</div>

<div class="row mt-5" style="padding-left:2rem">
    <c:forEach var="spNew" items="${sanPhamList}">
        <div class="col-3">
            <div class="card" style="width: 18rem; border-style:none">
                <img src="../images/ao_phong_boxy/DEVOTUS/black.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center" style="font-size:13px">${spNew.tenSanPham}</h5>
                    <p class="card-text fw-bold text-center" style="font-size: 14px;">${spNew.gia}</p>

                    <div class="text-center" style="font-size:5px">
                        <a href="#" class="btn btn-outline-light">
                            <i class="fa-solid fa-cart-shopping"></i>Mua Nhanh</a>
                        <a href="/t-shirt-luxury/san-pham-chi-tiet-detail?idSPDetail=${spNew.id}" class="btn btn-outline-light">
                            <i class="fa-solid fa-eye"></i>Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="text-center mt-4" style="padding-left:2rem">
    <a class="btn btn-outline-dark" href="/t-shirt-luxury/xem-them">Xem Thêm</a>
</div>