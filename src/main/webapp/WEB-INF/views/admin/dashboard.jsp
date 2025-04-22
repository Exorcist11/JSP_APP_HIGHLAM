<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard Báo Cáo - T-Shirt Luxury</title>
    <link
      rel="shortcut icon"
      href="${pageContext.request.contextPath}/images/favicon.png"
      type="image/x-icon"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
      .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.08);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        margin-bottom: 1.5rem;
      }

      .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 1rem 2rem rgba(0, 0, 0, 0.12);
      }

      .card-stat {
        padding: 1.5rem;
      }

      .card-title {
        color: #6c757d;
        font-size: 0.9rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
      }

      .card-value {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 10px;
      }

      .trend-up {
        color: #198754;
      }

      .trend-down {
        color: #dc3545;
      }

      .status-card {
        text-align: center;
        padding: 1rem;
        border-radius: 8px;
      }

      .status-card .status-count {
        font-size: 1.5rem;
        font-weight: 700;
      }

      .status-card .status-label {
        font-size: 0.85rem;
      }

      .pending {
        background-color: rgba(255, 193, 7, 0.1);
        color: #fd7e14;
      }

      .confirmed {
        background-color: rgba(13, 110, 253, 0.1);
        color: #0d6efd;
      }

      .delivering {
        background-color: rgba(111, 66, 193, 0.1);
        color: #6f42c1;
      }

      .success {
        background-color: rgba(25, 135, 84, 0.1);
        color: #198754;
      }

      .cancelled {
        background-color: rgba(220, 53, 69, 0.1);
        color: #dc3545;
      }

      .returned {
        background-color: rgba(108, 117, 125, 0.1);
        color: #6c757d;
      }

      .product-card {
        display: flex;
        align-items: center;
        padding: 1rem;
        border-bottom: 1px solid #e9ecef;
      }

      .product-card:last-child {
        border-bottom: none;
      }

      .product-img {
        width: 60px;
        height: 60px;
        border-radius: 8px;
        background-color: #e9ecef;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 1rem;
        overflow: hidden;
      }

      .product-img img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .product-info {
        flex: 1;
      }

      .product-title {
        font-weight: 600;
        margin-bottom: 0.25rem;
      }

      .product-stats {
        display: flex;
        font-size: 0.85rem;
        color: #6c757d;
      }

      .product-sales {
        margin-right: 1.5rem;
      }

      .product-price {
        font-weight: 600;
        color: #212529;
      }

      .rank-number {
        font-size: 1.25rem;
        font-weight: 700;
        color: #adb5bd;
        width: 30px;
        text-align: center;
        margin-right: 1rem;
      }

      .rank-1 {
        color: #ffc107;
      }

      .rank-2 {
        color: #adb5bd;
      }

      .rank-3 {
        color: #cd7f32;
      }

      .table-responsive {
        border-radius: 10px;
        overflow: hidden;
      }

      .table {
        margin-bottom: 0;
      }

      .table thead th {
        background-color: #f8f9fa;
        border-bottom-width: 1px;
      }
    </style>
  </head>
  <body class="g-sidenav-show bg-gray-100 text-sm">
    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
    <main class="main-content max-height-vh-100 h-100 border-radius-lg pe-3">
      <nav
        class="navbar navbar-main navbar-expand-lg px-0 shadow-none border-radius-xl"
        id="navbarBlur"
        navbar-scroll="true"
      >
        <nav aria-label="breadcrumb">
          <ol
            class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5"
          >
            <li class="breadcrumb-item text-sm">
              <a class="opacity-5 text-dark" href="javascript:;">Pages</a>
            </li>
            <li
              class="breadcrumb-item text-sm text-dark active"
              aria-current="page"
            >
              Báo cáo kinh doanh
            </li>
          </ol>
        </nav>
      </nav>

      <div class="">
        <div class="d-flex justify-content-between align-items-center mb-4">
          <h2 class="mb-0">Báo Cáo Kinh Doanh</h2>
          <!-- <div class="d-flex gap-2">
                    <select class="form-select form-select-sm" style="font-size: 14px">
                        <option>Hôm nay</option>
                        <option>7 ngày qua</option>
                        <option selected>30 ngày qua</option>
                        <option>Quý này</option>
                        <option>Năm nay</option>
                    </select>
                    <button class="btn btn-primary btn-sm" style="font-size: 14px">
                        <i class="fas fa-sync-alt me-1"></i> Cập nhật
                    </button>
                </div> -->
        </div>

        <!-- Thống kê tổng quan -->
        <div class="row g-4 mb-4">
          <div class="col-12 col-sm-6 col-lg-3">
            <div class="card card-stat">
              <div class="card-title">Tổng sản phẩm</div>
              <div class="card-value">1,256</div>
              <!-- <div class="d-flex align-items-center trend-up">
                <i class="fas fa-arrow-up me-1"></i>
                <span>12% so với tháng trước</span>
              </div> -->
            </div>
          </div>

          <div class="col-12 col-sm-6 col-lg-3">
            <div class="card card-stat">
              <div class="card-title">Doanh số</div>
              <div class="card-value">₫352,4M</div>
              <!-- <div class="d-flex align-items-center trend-up">
                <i class="fas fa-arrow-up me-1"></i>
                <span>8.3% so với tháng trước</span>
              </div> -->
            </div>
          </div>

          <div class="col-12 col-sm-6 col-lg-3">
            <div class="card card-stat">
              <div class="card-title">Số lượng khách hàng</div>
              <div class="card-value">3,124</div>
              <!-- <div class="d-flex align-items-center trend-up">
                <i class="fas fa-arrow-up me-1"></i>
                <span>5.2% so với tháng trước</span>
              </div> -->
            </div>
          </div>

          <div class="col-12 col-sm-6 col-lg-3">
            <div class="card card-stat">
              <div class="card-title">Tổng đơn hàng</div>
              <div class="card-value">845</div>
              <!-- <div class="d-flex align-items-center trend-up">
                <i class="fas fa-arrow-up me-1"></i>
                <span>7.5% so với tháng trước</span>
              </div> -->
            </div>
          </div>
        </div>

        <!-- Thống kê trạng thái đơn hàng -->
        <div class="card mb-4">
          <div class="card-header bg-white">
            <h5 class="card-title mb-0">Thống kê đơn hàng theo trạng thái</h5>
          </div>
          <div class="card-body">
            <div class="row g-3">
              <div class="col-6 col-md-4 col-lg-2">
                <div class="status-card pending">
                  <div class="status-count">45</div>
                  <div class="status-label">Chờ xác nhận</div>
                </div>
              </div>

              <div class="col-6 col-md-4 col-lg-2">
                <div class="status-card confirmed">
                  <div class="status-count">72</div>
                  <div class="status-label">Đã xác nhận</div>
                </div>
              </div>

              <div class="col-6 col-md-4 col-lg-2">
                <div class="status-card delivering">
                  <div class="status-count">124</div>
                  <div class="status-label">Đang giao hàng</div>
                </div>
              </div>

              <div class="col-6 col-md-4 col-lg-2">
                <div class="status-card success">
                  <div class="status-count">542</div>
                  <div class="status-label">Giao hàng thành công</div>
                </div>
              </div>

              <div class="col-6 col-md-4 col-lg-2">
                <div class="status-card cancelled">
                  <div class="status-count">38</div>
                  <div class="status-label">Đã hủy</div>
                </div>
              </div>

              <div class="col-6 col-md-4 col-lg-2">
                <div class="status-card returned">
                  <div class="status-count">24</div>
                  <div class="status-label">Đã trả hàng</div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <!-- Biểu đồ phân tích -->
          <div class="col-lg-8">
            <div class="card">
              <div
                class="card-header bg-white d-flex justify-content-between align-items-center"
              >
                <h5 class="card-title mb-0">Doanh số theo thời gian</h5>
                <div class="btn-group btn-group-sm" role="group">
                  <button
                    type="button"
                    class="btn btn-outline-secondary active"
                  >
                    Ngày
                  </button>
                  <button type="button" class="btn btn-outline-secondary">
                    Tuần
                  </button>
                  <button type="button" class="btn btn-outline-secondary">
                    Tháng
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div
                  style="
                    height: 300px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                  "
                >
                  <img
                    src="/api/placeholder/700/300"
                    alt="Biểu đồ doanh số theo thời gian"
                    style="max-width: 100%; max-height: 100%"
                  />
                </div>
              </div>
            </div>

            <!-- Đơn hàng gần đây -->
            <div class="card">
              <div
                class="card-header bg-white d-flex justify-content-between align-items-center"
              >
                <h5 class="card-title mb-0">Đơn hàng gần đây</h5>
                <a href="#" class="btn btn-sm btn-link">Xem tất cả</a>
              </div>
              <div class="card-body p-0">
                <div class="table-responsive">
                  <table class="table table-hover mb-0">
                    <thead class="table-light">
                      <tr>
                        <th>Mã đơn</th>
                        <th>Khách hàng</th>
                        <th>Ngày đặt</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>#ORD-7829</td>
                        <td>Nguyễn Văn A</td>
                        <td>22/04/2025</td>
                        <td>₫1,250,000</td>
                        <td>
                          <span class="badge bg-warning text-dark"
                            >Chờ xác nhận</span
                          >
                        </td>
                        <td>
                          <button class="btn btn-sm btn-outline-primary">
                            <i class="fas fa-eye"></i>
                          </button>
                        </td>
                      </tr>
                      <tr>
                        <td>#ORD-7828</td>
                        <td>Trần Thị B</td>
                        <td>22/04/2025</td>
                        <td>₫2,780,000</td>
                        <td>
                          <span class="badge bg-primary">Đã xác nhận</span>
                        </td>
                        <td>
                          <button class="btn btn-sm btn-outline-primary">
                            <i class="fas fa-eye"></i>
                          </button>
                        </td>
                      </tr>
                      <tr>
                        <td>#ORD-7827</td>
                        <td>Lê Văn C</td>
                        <td>21/04/2025</td>
                        <td>₫850,000</td>
                        <td>
                          <span class="badge bg-info text-dark"
                            >Đang giao hàng</span
                          >
                        </td>
                        <td>
                          <button class="btn btn-sm btn-outline-primary">
                            <i class="fas fa-eye"></i>
                          </button>
                        </td>
                      </tr>
                      <tr>
                        <td>#ORD-7826</td>
                        <td>Phạm Thị D</td>
                        <td>21/04/2025</td>
                        <td>₫3,560,000</td>
                        <td>
                          <span class="badge bg-success"
                            >Giao hàng thành công</span
                          >
                        </td>
                        <td>
                          <button class="btn btn-sm btn-outline-primary">
                            <i class="fas fa-eye"></i>
                          </button>
                        </td>
                      </tr>
                      <tr>
                        <td>#ORD-7825</td>
                        <td>Hoàng Văn E</td>
                        <td>20/04/2025</td>
                        <td>₫1,890,000</td>
                        <td><span class="badge bg-danger">Đã hủy</span></td>
                        <td>
                          <button class="btn btn-sm btn-outline-primary">
                            <i class="fas fa-eye"></i>
                          </button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4">
            <!-- Biểu đồ phân bố đơn hàng -->
            <div class="card">
              <div class="card-header bg-white">
                <h5 class="card-title mb-0">Phân bố đơn hàng</h5>
              </div>
              <div class="card-body">
                <div
                  style="
                    height: 250px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                  "
                >
                  <img
                    src="/api/placeholder/350/250"
                    alt="Biểu đồ phân bố đơn hàng"
                    style="max-width: 100%; max-height: 100%"
                  />
                </div>
              </div>
            </div>

            <!-- Sản phẩm bán chạy nhất -->
            <div class="card">
              <div
                class="card-header bg-white d-flex justify-content-between align-items-center"
              >
                <h5 class="card-title mb-0">Sản phẩm bán chạy</h5>
                <a href="#" class="btn btn-sm btn-link">Xem tất cả</a>
              </div>
              <div class="card-body p-0">
                <div class="product-card">
                  <div class="rank-number rank-1">1</div>
                  <div class="product-img">
                    <img src="/api/placeholder/60/60" alt="Áo thun unisex" />
                  </div>
                  <div class="product-info">
                    <div class="product-title">
                      Áo thun unisex basic form rộng
                    </div>
                    <div class="product-stats">
                      <div class="product-sales">
                        Đã bán: <strong>487</strong>
                      </div>
                      <div class="product-price">₫189,000</div>
                    </div>
                  </div>
                </div>

                <div class="product-card">
                  <div class="rank-number rank-2">2</div>
                  <div class="product-img">
                    <img src="/api/placeholder/60/60" alt="Quần jean nam" />
                  </div>
                  <div class="product-info">
                    <div class="product-title">Quần jean nam slim fit</div>
                    <div class="product-stats">
                      <div class="product-sales">
                        Đã bán: <strong>356</strong>
                      </div>
                      <div class="product-price">₫450,000</div>
                    </div>
                  </div>
                </div>

                <div class="product-card">
                  <div class="rank-number rank-3">3</div>
                  <div class="product-img">
                    <img src="/api/placeholder/60/60" alt="Váy liền nữ" />
                  </div>
                  <div class="product-info">
                    <div class="product-title">
                      Váy liền nữ dáng xòe họa tiết hoa
                    </div>
                    <div class="product-stats">
                      <div class="product-sales">
                        Đã bán: <strong>325</strong>
                      </div>
                      <div class="product-price">₫395,000</div>
                    </div>
                  </div>
                </div>

                <div class="product-card">
                  <div class="rank-number">4</div>
                  <div class="product-img">
                    <img src="/api/placeholder/60/60" alt="Áo sơ mi nam" />
                  </div>
                  <div class="product-info">
                    <div class="product-title">Áo sơ mi nam dài tay Oxford</div>
                    <div class="product-stats">
                      <div class="product-sales">
                        Đã bán: <strong>284</strong>
                      </div>
                      <div class="product-price">₫320,000</div>
                    </div>
                  </div>
                </div>

                <div class="product-card">
                  <div class="rank-number">5</div>
                  <div class="product-img">
                    <img src="/api/placeholder/60/60" alt="Áo khoác bomber" />
                  </div>
                  <div class="product-info">
                    <div class="product-title">Áo khoác bomber unisex</div>
                    <div class="product-stats">
                      <div class="product-sales">
                        Đã bán: <strong>267</strong>
                      </div>
                      <div class="product-price">₫550,000</div>
                    </div>
                  </div>
                </div>

                <div class="product-card">
                  <div class="rank-number">6</div>
                  <div class="product-img">
                    <img src="/api/placeholder/60/60" alt="Quần short nữ" />
                  </div>
                  <div class="product-info">
                    <div class="product-title">Quần short jean nữ lưng cao</div>
                    <div class="product-stats">
                      <div class="product-sales">
                        Đã bán: <strong>245</strong>
                      </div>
                      <div class="product-price">₫280,000</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <script>
      // Giả lập dữ liệu thống kê (có thể thay thế bằng API call thực tế)
      function updateStats() {
        // Cập nhật dữ liệu thống kê từ backend
        console.log("Cập nhật dữ liệu báo cáo...");
      }

      // Khởi tạo trang
      document.addEventListener("DOMContentLoaded", function () {
        // Thêm event listener cho nút cập nhật
        document
          .querySelector(".btn-primary")
          .addEventListener("click", updateStats);
      });
    </script>
  </body>
</html>
