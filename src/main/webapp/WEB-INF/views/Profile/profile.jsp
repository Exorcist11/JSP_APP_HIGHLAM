<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>T-SHIRT LUXURY</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      inegrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="../js/script.js"></script>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />
    <!-- End Header -->

    <div class="container-fluid" style="margin-top: 90px">
      <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-primary">
          <jsp:include page="/WEB-INF/views/Profile/fragments/sideBar.jsp" />
        </div>

        <div class="col py-3">
          <h3>Trang cá nhân</h3>
          <form method="post" action="/updateProfile">
            <div class="mb-3">
              <input
                style="width: 600px; height: 50px"
                class="form-control me-2"
                placeholder="Họ và Tên"
                name="fullName"
                value="${profile.fullName}"
                required
              />
            </div>
            <div class="mb-3">
              <input
                style="width: 600px; height: 50px"
                class="form-control me-2"
                placeholder="Số điện thoại"
                name="phoneNumber"
                value="${profile.phoneNumber}"
                required
              />
            </div>
            <div class="mb-3">
              <input
                style="width: 600px; height: 50px"
                class="form-control me-2"
                placeholder="Địa chỉ"
                name="address"
                value="${profile.address}"
                required
              />
            </div>
            <button type="submit" class="w-25">Lưu</button>
          </form>
        </div>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
  </body>
</html>
