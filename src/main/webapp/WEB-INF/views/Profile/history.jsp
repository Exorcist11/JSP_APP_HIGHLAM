<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>T-SHIRT LUXURY</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <link rel="shortcut icon" href="../images/favicon.png" type="image/x-icon" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
    <style>
        body {
            background-color: #f1f3f5;
            font-family: 'Poppins', sans-serif;
        }
        .order-container {
            padding: 20px;
        }
        .order-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
        }
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e9ecef;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }
        .order-code a {
            color: #007bff;
            font-weight: 600;
            text-decoration: none;
        }
        .order-code a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        .order-status {
            font-size: 0.9rem;
        }
        .status-pending { background-color: #ffc107; }
        .status-delivered { background-color: #28a745; }
        .status-cancelled { background-color: #dc3545; }
        .order-details p {
            margin: 5px 0;
            font-size: 0.95rem;
        }
        .order-details i {
            margin-right: 8px;
            color: #6c757d;
        }
        .search-bar {
            margin-bottom: 20px;
        }
        @media (max-width: 768px) {
            .sidebar {
                position: fixed;
                top: 90px;
                left: -250px;
                width: 250px;
                transition: left 0.3s ease;
                z-index: 1000;
            }
            .sidebar.active {
                left: 0;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

    <div class="container-fluid" style="margin-top: 90px">
        <div class="row flex-nowrap">
            <div class="col-auto col-md-3 col-xl-2 px-0 sidebar">
                <jsp:include page="/WEB-INF/views/Profile/fragments/sideBar.jsp" />
            </div>
            <div class="col py-3 order-container">
                <h2 class="text-center mb-4"><i class="fas fa-history me-2"></i>Lịch sử mua hàng</h2>

                <!-- Search Bar -->
                <div class="search-bar">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                        <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm đơn hàng...">
                    </div>
                </div>

                <!-- Order Cards -->
                <div class="row">
                    <c:forEach var="order" items="${orders}">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="order-card">
                                <div class="order-header">
                                    <div class="order-code">
                                        <a href="/orderDetail?code=${order.code}">#${order.code}</a>
                                    </div>
                                    <span class="badge order-status status-${order.status.toLowerCase()}">${order.status}</span>
                                </div>
                                <div class="order-details">
                                    <p><i class="fas fa-calendar-alt"></i>
                                        <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm:ss" />
                                    </p>
                                    <p><i class="fas fa-user"></i>${order.recipientName}</p>
                                    <p><i class="fas fa-map-marker-alt"></i>${order.recipientAddress}</p>
                                    <p><i class="fas fa-money-bill-wave"></i>
                                        <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0" /> VND
                                    </p>
                                </div>
                                <a href="/orderDetail?code=${order.code}" class="btn btn-outline-primary btn-sm w-100 mt-3">
                                    <i class="fas fa-eye me-1"></i> Xem chi tiết
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

    <script>
        // Toggle sidebar on mobile
        $(document).ready(function () {
            $('.sidebar-toggle').click(function () {
                $('.sidebar').toggleClass('active');
            });

            // Search functionality
            $('#searchInput').on('keyup', function () {
                var value = $(this).val().toLowerCase();
                $('.order-card').filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</body>
</html>