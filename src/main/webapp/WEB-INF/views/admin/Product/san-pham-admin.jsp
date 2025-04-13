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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" />
        <link rel="stylesheet" href="../css/button.css" />
      </head>

      <body class="g-sidenav-show bg-gray-100 text-sm">
        <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
        <main class="main-content max-height-vh-100 h-100 border-radius-lg pe-3">
          <nav class="navbar navbar-main navbar-expand-lg px-0 shadow-none border-radius-xl" id="navbarBlur"
            navbar-scroll="true">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
                <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Quản lý sản phẩm</li>
              </ol>
            </nav>
          </nav>

          <c:choose>
            <c:when test="${not empty product}">
              <!-- Hiển thị chi tiết sản phẩm -->

              <div class="row">

                <div class="row mt-2">
                  <div class="p-2 bd-highlight d-flex justify-content-between">
                    <a type="button" href="/admin/products?page=0&size=5" class="btn btn-outline-secondary">
                      <i class="fa-solid fa-backward"></i> Trở lại
                    </a>
                    <button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
                      data-bs-target="#themSanPhamChiTiet">
                      <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                    </button>
                  </div>
                  <h2>${product.name}</h2>
                  <table class="table border rounded">
                    <thead>
                      <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Code</th>
                        <th scope="col"></th>
                        <th scope="col">Size</th>
                        <th scope="col">Màu Sắc</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">Trạng Thái</th>
                        <th scope="col">Hành Động</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:choose>
                        <c:when test="${not empty lstPD}">
                          <c:forEach items="${lstPD}" var="s" varStatus="i">
                            <tr>
                              <td>${i.index + 1}</td>
                              <td>${s.code}</td>
                              <td>
                                <c:forEach items="${s.images}" var="img">
                                  <img src="${img.imageUrl}" alt="Ảnh sản phẩm" width="80" height="80" />
                                </c:forEach>
                              </td>
                              <td>${s.size.name}</td>
                              <td>${s.color.name}</td>
                              <td>${s.quantity}</td>
                              <td>
                                <span class="badge ${s.status ? 'text-bg-success' : 'text-bg-secondary'}">
                                  ${s.status ? 'Đang Bán' : 'Chưa Bán'}
                                </span>
                              </td>
                              <td>
                                <a class="btn btn-warning rounded-pill edit-btn" data-bs-toggle="modal"
                                  data-bs-target="#editModal" title="Chỉnh Sửa" data-id="${s.id}"
                                  data-size="${s.size.id}" data-color="${s.color.id}" data-status="${s.status}"
                                  data-quantity="${s.quantity}">
                                  <i class="fa-solid fa-pen-to-square"></i>
                                </a>
                                <a class="btn btn-danger rounded-pill" data-toggle="tooltip" title="Xóa"
                                  data-id="${s.id}"
                                  onclick="return confirmDelete('/admin/products/deleteProductDetail/${s.id}')">
                                  <i class="fa-solid fa-trash"></i>
                                </a>
                              </td>
                            </tr>
                          </c:forEach>
                        </c:when>
                        <c:otherwise>
                          <tr>
                            <td colspan="9" class="text-center">Không có dữ liệu</td>
                          </tr>
                        </c:otherwise>
                      </c:choose>
                    </tbody>
                  </table>


                </div>
              </div>

              <!-- Modal Thêm Sản Phẩm Chi Tiết -->
              <form action="/admin/products/detail" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="productID" value="${product.id}" />
                <div class="modal fade" id="themSanPhamChiTiet" tabindex="-1" aria-labelledby="exampleModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Sản Phẩm Chi Tiết</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body d-flex flex-column gap-3">
                        <div class="row">
                          <div class="form-group w-50 col">
                            <label class="fw-bold">Mã Sản Phẩm:</label>
                            <input type="text" name="productID" class="form-control" disabled readonly
                              value="${product.id}" />
                          </div>
                          <div class="form-group w-50 col">
                            <label class="fw-bold">Tên Sản Phẩm:</label>
                            <input type="text" class="form-control" disabled readonly value="${product.name}" />
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label class="form-label fw-bold">Chọn Size Sản Phẩm <span
                                class="text-danger">*</span></label>
                            <select class="form-select" name="sizeID">
                              <c:forEach var="s" items="${sizes}">
                                <option value="${s.id}">${s.name}</option>
                              </c:forEach>
                            </select>
                          </div>
                          <div class="col">
                            <label class="form-label fw-bold">Chọn Màu Sắc Sản Phẩm:</label>
                            <select class="form-select" name="colorID">
                              <c:forEach var="s" items="${colors}">
                                <option value="${s.id}">${s.name}</option>
                              </c:forEach>
                            </select>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col">
                            <label class="fw-bold">Số Lượng <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" min="0" placeholder="Số Lượng" name="quantity"
                              required />
                          </div>
                        </div>
                        <div class="row">
                          <label for="images">Chọn ảnh:</label>
                          <input type="file" id="images" name="images" multiple required
                            onchange="previewImages(event)" />
                          <div id="preview-container" class="mt-3 d-flex flex-wrap gap-2"></div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-success">Thêm Mới</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>

              <!-- Modal Chỉnh Sửa Sản Phẩm Chi Tiết -->
              <form id="editProductDetailForm" method="post">
                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog modal-xl">
                    <div class="modal-content" style="font-size: 14px">
                      <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Chỉnh Sửa Sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body d-flex flex-column gap-3">
                        <div class="row">
                          <div class="form-group w-50 col">
                            <label class="fw-bold">Mã Sản Phẩm:</label>
                            <input type="text" name="productID" class="form-control" readonly value="${product.id}" />
                          </div>
                          <div class="form-group w-50 col">
                            <label class="fw-bold">Tên Sản Phẩm:</label>
                            <input type="text" class="form-control" disabled readonly value="${product.name}" />
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label class="form-label fw-bold">Chọn Size Sản Phẩm <span
                                class="text-danger">*</span></label>
                            <select class="form-select" id="sizeP" name="sizeID" disabled>
                              <c:forEach var="s" items="${sizes}">
                                <option value="${s.id}">${s.name}</option>
                              </c:forEach>
                            </select>
                            <input type="hidden" name="sizeID" id="hiddenSizeId" />
                          </div>
                          <div class="col">
                            <label class="form-label fw-bold">Chọn Màu Sắc Sản Phẩm:</label>
                            <select class="form-select" id="colorP" name="colorID" disabled>
                              <c:forEach var="s" items="${colors}">
                                <option value="${s.id}">${s.name}</option>
                              </c:forEach>
                            </select>
                            <input type="hidden" name="colorID" id="hiddenColorId" />
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col">
                            <label class="fw-bold">Số Lượng <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" min="0" id="quantityP" placeholder="Số Lượng"
                              name="quantity" required />
                          </div>
                        </div>
                        <div class="form-check form-switch">
                          <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked"
                            name="status" checked value="true" />
                          <span id="statusText" class="ms-2 fw-bold text-success">Hoạt Động</span>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Cập Nhật</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </c:when>
            <c:otherwise>
              <!-- Hiển thị danh sách sản phẩm -->
              <h2 class="">Quản Lý Sản Phẩm </h2>
              <div class="w-100">
                <form action="/admin/products" method="GET" class="row g-1">
                  <div class="col-5">
                    <input name="timKiemSanPham" class="form-control" type="search" placeholder="Tìm sản phẩm"
                      aria-label="Search" style="font-size: 14px" value="${timKiemSanPham}" />
                  </div>
                  <div class="col-2">
                    <select class="form-select" name="trangThai" id="trangThai" style="font-size: 14px">
                      <option value="">Trạng Thái</option>
                      <option value="1" ${trangThai==true ? 'selected' : '' }>Còn Hàng</option>
                      <option value="0" ${trangThai==false ? 'selected' : '' }>Hết Hàng</option>
                    </select>
                  </div>
                  <div class="col-5 d-flex justify-content-between">
                    <button style="font-size: 14px" class="btn btn-success flex-fill mx-1" type="submit">
                      <i class="bi bi-search me-1"></i> Tìm Kiếm
                    </button>
                    <a href="/admin/products" style="font-size: 14px" class="btn btn-secondary flex-fill mx-1">
                      <i class="bi bi-arrow-clockwise"></i> Reset
                    </a>
                    <button type="button" class="btn btn-outline-primary flex-fill mx-1" style="font-size: 14px"
                      data-bs-toggle="modal" data-bs-target="#themSanPham">
                      <i class="fa-solid fa-circle-plus"></i> Thêm Mới
                    </button>
                  </div>
                </form>
              </div>
              <table class="table border rounded mt-2">
                <thead>
                  <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Mã Sản Phẩm</th>
                    <th scope="col">Tên Sản Phẩm</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Trạng Thái</th>
                    <th scope="col" class="text-end">Hành Động</th>
                  </tr>
                </thead>
                <tbody>
                  <c:choose>
                    <c:when test="${empty products}">
                      <tr>
                        <td colspan="7" class="text-center">Không tìm thấy kết quả nào!</td>
                      </tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach items="${products}" var="sp" varStatus="i">
                        <tr>
                          <td class="align-middle">${(currentPage * pageSize) + i.index + 1}</td>
                          <td class="align-middle">${sp.code}</td>
                          <td class="align-middle">${sp.name}</td>
                          <td class="align-middle">
                            <fmt:formatNumber value="${sp.price}" groupingUsed="true" maxFractionDigits="0" /> VND
                          </td>
                          <td class="align-middle">
                            <c:if test="${sp.status == true}"><span class="badge bg-success">Còn Hàng</span></c:if>
                            <c:if test="${sp.status == false}"><span class="badge bg-danger">Hết Hàng</span></c:if>
                          </td>
                          <td class="align-middle d-flex justify-content-end gap-2">
                            <a class="btn edit-btn mb-0" data-bs-toggle="modal" data-bs-target="#editModal"
                              data-id="${sp.id}" data-code="${sp.code}" data-name="${sp.name}" data-price="${sp.price}"
                              data-status="${sp.status}" data-description="${sp.description}"
                              data-category="${sp.categoryDetail.id}" title="Chỉnh Sửa">
                              <i class="fa-solid fa-pen-to-square"></i>
                            </a>
                            <a class="btn delete-btn mb-0" data-toggle="tooltip" data-placement="top" title="Xóa"
                              data-id="${sp.id}" onclick="return confirmDelete()">
                              <i class="fa-solid fa-trash"></i>
                            </a>
                            <a href="/admin/products?productID=${sp.id}" class="btn btn-secondary mb-0"
                              data-toggle="tooltip" data-placement="top" title="Xem Chi Tiết">
                              <i class="fa-solid fa-eye"></i>
                            </a>
                          </td>
                        </tr>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
                </tbody>
              </table>

              <c:if test="${not empty products}">
                <nav aria-label="Page navigation">
                  <ul class="pagination justify-content-center">
                    <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                      <a class="page-link"
                        href="?page=${currentPage - 1}&size=${pageSize}"
                        aria-label="Previous">
                        <span aria-hidden="true">«</span>
                      </a>
                    </li>
                    <c:forEach begin="0" end="${totalPages - 1}" var="i">
                      <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link"
                          href="?code=${code}&status=${status}&page=${i}&size=${pageSize}&sort=${sort}">${i + 1}</a>
                      </li>
                    </c:forEach>
                    <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                      <a class="page-link"
                        href="?code=${code}&status=${status}&page=${currentPage + 1}&size=${pageSize}&sort=${sort}"
                        aria-label="Next">
                        <span aria-hidden="true">»</span>
                      </a>
                    </li>
                  </ul>
                </nav>
               
              </c:if>

              <!-- Modal Thêm Sản Phẩm -->
              <form action="/admin/products/save" method="POST">
                <div class="modal fade" id="themSanPham" tabindex="-1" aria-labelledby="exampleModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm Mới Sản Phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control" id="name" name="name" required />
                          <label for="floatingInputTenSanPham">Tên Sản Phẩm <span class="text-danger">*</span></label>
                        </div>
                        <div class="mb-3">
                          <label for="price" class="form-label">Giá</label>
                          <input type="number" class="form-control" id="price" name="price" required min="0" />
                        </div>
                        <div class="mb-3">
                          <label for="categoryId" class="form-label">Danh mục</label>
                          <select class="form-select" id="categoryId" name="categoryId" required>
                            <option value="">Chọn danh mục</option>
                            <c:forEach var="category" items="${categories}">
                              <option value="${category.id}">${category.name}</option>
                            </c:forEach>
                          </select>
                        </div>
                        <div class="mb-3">
                          <label for="description" class="form-label">Mô tả</label>
                          <textarea class="form-control" id="description" name="description"></textarea>
                        </div>
                        <p style="color: red">${errorMessageSanPham}</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-success">Thêm Mới</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>

              <!-- Modal Chỉnh Sửa Sản Phẩm -->
              <form id="editCategoryForm" method="post">
                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content" style="font-size: 14px">
                      <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Chỉnh Sửa Sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <div class="mb-3">
                          <label for="code" class="form-label">Mã sản phẩm</label>
                          <input type="text" class="form-control" id="code" name="code" required />
                        </div>
                        <div class="mb-3">
                          <label for="nameP" class="form-label">Tên sản phẩm</label>
                          <input type="text" class="form-control" id="nameP" name="name" required />
                        </div>
                        <div class="mb-3">
                          <label for="price" class="form-label">Giá</label>
                          <input type="number" class="form-control" id="priceP" name="price" required min="0" />
                        </div>
                        <div class="mb-3">
                          <label for="categoryId" class="form-label">Danh mục</label>
                          <select class="form-select" id="categoryIdP" name="categoryId" required>
                            <option value="">Chọn danh mục</option>
                            <c:forEach var="category" items="${categories}">
                              <option value="${category.id}">${category.name}</option>
                            </c:forEach>
                          </select>
                        </div>
                        <div class="mb-3">
                          <label for="description" class="form-label">Mô tả</label>
                          <textarea class="form-control" id="descriptionP" name="description"></textarea>
                        </div>
                        <div class="form-check form-switch">
                          <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked"
                            name="status" checked value="true" />
                          <span id="statusText" class="ms-2 fw-bold text-success">Hoạt Động</span>
                        </div>
                        <p style="color: red">${errorMessageSanPham}</p>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Cập Nhật</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </c:otherwise>
          </c:choose>
        </main>

        <script src="../js/actionProduct.js"></script>
        <script>
          document.addEventListener("DOMContentLoaded", function () {
            let form = document.getElementById("editProductDetailForm");

            document.querySelectorAll(".edit-btn").forEach((button) => {
              button.addEventListener("click", function () {
                let id = this.getAttribute("data-id");
                let size = this.getAttribute("data-size");
                let color = this.getAttribute("data-color");
                let status = this.getAttribute("data-status");
                let quantity = this.getAttribute("data-quantity");

                const sizeSelect = document.getElementById("sizeP");
                sizeSelect.value = size;
                if (!Array.from(sizeSelect.options).some(option => option.value === size)) {
                  sizeSelect.value = "";
                }

                let colorSelect = document.getElementById("colorP");
                colorSelect.value = color;
                if (!Array.from(colorSelect.options).some(option => option.value === color)) {
                  colorSelect.value = "";
                }

                document.getElementById("flexSwitchCheckChecked").checked = status === "true";
                document.getElementById("quantityP").value = quantity;

                form.action = "/admin/products/updateDetail/" + id;
              });
            });

            let switchInput = document.getElementById("flexSwitchCheckChecked");
            let statusText = document.getElementById("statusText");

            function updateStatus() {
              if (switchInput.checked) {
                statusText.textContent = "Hoạt Động";
                statusText.classList.remove("text-danger");
                statusText.classList.add("text-success");
                switchInput.value = "true";
              } else {
                statusText.textContent = "Không Hoạt Động";
                statusText.classList.remove("text-success");
                statusText.classList.add("text-danger");
                switchInput.value = "false";
              }
            }

            switchInput.addEventListener("change", updateStatus);

            document.querySelectorAll(".btn-danger").forEach((button) => {
              button.addEventListener("click", function () {
                let id = this.getAttribute("data-id");
                if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
                  window.location.href = "/admin/products/deleteProductDetail/" + id;
                }
              });
            });
          });

          confirmDelete = (url) => {
            if (confirm("Bạn có chắc muốn xóa sản phẩm chi tiết này?")) {
              window.location.href = url;
              return true;
            }
            return false;
          };

          let selectedFiles = [];
          function previewImages(event) {
            const previewContainer = document.getElementById("preview-container");
            Array.from(event.target.files).forEach((file) => {
              if (!selectedFiles.some((f) => f.name === file.name)) {
                selectedFiles.push(file);
                const reader = new FileReader();
                reader.onload = (e) => {
                  const imgWrapper = document.createElement("div");
                  imgWrapper.className = "position-relative";
                  const img = document.createElement("img");
                  img.src = e.target.result;
                  img.className = "img-thumbnail";
                  img.style.maxWidth = "150px";
                  img.style.maxHeight = "150px";
                  const removeBtn = document.createElement("button");
                  removeBtn.innerText = "X";
                  removeBtn.className = "btn btn-danger btn-sm position-absolute top-0 end-0";
                  removeBtn.onclick = () => removeImage(file.name, imgWrapper);
                  imgWrapper.appendChild(img);
                  imgWrapper.appendChild(removeBtn);
                  previewContainer.appendChild(imgWrapper);
                };
                reader.readAsDataURL(file);
              }
            });
          }

          function removeImage(fileName, imgWrapper) {
            selectedFiles = selectedFiles.filter((file) => file.name !== fileName);
            imgWrapper.remove();
          }

          document.querySelector("form").addEventListener("submit", (e) => {
            const dataTransfer = new DataTransfer();
            selectedFiles.forEach((file) => dataTransfer.items.add(file));
            document.getElementById("images").files = dataTransfer.files;
          });
        </script>
      </body>
      <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

      </html>