<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>T-Shirt Luxury | ADMIN</title>
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
  </head>
  <body class="container" style="font-size: 14px">
    <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />

    <div class="row">
      <div class="p-2 bd-highlight d-flex justify-content-start mt-3">
        <a
          type="button"
          href="/admin/products"
          class="btn btn-outline-secondary"
        >
          <i class="fa-solid fa-backward"></i> Trở lại
        </a>
      </div>
      <div class="row mt-2">
        <h2 class="">Quản Lý Sản Phẩm Chi Tiết</h2>

        <div class="p-2 bd-highlight d-flex justify-content-end">
          <button
            type="button"
            class="btn btn-outline-success"
            data-bs-toggle="modal"
            data-bs-target="#themSanPhamChiTiet"
          >
            <i class="fa-solid fa-circle-plus"></i> Thêm Mới
          </button>
        </div>
        <h2>${product.name}</h2>
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">STT</th>

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

                    <td>${s.size.name}</td>
                    <td>${s.color.name}</td>
                    <td>${s.quantity}</td>
                    <td>${s.status ? "Đang Bán" : "Chưa Bán"}</td>

                    <td>
                      <a
                        class="btn btn-warning rounded-pill edit-btn"
                        data-bs-toggle="modal"
                        data-bs-target="#editModal"
                        title="Chỉnh Sửa"
                        data-id="${s.id}"
                        data-size="${s.size.id}"
                        data-color="${s.color.id}"
                        data-status="${s.status}"
                        data-quantity="${s.quantity}"
                      >
                        <i class="fa-solid fa-pen-to-square"></i>
                      </a>
                      <a
                        class="btn btn-danger rounded-pill"
                        data-toggle="tooltip"
                        title="Xóa"
                        data-id="${s.id}"
                        onclick="return confirmDelete()"
                      >
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

    <!-- --Modal-- -->
    <form action="/admin/products/${product.id}" method="POST">
      <input type="hidden" name="productID" value="${product.id}" />
      <div
        class="modal fade"
        id="themSanPhamChiTiet"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                Thêm Mới Sản Phẩm Chi Tiết
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body d-flex flex-column gap-3">
              <div class="row">
                <div class="form-group w-50 col">
                  <label class="fw-bold">Mã Sản Phẩm:</label>
                  <input
                    type="text"
                    name="productID"
                    class="form-control"
                    disabled
                    readonly
                    value="${product.id}"
                  />
                </div>
                <div class="form-group w-50 col">
                  <label class="fw-bold">Tên Sản Phẩm:</label>
                  <input
                    type="text"
                    class="form-control"
                    disabled
                    readonly
                    value="${product.name}"
                  />
                </div>
              </div>

              <div class="row">
                <div class="col">
                  <label class="form-label fw-bold"
                    >Chọn Size Sản Phẩm
                    <span class="text-danger">*</span></label
                  >
                  <select class="form-select" name="sizeID">
                    <c:forEach var="s" items="${sizes}">
                      <option value="${s.id}">${s.name}</option>
                    </c:forEach>
                  </select>
                </div>

                <div class="col">
                  <label class="form-label fw-bold"
                    >Chọn Màu Sắc Sản Phẩm:</label
                  >
                  <select class="form-select" name="colorID">
                    <c:forEach var="s" items="${colors}">
                      <option value="${s.id}">${s.name}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>

              <div class="row">
                <div class="form-group col">
                  <label class="fw-bold"
                    >Số Lượng <span class="text-danger">*</span></label
                  >
                  <input
                    type="number"
                    class="form-control"
                    min="0"
                    placeholder="Số Lượng"
                    name="quantity"
                    required
                  />
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Đóng
              </button>
              <button type="submit" class="btn btn-success">Thêm Mới</button>
            </div>
          </div>
        </div>
      </div>
    </form>

    <!-- Modal update -->
    <form id="editProductDetailForm" method="post">
      <div
        class="modal fade"
        id="editModal"
        tabindex="-1"
        aria-labelledby="editModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-xl">
          <div class="modal-content" style="font-size: 14px">
            <div class="modal-header">
              <h5 class="modal-title" id="editModalLabel">
                Chỉnh Sửa Sản phẩm
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>

            <div class="modal-body d-flex flex-column gap-3">
              <div class="row">
                <div class="form-group w-50 col">
                  <label class="fw-bold">Mã Sản Phẩm:</label>
                  <input
                    type="text"
                    name="productID"
                    class="form-control"
                    readonly
                    value="${product.id}"
                  />
                </div>
                <div class="form-group w-50 col">
                  <label class="fw-bold">Tên Sản Phẩm:</label>
                  <input
                    type="text"
                    class="form-control"
                    disabled
                    readonly
                    value="${product.name}"
                  />
                </div>
              </div>

              <div class="row">
                <div class="col">
                  <label class="form-label fw-bold"
                    >Chọn Size Sản Phẩm
                    <span class="text-danger">*</span></label
                  >
                  <select class="form-select" id="sizeP" name="sizeID" disabled>
                    <c:forEach var="s" items="${sizes}">
                      <option value="${s.id}">${s.name}</option>
                    </c:forEach>
                  </select>
                  <input type="hidden" name="sizeID" id="hiddenSizeId" />
                </div>

                <div class="col">
                  <label class="form-label fw-bold"
                    >Chọn Màu Sắc Sản Phẩm:</label
                  >
                  <select
                    class="form-select"
                    id="colorP"
                    name="colorID"
                    disabled
                  >
                    <c:forEach var="s" items="${colors}">
                      <option value="${s.id}">${s.name}</option>
                    </c:forEach>
                  </select>
                  <input type="hidden" name="colorID" id="hiddenColorId" />
                </div>
              </div>

              <div class="row">
                <div class="form-group col">
                  <label class="fw-bold"
                    >Số Lượng <span class="text-danger">*</span></label
                  >
                  <input
                    type="number"
                    class="form-control"
                    min="0"
                    id="quantityP"
                    placeholder="Số Lượng"
                    name="quantity"
                    required
                  />
                </div>
              </div>

              <div class="form-check form-switch">
                <input
                  class="form-check-input"
                  type="checkbox"
                  role="switch"
                  id="flexSwitchCheckChecked"
                  name="status"
                  checked
                  value="true"
                />

                <span id="statusText" class="ms-2 fw-bold text-success"
                  >Hoạt Động</span
                >
              </div>
            </div>

            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Đóng
              </button>
              <button type="submit" class="btn btn-primary">Cập Nhật</button>
            </div>
          </div>
        </div>
      </div>
    </form>
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

            console.log(id);

            const sizeSelect = document.getElementById("sizeP");
            sizeSelect.value = size;
            if (
              !Array.from(sizeSelect.options).some(
                (option) => option.value === size
              )
            ) {
              sizeSelect.value = "";
            }

            let colorSelect = document.getElementById("colorP");
            colorSelect.value = color;

            if (
              !Array.from(colorSelect.options).some(
                (option) => option.value === color
              )
            ) {
              colorSelect.value = "";
            }

            document.getElementById("flexSwitchCheckChecked").checked = status;
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
              window.location.href =
                "/admin/products/deleteProductDetail/" + id;
            }
          });
        });
      });

      confirmDelete = () => {
        return confirm("Bạn có chắc muốn xóa ?");
      };
    </script>
  </body>
</html>
