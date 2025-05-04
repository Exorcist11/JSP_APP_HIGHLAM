
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>T-Shirt Luxury | ADMIN</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/x-icon" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .modal.show {
            display: block;
            overflow-y: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            margin-top: 50px;
        }
        .table-responsive {
            overflow-x: auto;
        }
        .no-left-right-border td,
        .no-left-right-border th {
            border-left: none !important;
            border-right: none !important;
        }
        .toast-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1055;
        }
    </style>
</head>
<body class="g-sidenav-show bg-gray-100 text-sm">
    <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
    <main class="main-content max-height-vh-100 h-100 border-radius-lg pe-3">
        <!-- Navbar -->
        <nav class="navbar navbar-main navbar-expand-lg px-0 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                    <li class="breadcrumb-item text-sm">
                        <a class="opacity-5 text-dark" href="javascript:;">Pages</a>
                    </li>
                    <li class="breadcrumb-item text-sm text-dark active" aria-current="page">
                        Quản lý đơn hàng
                    </li>
                </ol>
            </nav>
        </nav>
        <!-- End Navbar -->

        <h2 class="mb-3">Quản Lý Đơn Hàng</h2>

        <div>
            <div class="w-100">
                <form action="/admin/order" method="GET" class="row g-1">
                    <!-- Ô tìm kiếm -->
                    <div class="col-5">
                        <input name="code" class="form-control" type="search"
                               placeholder="Tìm theo mã hoá đơn" aria-label="Search" style="font-size: 14px"
                               value="${code}" />
                    </div>
                    <!-- Dropdown trạng thái -->
                    <div class="col-2">
                        <select class="form-select" name="status" id="trangThai" style="font-size: 14px">
                            <option value="">Tất cả trạng thái</option>
                            <c:forEach items="${allStatus}" var="st">
                                <option value="${st}" ${status eq st ? 'selected' : ''}>${st.getDisplayName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-5 d-flex justify-content-between">
                        <button style="font-size: 14px" class="btn btn-success flex-fill mx-1" type="submit">
                            <i class="bi bi-search me-1"></i> Tìm Kiếm
                        </button>
                        <a href="/admin/order" style="font-size: 14px" class="btn btn-secondary flex-fill mx-1">
                            <i class="bi bi-arrow-clockwise"></i> Reset
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="table-responsive mt-3 min-vh-100">
            <table class="table border rounded" style="font-size: 14px">
                <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã Hoá Đơn</th>
                        <th scope="col">Email</th>
                        <th scope="col">Tên Khách Hàng</th>
                        <th scope="col">Số Điện Thoại</th>
                        <th scope="col">Tổng Tiền</th>
                        <th scope="col">Trạng Thái</th>
                        <th scope="col" class="text-end">Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty listOrders}">
                            <tr>
                                <td colspan="8" class="text-center">Không tìm thấy kết quả nào!</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${listOrders}" var="hd" varStatus="i">
                                <tr>
                                    <td>${(currentPage * pageSize) + i.index + 1}</td>
                                    <td>${hd.code}</td>
                                    <td>${hd.guestEmail}</td>
                                    <td>${hd.recipientName}</td>
                                    <td>${hd.recipientPhone}</td>
                                    <td>
                                        <fmt:formatNumber value="${hd.totalAmount}" groupingUsed="true" maxFractionDigits="0" /> VND
                                    </td>
                                    <td>
                                        <span class="badge
                                            ${hd.status == 'PENDING' ? 'bg-warning' :
                                              hd.status == 'CONFIRMED' ? 'bg-primary' :
                                              hd.status == 'DELIVERING' ? 'bg-info' :
                                              hd.status == 'SUCCESS' ? 'bg-success' :
                                              hd.status == 'CANCELLED' ? 'bg-danger' :
                                              hd.status == 'RETURNED' ? 'bg-secondary' : 'bg-dark'}">
                                            ${hd.vietnameseStatus}
                                        </span>
                                    </td>
                                    <td class="text-end">
                                        <div class="d-flex justify-content-end gap-2 align-items-center" style="min-width: 120px">
                                            <!-- Nút Xem Chi Tiết -->
                                            <a class="btn btn-sm btn-outline-primary" data-toggle="tooltip"
                                               data-placement="top" title="Xem Chi Tiết"
                                               href="/admin/order?code=${code}&status=${status}&id=${hd.id}">
                                                <i class="fa-solid fa-eye"></i>
                                            </a>
                                            <!-- Dropdown Actions -->
                                            <div class="dropdown">
                                                <button class="btn btn-sm btn-outline-secondary dropdown-toggle"
                                                        type="button" id="dropdownMenuButton_${hd.id}"
                                                        data-bs-toggle="dropdown" aria-expanded="false"
                                                        title="Cập Nhật">
                                                    <i class="fa-solid fa-ellipsis-vertical"></i>
                                                </button>
                                                <ul class="dropdown-menu dropdown-menu-end"
                                                    aria-labelledby="dropdownMenuButton_${hd.id}"
                                                    style="min-width: 200px; max-width: 90vw">
                                                    <li>
                                                        <a class="dropdown-item" href="/admin/order/edit/${hd.id}">
                                                            <i class="fas fa-edit me-2"></i>Chỉnh sửa đơn hàng
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="dropdown-item" onClick="alert('Đang hoàn thiện!')">
                                                            <i class="fas fa-print me-2"></i>In hóa đơn
                                                        </a>
                                                    </li>
                                                 
                                                    <c:if test="${hd.status == 'PENDING'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li>
                                                            <a class="dropdown-item text-success" href="#"
                                                               onclick="showConfirmModal('${hd.id}', 'CONFIRMED')">
                                                                <i class="fas fa-check-circle me-2"></i>Xác nhận đơn hàng
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="dropdown-item text-danger" href="#"
                                                               onclick="showConfirmModal('${hd.id}', 'CANCELLED')">
                                                                <i class="fas fa-times-circle me-2"></i>Hủy đơn hàng
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${hd.status == 'CONFIRMED'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li>
                                                            <a class="dropdown-item text-info" href="#"
                                                               onclick="showConfirmModal('${hd.id}', 'DELIVERING')">
                                                                <i class="fas fa-truck me-2"></i>Bắt đầu giao hàng
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${hd.status == 'DELIVERING'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li>
                                                            <a class="dropdown-item text-success" href="#"
                                                               onclick="showConfirmModal('${hd.id}', 'SUCCESS')">
                                                                <i class="fas fa-check-double me-2"></i>Xác nhận giao thành công
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a class="dropdown-item text-warning" href="#"
                                                               onclick="showConfirmModal('${hd.id}', 'RETURNED')">
                                                                <i class="fas fa-undo me-2"></i>Xác nhận trả hàng
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <c:if test="${not empty listOrders}">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <!-- Nút Previous -->
                        <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                            <a class="page-link"
                               href="?code=${code}&status=${status}&page=${currentPage - 1}&size=${pageSize}"
                               aria-label="Previous">
                                <span aria-hidden="true">«</span>
                            </a>
                        </li>
                        <!-- Hiển thị số trang -->
                        <c:forEach begin="0" end="${totalPages - 1}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link"
                                   href="?code=${code}&status=${status}&page=${i}&size=${pageSize}">${i + 1}</a>
                            </li>
                        </c:forEach>
                        <!-- Nút Next -->
                        <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                            <a class="page-link"
                               href="?code=${code}&status=${status}&page=${currentPage + 1}&size=${pageSize}"
                               aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </c:if>
        </div>

        <!-- Phần hiển thị chi tiết hóa đơn -->
        <c:if test="${not empty selectedOrder}">
            <div class="modal fade" id="orderDetailModal" tabindex="-1"
                 aria-labelledby="orderDetailModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header text-white">
                            <h5 class="modal-title" id="orderDetailModalLabel">
                                Chi tiết hóa đơn #${selectedOrder.code}
                                <span class="badge
                                    ${selectedOrder.status == 'PENDING' ? 'bg-warning' :
                                      selectedOrder.status == 'CONFIRMED' ? 'bg-primary' :
                                      selectedOrder.status == 'DELIVERING' ? 'bg-info' :
                                      selectedOrder.status == 'SUCCESS' ? 'bg-success' :
                                      selectedOrder.status == 'CANCELLED' ? 'bg-secondary' :
                                      selectedOrder.status == 'RETURNED' ? 'bg-danger' : 'bg-dark'} ms-2">
                                    ${selectedOrder.vietnameseStatus}
                                </span>
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h6>Thông tin khách hàng</h6>
                                    <table class="table table-bordered no-left-right-border">
                                        <tr>
                                            <th width="40%">Tên khách hàng</th>
                                            <td style="word-break: break-word; white-space: normal;">
                                                ${selectedOrder.recipientName}</td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td>${selectedOrder.guestEmail}</td>
                                        </tr>
                                        <tr>
                                            <th>Số điện thoại</th>
                                            <td>${selectedOrder.recipientPhone}</td>
                                        </tr>
                                        <tr>
                                            <th>Địa chỉ</th>
                                            <td style="word-break: break-word; white-space: normal;">
                                                ${selectedOrder.recipientAddress}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <h6>Thông tin đơn hàng</h6>
                                    <table class="table table-bordered no-left-right-border">
                                        <tr>
                                            <th width="40%">Ngày đặt</th>
                                            <td>
                                                <fmt:formatDate value="${selectedOrder.createdAt}"
                                                                pattern="dd/MM/yyyy HH:mm:ss" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Ngày cập nhật</th>
                                            <td>
                                                <fmt:formatDate value="${selectedOrder.updatedAt}"
                                                                pattern="dd/MM/yyyy HH:mm:ss" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Tổng tiền</th>
                                            <td class="fw-bold">
                                                <fmt:formatNumber value="${selectedOrder.totalAmount}"
                                                                  pattern="#,##0" /> VND
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Ghi chú</th>
                                            <td>${empty selectedOrder.notes ? 'Không có' : selectedOrder.notes}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <h6>Danh sách sản phẩm</h6>
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Size</th>
                                                <th>Màu</th>
                                                <th class="text-end">Số lượng</th>
                                                <th class="text-end">Đơn giá</th>
                                                <th class="text-end">Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${orderItems}" var="item" varStatus="i">
                                                <tr>
                                                    <td>${i.index + 1}</td>
                                                    <td>${item.productDetail.product.name}</td>
                                                    <td>${item.productDetail.size.name}</td>
                                                    <td>${item.productDetail.color.name}</td>
                                                    <td class="text-end">${item.quantity}</td>
                                                    <td class="text-end">
                                                        <fmt:formatNumber value="${item.price}" pattern="#,##0" /> VND
                                                    </td>
                                                    <td class="text-end fw-bold">
                                                        <fmt:formatNumber value="${item.price * item.quantity}"
                                                                          pattern="#,##0" /> VND
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr class="table-active">
                                                <td colspan="6" class="text-end fw-bold">Tổng cộng:</td>
                                                <td class="text-end fw-bold">
                                                    <fmt:formatNumber value="${selectedOrder.totalAmount}"
                                                                      pattern="#,##0" /> VND
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                <i class="fas fa-times me-1"></i> Đóng
                            </button>
                            <a onClick="alert('Đang hoàn thiện!')" class="btn btn-primary">
                                <i class="fas fa-print me-1"></i> In hóa đơn
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- Modal xác nhận thay đổi trạng thái -->
        <div class="modal fade" id="confirmStatusModal" tabindex="-1" aria-labelledby="confirmStatusModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmStatusModalLabel">Xác nhận thay đổi trạng thái</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p id="confirmMessage"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            <i class="fas fa-times me-1"></i> Hủy
                        </button>
                        <button type="button" class="btn btn-primary" id="confirmButton">
                            <i class="fas fa-check me-1"></i> Xác nhận
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Toast container for notifications -->
        <div class="toast-container">
            <div class="toast" id="notificationToast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="me-auto" id="toastTitle"></strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body" id="toastMessage"></div>
            </div>
        </div>

        <script>
            // Hàm hiển thị modal xác nhận
            function showConfirmModal(orderId, status) {
                const confirmModal = new bootstrap.Modal(document.getElementById('confirmStatusModal'), { keyboard: true });
                const confirmMessage = document.getElementById('confirmMessage');
                const confirmButton = document.getElementById('confirmButton');

                let message = '';
                switch (status) {
                    case 'CONFIRMED':
                        message = 'Bạn có chắc chắn muốn xác nhận đơn hàng này?';
                        break;
                    case 'CANCELLED':
                        message = 'Bạn có chắc chắn muốn hủy đơn hàng này?';
                        break;
                    case 'DELIVERING':
                        message = 'Bạn có chắc chắn muốn bắt đầu giao hàng cho đơn hàng này?';
                        break;
                    case 'SUCCESS':
                        message = 'Bạn có chắc chắn muốn xác nhận giao hàng thành công cho đơn hàng này?';
                        break;
                    case 'RETURNED':
                        message = 'Bạn có chắc chắn muốn xác nhận trả hàng cho đơn hàng này?';
                        break;
                    default:
                        message = 'Bạn có chắc chắn muốn cập nhật trạng thái đơn hàng này?';
                }

                confirmMessage.textContent = message;

                // Gỡ bỏ các event listener cũ để tránh trùng lặp
                const newConfirmButton = confirmButton.cloneNode(true);
                confirmButton.parentNode.replaceChild(newConfirmButton, confirmButton);

                // Thêm sự kiện cho nút xác nhận
                newConfirmButton.addEventListener('click', () => {
                    updateOrderStatus(orderId, status);
                    confirmModal.hide();
                });

                confirmModal.show();
            }

            // Hàm cập nhật trạng thái đơn hàng
            async function updateOrderStatus(orderId, status) {
                if (!orderId) {
                    showToast('Lỗi', 'Không tìm thấy mã đơn hàng!', 'danger');
                    return;
                }

                const url = `/admin/order/changeStatus/` + orderId;
                try {
                    const response = await fetch(url, {
                        method: 'PATCH',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: new URLSearchParams({ order: status }),
                    });

                    if (response.ok) {
                        showToast('Thành công', 'Cập nhật trạng thái thành công!', 'success');
                        setTimeout(() => location.reload(), 1500);
                    } else {
                        const errorText = await response.text();
                        showToast('Lỗi', `Cập nhật thất bại: ${errorText}`, 'danger');
                    }
                } catch (error) {
                    console.error('Lỗi kết nối:', error);
                    showToast('Lỗi', 'Có lỗi xảy ra khi kết nối đến server', 'danger');
                }
            }

            // Hàm hiển thị toast thông báo
            function showToast(title, message, type) {
                const toast = new bootstrap.Toast(document.getElementById('notificationToast'));
                const toastTitle = document.getElementById('toastTitle');
                const toastMessage = document.getElementById('toastMessage');
                const toastElement = document.getElementById('notificationToast');

                toastTitle.textContent = title;
                toastMessage.textContent = message;
                toastElement.classList.remove('text-bg-success', 'text-bg-danger');
                toastElement.classList.add(`text-bg-${type}`);

                toast.show();
            }

            // Khởi tạo modal chi tiết đơn hàng
            document.addEventListener('DOMContentLoaded', function () {
                <c:if test="${not empty selectedOrder}">
                    var orderDetailModal = new bootstrap.Modal(document.getElementById('orderDetailModal'), {
                        keyboard: true
                    });
                    orderDetailModal.show();
                </c:if>
            });

            // Xóa tham số id khỏi URL khi đóng modal chi tiết
            document.getElementById('orderDetailModal')?.addEventListener('hidden.bs.modal', function () {
                const url = new URL(window.location.href);
                url.searchParams.delete('id');
                window.history.replaceState({}, document.title, url.toString());
            });
        </script>
    </body>
</html>
