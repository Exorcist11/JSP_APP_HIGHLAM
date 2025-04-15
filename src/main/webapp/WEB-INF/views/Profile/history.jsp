<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order History | T-SHIRT LUXURY</title>
    <link rel="stylesheet" href="../css/style.css" />
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
      :root {
        --primary-color: #2c3e50;
        --secondary-color: #3498db;
        --accent-color: #e74c3c;
        --light-bg: #f8f9fa;
        --dark-bg: #343a40;
        --success-color: #2ecc71;
        --warning-color: #f39c12;
        --info-color: #3498db;
      }
      
      .order-table {
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      }
      
      .order-table thead {
        background-color: var(--primary-color);
        color: white;
      }
      
      .order-table th {
        padding: 15px;
        font-weight: 500;
      }
      
      .order-table td {
        padding: 12px 15px;
        vertical-align: middle;
      }
      
      .order-table tbody tr {
        transition: background-color 0.2s ease;
      }
      
      .order-table tbody tr:hover {
        background-color: rgba(0, 0, 0, 0.02);
      }
      
      .status-badge {
        padding: 5px 10px;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 600;
        display: inline-block;
        min-width: 80px;
        text-align: center;
      }
      
      .status-pending {
        background-color: var(--warning-color);
        color: white;
      }
      
      .status-completed {
        background-color: var(--success-color);
        color: white;
      }
      
      .status-cancelled {
        background-color: var(--accent-color);
        color: white;
      }
      
      .status-shipped {
        background-color: var(--info-color);
        color: white;
      }
      
      .order-link {
        color: var(--secondary-color);
        font-weight: 500;
        text-decoration: none;
        transition: color 0.2s ease;
      }
      
      .order-link:hover {
        color: #2980b9;
        text-decoration: underline;
      }
      
      .empty-state {
        text-align: center;
        padding: 50px 20px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      }
      
      .empty-state i {
        font-size: 3rem;
        color: #bdc3c7;
        margin-bottom: 20px;
      }
      
      .search-filter {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        margin-bottom: 30px;
      }
      
      .pagination-nav {
        display: flex;
        justify-content: center;
        margin-top: 30px;
      }
      
      .sidebar-minimized {
        width: 80px !important;
        overflow: hidden;
        transition: width 0.3s ease;
      }
      
      .sidebar-minimized .nav-link {
        text-align: center;
        padding: 10px 5px;
      }
      
      .sidebar-minimized .nav-link span {
        display: none;
      }
      
      .sidebar-minimized .nav-link i {
        font-size: 1.5rem;
        margin-right: 0;
      }
      
      .sidebar-toggle {
        position: absolute;
        right: -15px;
        top: 20px;
        background: white;
        border-radius: 50%;
        width: 30px;
        height: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        cursor: pointer;
        z-index: 100;
      }
      
      .action-btn {
        padding: 5px 10px;
        font-size: 0.85rem;
        display: inline-flex;
        align-items: center;
        gap: 5px;
      }
    </style>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />
    <!-- End Header -->

    <div class="container-fluid" style="margin-top: 90px">
      <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-0 position-relative">
          
          <jsp:include page="/WEB-INF/views/Profile/fragments/sideBar.jsp" />
        </div>

        <div class="col py-3">
          <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4">
              <h2 class="mb-0">Lịch sử đơn hàng</h2>
              
            </div>
        
            
            <c:choose>
              <c:when test="${empty orders}">
                <div class="empty-state">
                  <i class="bi bi-box-seam"></i>
                  <h3>Không có đơn hàng</h3>
                  <p class="text-muted">Bạn chưa có đơn hàng nào. Hãy mua sắm để xem lịch sử đơn hàng tại đây.</p>
                  <a href="/products" class="btn btn-primary">Mua sắm ngay</a>
                </div>
              </c:when>
              <c:otherwise>
                <div class="table-responsive order-table">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>MÃ ĐƠN</th>
                        <th>NGÀY ĐẶT</th>
                        <th>TRẠNG THÁI</th>
                        <th>NGƯỜI NHẬN</th>
                        <th>ĐỊA CHỈ</th>
                        <th>TỔNG TIỀN</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="order" items="${orders}">
                        <tr>
                          <td>
                            <a href="/orderDetail?code=${order.code}" class="order-link">#${order.code}</a>
                          </td>
                          <td>
                            <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm" />
                          </td>
                          <td>
                            <span class="status-badge 
                              <c:choose>
                                <c:when test="${order.status == 'COMPLETED'}">status-completed</c:when>
                                <c:when test="${order.status == 'CANCELLED'}">status-cancelled</c:when>
                                <c:when test="${order.status == 'SHIPPED'}">status-shipped</c:when>
                                <c:otherwise>status-pending</c:otherwise>
                              </c:choose>">
                              <c:choose>
                                <c:when test="${order.status == 'COMPLETED'}">Hoàn thành</c:when>
                                <c:when test="${order.status == 'CANCELLED'}">Đã hủy</c:when>
                                <c:when test="${order.status == 'CONFIRMED'}">Đang giao</c:when>
                                <c:otherwise>Chờ xử lý</c:otherwise>
                              </c:choose>
                            </span>
                          </td>
                          <td>${order.recipientName}</td>
                          <td>
                            <div class="text-truncate" style="max-width: 200px;" title="${order.recipientAddress}">
                              ${order.recipientAddress}
                            </div>
                          </td>
                          <td class="fw-bold text-end">
                            <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0" />₫
                          </td>
                          <td>
                            <a href="/orderDetail?code=${order.code}" class="btn btn-sm action-btn btn-outline-primary">
                              <i class="bi bi-eye"></i> Xem
                            </a>
                            
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                
                <!-- <nav class="pagination-nav">
                  <ul class="pagination">
                    <li class="page-item disabled">
                      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Trước</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#">Sau</a>
                    </li>
                  </ul>
                </nav> -->
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
    
    <script>
      function toggleSidebar() {
        const sidebar = document.querySelector('.col-auto.col-md-3.col-xl-2');
        const toggleIcon = document.querySelector('.sidebar-toggle i');
        sidebar.classList.toggle('sidebar-minimized');
        
        if (sidebar.classList.contains('sidebar-minimized')) {
          toggleIcon.classList.remove('bi-chevron-left');
          toggleIcon.classList.add('bi-chevron-right');
        } else {
          toggleIcon.classList.remove('bi-chevron-right');
          toggleIcon.classList.add('bi-chevron-left');
        }
      }
      
      function printOrders() {
        // Implement print functionality
        window.print();
      }
      
      function exportToExcel() {
        // Implement export to Excel functionality
        alert('Chức năng xuất file Excel sẽ được thực hiện ở đây');
      }
      
      // Search functionality
      document.getElementById('searchInput').addEventListener('input', function(e) {
        const searchTerm = e.target.value.toLowerCase();
        const rows = document.querySelectorAll('.order-table tbody tr');
        
        rows.forEach(row => {
          const rowText = row.textContent.toLowerCase();
          if (rowText.includes(searchTerm)) {
            row.style.display = '';
          } else {
            row.style.display = 'none';
          }
        });
      });
      
      // Filter by status
      document.getElementById('statusFilter').addEventListener('change', function(e) {
        const status = e.target.value;
        const rows = document.querySelectorAll('.order-table tbody tr');
        
        rows.forEach(row => {
          const rowStatus = row.querySelector('.status-badge').textContent.trim();
          if (status === '' || 
              (status === 'PENDING' && rowStatus === 'Chờ xử lý') ||
              (status === 'COMPLETED' && rowStatus === 'Hoàn thành') ||
              (status === 'CANCELLED' && rowStatus === 'Đã hủy') ||
              (status === 'SHIPPED' && rowStatus === 'Đang giao')) {
            row.style.display = '';
          } else {
            row.style.display = 'none';
          }
        });
      });
    </script>
  </body>
</html>