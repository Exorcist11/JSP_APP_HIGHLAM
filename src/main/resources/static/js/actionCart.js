document.getElementById("decrease").addEventListener("click", function () {
  let qty = document?.getElementById("quantity");
  let value = parseInt(qty.value);
  if (value > 1) qty.value = value - 1;
});

document.getElementById("increase").addEventListener("click", function () {
  let qty = document?.getElementById("quantity");
  qty.value = parseInt(qty.value) + 1;
});

document.addEventListener("DOMContentLoaded", function () {
  let isLoggedIn = false;

  function handleAddToCart(event) {
    event.preventDefault();

    let productId = +document.getElementById("productId")?.value;
    let selectedColor = +document.querySelector(
      'input[name="color"]:checked'
    )?.value;
    let selectedSize = +document.querySelector(
      'input[name="size"]:checked'
    )?.value;
    let quantity = +document.getElementById("quantity").value || 1;
    let productName = document
      .getElementById("productName")
      ?.textContent.trim();
    let price = +document.getElementById("price")?.textContent.trim();

    if (!selectedColor || !selectedSize) {
      alert("Vui lòng chọn màu sắc và kích thước!");
      return;
    }

    if (isLoggedIn) {
      console.log("Người dùng đã đăng nhập");
    } else {
      let cart = JSON.parse(localStorage.getItem("cart")) || [];

      let existingProduct = cart.find(
        (item) =>
          item.productId == productId &&
          item.selectedColor == selectedColor &&
          item.selectedSize == selectedSize
      );

      if (existingProduct) {
        existingProduct.quantity += quantity;
      } else {
        cart.push({
          productId,
          productName,
          price,
          selectedColor,
          selectedSize,
          quantity,
        });
      }

      localStorage.setItem("cart", JSON.stringify(cart));
      alert("Sản phẩm đã được thêm vào giỏ hàng!");
    }
  }

  fetch("/t-shirt-luxury/status")
    .then((response) => response.json())
    .then((data) => {
      isLoggedIn = data.isLoggedIn;
    });

  document
    .getElementById("addToCartBtn")
    .addEventListener("click", handleAddToCart);

  document.getElementById("buyNow").addEventListener("click", function (event) {
    handleAddToCart(event);
    window.location.href = "/cart/checkout";
  });
});
