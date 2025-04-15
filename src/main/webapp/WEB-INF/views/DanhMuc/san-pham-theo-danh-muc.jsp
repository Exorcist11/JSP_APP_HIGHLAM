<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Áo Nam</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
    <link href="../css/danhMucAoNam.css" rel="stylesheet" />
  </head>
  <body>
    <header>
      <jsp:include page="/WEB-INF/views/fragments/header.jsp" />
    </header>

    <div class="container">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a class="home" href="/"><i class="fas fa-home"></i> Trang chủ</a>
          </li>
          <li class="breadcrumb-item active" aria-current="page">Áo Nam</li>
        </ol>
      </nav>
      <h1 class="mt-3">Áo Nam</h1>

      <nav class="navbar-expand-lg">
        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
          <h4 class="mt-text">Bộ Lọc</h4>
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <button
                class="btn btn-light dropdown-toggle"
                href="#"
                id="navbarDarkDropdownMenuLink"
                role="button"
                aria-expanded="false"
              >
                Màu Sắc
              </button>
              <ul
                class="dropdown-menu p-3"
                aria-labelledby="dropdownMenuButton1"
              >
                <div class="d-flex flex-wrap">
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorRed"
                    />
                    <div class="color-box" style="background-color: red"></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorBrown"
                    />
                    <div
                      class="color-box"
                      style="background-color: brown"
                    ></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorPink"
                    />
                    <div class="color-box" style="background-color: pink"></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorBlack"
                    />
                    <div
                      class="color-box"
                      style="background-color: black"
                    ></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorBlue"
                    />
                    <div class="color-box" style="background-color: blue"></div>
                  </label>
                  <label>
                    <input
                      type="checkbox"
                      class="color-checkbox"
                      id="colorYellow"
                    />
                    <div
                      class="color-box"
                      style="background-color: yellow"
                    ></div>
                  </label>
                </div>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <button
                class="btn btn-light dropdown-toggle"
                href="#"
                id="2"
                role="button"
                aria-expanded="false"
              >
                Kích Cỡ
              </button>
              <ul
                class="dropdown-menu p-3"
                aria-labelledby="dropdownMenuButton2"
              >
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="sizeS"
                  />
                  <label class="form-check-label" for="sizeS">S</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="sizeM"
                  />
                  <label class="form-check-label" for="sizeM">M</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="sizeL"
                  />
                  <label class="form-check-label" for="sizeL">L</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="sizeXL"
                  />
                  <label class="form-check-label" for="sizeXL">XL</label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="size2XL"
                  />
                  <label class="form-check-label" for="size2XL">2XL</label>
                </div>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <button
                class="btn btn-light dropdown-toggle"
                href="#"
                id="1"
                role="button"
                aria-expanded="false"
              >
                Khoảng Giá
              </button>
              <ul
                class="dropdown-menu p-3"
                aria-labelledby="dropdownMenuButton3"
              >
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="price1"
                  />
                  <label class="form-check-label" for="price1"
                    >Dưới 200,000</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="price2"
                  />
                  <label class="form-check-label" for="price2"
                    >Từ 200,000 - 500,000</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="price3"
                  />
                  <label class="form-check-label" for="price3"
                    >Từ 500,000 - 1,000,000</label
                  >
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="price4"
                  />
                  <label class="form-check-label" for="price4"
                    >Trên 1,000,000</label
                  >
                </div>
              </ul>
            </li>
          </ul>

          <div class="sort-container">
            <span class="sort-label" style="width: 100%">Sắp xếp theo:</span>
            <select
              class="form-select dropdown"
              aria-label="Default select example"
            >
              <option
                class="btn btn-secondary dropdown-toggle"
                type="button"
                id="dropdownMenuButton"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                selected
              >
                Mới nhất
              </option>
              <option class="dropdown-item" href="#" value="1">Mới nhất</option>
              <option class="dropdown-item" href="#" value="2">
                Giá giảm dần
              </option>
              <option class="dropdown-item" href="#" value="3">
                Giá tăng dần
              </option>
            </select>
          </div>
        </div>
      </nav>

      <div class="row">
        <c:forEach items="${products}" var="p">
          <div class="col-md-3">
            <div class="card product-card">
              <img
                alt="Anh1"
                src="${p.imgUrl}"
                width="600"
                height="288"
                style="object-fit: cover; object-position: center"
              />
              <div class="product-info">
                <div class="colors">
                  <img
                    alt="option 1"
                    height="20"
                    src="../images/ao_phong_boxy/DEVOTUS/black.webp"
                    width="20"
                  />
                </div>
                <p>${p.name}</p>
                <p class="price">
                  <fmt:formatNumber
                    value="${p.price}"
                    groupingUsed="true"
                    maxFractionDigits="0"
                  />
                  VND
                </p>
              </div>
              <div class="product-actions">
                <button class="btn btn-dark">
                  <i class="fas fa-shopping-cart"></i> Mua nhanh
                </button>
                <a href="/product?id=${p.id}" class="btn btn-outline-dark"
                  ><i class="fas fa-eye"></i> Xem chi tiết</a
                >
              </div>
            </div>
          </div>
        </c:forEach>
      </div>

      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>

      <div class="row mt-5" style="padding-left: 2rem">
        <img
          src="https://pos.nvncdn.com/be3159-662/bn/20240921_h3xCoY0r.gif"
          alt=""
        />
      </div>
    </div>

    <footer class="container py-5">
      <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
    </footer>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
  </body>
</html>
