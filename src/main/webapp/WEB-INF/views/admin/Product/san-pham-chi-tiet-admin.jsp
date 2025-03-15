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
  <body class="container">
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
        <h2 class="">Quản Lý Sản Phẩm</h2>

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
                      <a class="btn btn-warning rounded-pill" title="Chỉnh Sửa">
                        <i class="fa-solid fa-pen-to-square"></i>
                      </a>
                      <a
                        class="btn btn-danger rounded-pill"
                        data-toggle="tooltip"
                        title="Xóa"
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
                <!-- <div class="form-group  col">
                                    <label class="fw-bold">Giá sản phẩm <span class="text-danger">*</span>
                                    </label>
                                    <input type="number" class="form-control" placeholder="Giá sản phẩm"
                                        name="price" required>
                                </div> -->
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
    <div
      class="modal fade"
      id="suaNguoiDung"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
              Cập Nhật Sản Phẩm
            </h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="form-floating mb-3">
              <input
                type="text"
                class="form-control"
                id="floatingInput"
                placeholder="Mã Sản Phẩm"
                disabled
                readonly
              />
              <label for="floatingInput">Tên Sản Phẩm</label>
            </div>
            <div class="mb-3">
              <label for="formFile" class="form-label">Tải Ảnh Lên</label>
              <input class="form-control" type="file" id="formFile" />
            </div>
            <select class="form-select" aria-label="Default select example">
              <option selected>Size</option>
              <option value="1">Size 1</option>
              <option value="2">Size 2</option>
              <option value="3">Size 3</option>
            </select>

            <select
              class="form-select mt-3"
              aria-label="Default select example"
            >
              <option selected>Chất Liệu</option>
              <option value="1">Size 1</option>
              <option value="2">Size 2</option>
              <option value="3">Size 3</option>
            </select>

            <select
              class="form-select mt-3"
              aria-label="Default select example"
            >
              <option selected>Màu Sắc</option>
              <option value="1">Size 1</option>
              <option value="2">Size 2</option>
              <option value="3">Size 3</option>
            </select>

            <div class="form-floating mb-3 mt-3">
              <input
                type="number"
                class="form-control"
                id="floatingInput"
                placeholder="Số Lượng"
              />
              <label for="floatingInput">Số Lượng</label>
            </div>
            <select class="form-select" aria-label="Default select example">
              <option selected>Danh Mục</option>
              <option value="1">Danh Mục 1</option>
              <option value="2">Danh Mục 2</option>
              <option value="3">Danh Mục 3</option>
            </select>

            <div>
              <div class="text mt-2">Trạng Thái</div>
              <div class="form-check form-check-inline mt-2">
                <input
                  class="form-check-input"
                  type="radio"
                  name="inlineRadioOptions"
                  id="inlineRadio1"
                  value="option1"
                />
                <label class="form-check-label" for="inlineRadio1">Bán</label>
              </div>
              <div class="form-check form-check-inline mt-2">
                <input
                  class="form-check-input"
                  type="radio"
                  name="inlineRadioOptions"
                  id="inlineRadio2"
                  value="option2"
                />
                <label class="form-check-label" for="inlineRadio2"
                  >Chưa Bán</label
                >
              </div>
            </div>
            <div class="form-floating mb-3 mt-3">
              <input
                type="number"
                class="form-control"
                id="floatingInput"
                placeholder="Khối Lượng"
              />
              <label for="floatingInput">Khối Lượng</label>
            </div>
            <div class="mb-3">
              <label for="exampleFormControlTextarea1" class="form-label"
                >Mô tả sản phẩm</label
              >
              <textarea
                class="form-control"
                id="exampleFormControlTextarea1"
                rows="3"
              ></textarea>
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
            <button type="button" class="btn btn-success">Thêm Mới</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
