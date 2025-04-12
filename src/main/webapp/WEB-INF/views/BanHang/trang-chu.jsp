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
    <img
      class="banner-top"
      style="padding-top: 90px"
      src="../images/banner/banner1.jpg"
      alt="T-shirt Luxury"
    />

    <!-- End Header -->
    <div class="container">
      <jsp:include page="/WEB-INF/views/fragments/newProduct.jsp" />

      <jsp:include page="/WEB-INF/views/fragments/productForYou.jsp" />

      <jsp:include page="/WEB-INF/views/fragments/lookBook.jsp" />

      <jsp:include page="/WEB-INF/views/fragments/listBlog.jsp" />
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

    <script
      src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
