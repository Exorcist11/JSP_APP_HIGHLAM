<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Kết Quả Thanh Toán</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <style>
      body {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
          Oxygen, Ubuntu, Cantarell, sans-serif;
        background-color: #f8f9fa;
        padding-top: 80px;
      }
      .header {
        background-color: white;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 15px 0;
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 100;
      }
      .breadcrumb {
        padding: 10px 0;
        margin-bottom: 0;
        background-color: transparent;
      }
      .result-container {
        background-color: white;
        border-radius: 8px;
        padding: 30px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
      }
      .success-icon {
        font-size: 80px;
        color: #28a745;
        margin-bottom: 20px;
      }
      .failed-icon {
        font-size: 80px;
        color: #dc3545;
        margin-bottom: 20px;
      }
      .result-title {
        font-size: 24px;
        font-weight: 600;
        margin-bottom: 20px;
      }
      .detail-item {
        display: flex;
        justify-content: space-between;
        padding: 12px 0;
        border-bottom: 1px solid #eee;
      }
      .detail-item:last-child {
        border-bottom: none;
      }
      .btn-continue {
        background-color: #000;
        color: white;
        padding: 12px 25px;
        border-radius: 4px;
        font-weight: 600;
        transition: all 0.3s;
      }
      .btn-continue:hover {
        background-color: #333;
        color: white;
      }
      .btn-order-history {
        background-color: white;
        color: #000;
        padding: 12px 25px;
        border-radius: 4px;
        border: 1px solid #000;
        font-weight: 600;
        transition: all 0.3s;
      }
      .btn-order-history:hover {
        background-color: #f1f1f1;
        color: #000;
      }
      .receipt-box {
        background-color: #f9f9f9;
        border-radius: 6px;
        padding: 20px;
        margin-top: 20px;
      }
      .amount {
        font-size: 24px;
        font-weight: 700;
      }
    </style>
  </head>
  <body>
    <!-- Header with breadcrumb -->
    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

    <!-- Main content -->
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="result-container text-center">
            <!-- Success state - this is controlled by the vnp_ResponseCode -->
            <div id="successState" class="mb-4">
              <i class="fas fa-check-circle success-icon"></i>
              <h2 class="result-title">${orderType == "COD" ? "Đặt hàng thành công!" : "Thanh toán thành công!"}</h2>
              <p class="text-muted">
                Cảm ơn bạn đã mua hàng tại cửa hàng chúng tôi. Đơn hàng của bạn
                đã được xác nhận và đang được xử lý.
              </p>
            </div>

            <!-- Failed state - will be shown when vnp_ResponseCode is not "00" -->
            <div id="failedState" class="mb-4" style="display: none">
              <i class="fas fa-times-circle failed-icon"></i>
              <h2 class="result-title">Thanh toán thất bại!</h2>
              <p class="text-muted">
                Rất tiếc, giao dịch của bạn không thành công. Vui lòng thử lại
                hoặc chọn phương thức thanh toán khác.
              </p>
            </div>

            <div class="receipt-box">
              <h4 class="mb-4">Chi tiết đơn hàng</h4>

              <div class="detail-item">
                <span>Mã giao dịch:</span>
                <span id="transactionId">${transactionId}</span>
              </div>

              <div class="detail-item">
                <span>Thông tin đơn hàng:</span>
                <span id="orderInfo">${orderInfo}</span>
              </div>

              <div class="detail-item">
                <span>Tổng tiền:</span>
                <span class="amount" id="amount"
                  >${amount != null ? Integer.parseInt(amount) / 100 : 0}
                  VNĐ</span
                >
              </div>

              <div class="detail-item">
                <span>Phương thức thanh toán:</span>
                <span>${orderType == "COD" ? "COD" : "VNPay"}</span>
              </div>

              <div class="detail-item">
                <span>Thời gian:</span>
                <span id="time"></span>
              </div>
            </div>

            <div class="mt-3">
              <a href="/" class="btn btn-dark p-3">TIẾP TỤC MUA SẮM</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        // Get URL parameters
        const urlParams = new URLSearchParams(window.location.search);
        const responseCode = urlParams.get("vnp_ResponseCode");

        // Set current date and time
        const now = new Date();
        document.getElementById("time").textContent =
          now.toLocaleString("vi-VN");

        // Show success or failed state based on response code
        if (responseCode && responseCode !== "00") {
          document.getElementById("successState").style.display = "none";
          document.getElementById("failedState").style.display = "block";
          document
            .getElementById("failedState")
            .querySelector(".result-title").textContent =
            "Thanh toán thất bại! Mã lỗi: " + responseCode;
        }

        // Format the amount (divide by 100 as VNPay amount is multiplied by 100)
        const amountElement = document.getElementById("amount");
        if (amountElement.textContent) {
          const amount = parseFloat(
            amountElement.textContent.replace(" VNĐ", "").trim()
          );
          if (!isNaN(amount)) {
            const formattedAmount = new Intl.NumberFormat("vi-VN").format(
              amount
            );
            amountElement.textContent = formattedAmount + " VNĐ";
          }
        }
      });
    </script>
  </body>
</html>
