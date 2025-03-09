<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${empty SP}">
    <tr>
        <td colspan="6" style="text-align: center;">Không tìm thấy sản phẩm nào!</td>
    </tr>
</c:if>
<c:forEach items="${SP}" var="sp" varStatus="i">
    <tr>
        <td>${i.index + 1}</td>
        <td>${sp.maSanPham}</td>
        <td>${sp.tenSanPham}</td>
        <td>${sp.danhMuc.tenDanhMuc}</td>
        <td>${sp.trangThai == 1 ? "Đang Bán" : "Chưa Bán"}</td>
        <td>
            <a class="btn btn-themCTSP" data-bs-toggle="modal" data-bs-target="#themSanPham"
               data-id="${sp.id}" href="#">
                <i class="fa-solid fa-check"></i>
            </a>
        </td>
    </tr>
</c:forEach>
