<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Kết quả thanh toán</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        text-align: center;
        margin-top: 50px;
      }
      .container {
        width: 50%;
        margin: auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 10px;
      }
      .success {
        color: green;
        font-size: 20px;
      }
      .fail {
        color: red;
        font-size: 20px;
      }
      .info {
        margin-top: 20px;
        font-size: 18px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <c:choose>
        <c:when test="${message eq 'Thanh toán thành công!'}">
          <p class="success">${message}</p>
        </c:when>
        <c:otherwise>
          <p class="fail">${message}</p>
        </c:otherwise>
      </c:choose>

      <div class="info">
        <p><strong>Mã giao dịch:</strong> ${transactionId}</p>
        <p><strong>Số tiền:</strong> ${amount} VND</p>
        <p><strong>Thông tin đơn hàng:</strong> ${orderInfo}</p>
      </div>

      <a href="/">Quay lại trang chủ</a>
    </div>
  </body>
</html>
