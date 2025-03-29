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
    <div>
      <jsp:include page="/WEB-INF/views/fragments/headerAdmin.jsp" />

      <div class="row mt-3">
        <jsp:include page="/WEB-INF/views/fragments/menuAdmin.jsp" />
        <div class="col-9" style="">
          <div class="row">
            <h2 class="">Quản Lý Đợt Giảm Giá</h2>

            <div class="p-2 bd-highlight d-flex justify-content-end">
              <button
                type="button"
                class="btn btn-outline-success"
                data-bs-toggle="modal"
                data-bs-target="#themDotGiamGia"
              >
                <i class="fa-solid fa-circle-plus"></i> Thêm Mới
              </button>
            </div>

            <table class="table table-striped border rounded">
              <thead>
                <tr>
                  <th scope="col">STT</th>
                  <th scope="col">Mã Đợt Giảm Giá</th>
                  <th scope="col">Tên Đợt Giảm Giá</th>
                  <th scope="col">Giá Trị Giảm (%)</th>
                  <th scope="col">Ngày Bắt Đầu</th>
                  <th scope="col">Ngày Kết Thúc</th>
                  <th scope="col">Mô Tả</th>
                  <th scope="col">Trạng Thái</th>
                  <th scope="col">Hành Động</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${listGiamGia}" varStatus="i" var="gg">
                  <tr>
                    <th scope="row">${i.index+1}</th>
                    <td>${gg.maDotGiamGia}</td>
                    <td>${gg.tenDotGiamGia}</td>
                    <td>${gg.giaTriGiam}</td>
                    <td>${gg.ngayBatDau}</td>
                    <td>${gg.ngayKetThuc}</td>
                    <td>${gg.moTa}</td>
                    <td>
                      <c:if test="${gg.trangThai == 1}"> Hoạt Động </c:if>
                      <c:if test="${gg.trangThai == 0}"> Không Hoạt Động </c:if>
                    </td>
                    <td>
                      <a
                        class="btn btn-warning rounded-pill"
                        data-toggle="tooltip"
                        data-placement="top"
                        title="Chỉnh Sửa"
                        href="/t-shirt-luxury/admin/giam-gia/getOne?id=${gg.id}"
                      >
                        <i class="fa-solid fa-pen-to-square"></i
                      ></a>

                      <a
                        class="btn btn-danger rounded-pill"
                        data-toggle="tooltip"
                        href="/t-shirt-luxury/admin/giam-gia/delete?id=${gg.id}"
                        onclick="return confirmDelete()"
                        data-placement="top"
                        title="Xóa"
                        ><i class="fa-solid fa-trash"></i
                      ></a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal add-->
    <div
      class="modal fade"
      id="themDotGiamGia"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
              Thêm Mới Đợt Giảm Giá
            </h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <form action="/t-shirt-luxyry/admin/giam-gia/add" method="post">
            <div class="modal-body">
              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="floatingInput"
                  placeholder="Mã Đợt Giảm Giá"
                  name="maDotGiamGia"
                />
                <label for="floatingInput">Mã Đợt Giảm Giá</label>
              </div>

              <div class="form-floating mb-3">
                <input
                  type="text"
                  class="form-control"
                  id="floatingInput"
                  placeholder="Tên Đợt Giảm Giá"
                  name="tenDotGiamGia"
                />
                <label for="floatingInput">Tên Đợt Giảm Giá</label>
              </div>

              <div class="form-floating mb-3">
                <input
                  type="number"
                  class="form-control"
                  id="floatingInput"
                  placeholder="Giá Trị Giảm"
                  name="giaTriGiam"
                />
                <label for="floatingInput">Giá Trị Giảm</label>
              </div>
              <div class="mt-3">
                <div class="text mt-2">Trạng Thái</div>
                <div class="form-check form-check-inline mt-2">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="trangThai"
                    id="hoatDong"
                    value="1"
                  />
                  <label class="form-check-label">Hoạt Động</label>
                </div>
                <div class="form-check form-check-inline mt-2">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="trangThai"
                    id="khongHoatDong"
                    value="0"
                  />
                  <label class="form-check-label">Chưa Hoạt Động</label>
                </div>
              </div>

              <div class="mb-3 mt-3">
                <label for="exampleFormControlTextarea1" class="form-label"
                  >Mô tả</label
                >
                <textarea
                  class="form-control"
                  id="exampleFormControlTextarea1"
                  rows="3"
                  name="moTa"
                ></textarea>
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
          </form>
        </div>
      </div>
    </div>
  </body>
  <script>
    confirmDelete = () => {
      return confirm("Bạn có chắc chắn muốn xóa Giảm Giá này không ?");
    };
  </script>
</html>
