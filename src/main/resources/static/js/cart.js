document.addEventListener("DOMContentLoaded", function () {
  renderCart();
});

// Hàm hiển thị giỏ hàng từ localStorage
function renderCart() {
  const cartContainer = document.getElementById("cartItems");
  const totalPriceElement = document.getElementById("totalPrice");

  // Lấy danh sách sản phẩm từ localStorage
  let cartItems = JSON.parse(localStorage.getItem("cart")) || [];

  // Nếu giỏ hàng trống
  if (cartItems.length === 0) {
    cartContainer.innerHTML = "<p>Giỏ hàng của bạn đang trống.</p>";
    totalPriceElement.textContent = "0 đ";
    return;
  }

  // Hiển thị danh sách sản phẩm
  let totalPrice = 0;
  cartContainer.innerHTML = ""; // Xóa nội dung cũ
  cartItems.forEach((item, index) => {
    totalPrice += item.price * item.quantity;

    const cartItemHTML = `
      <div class="cart-item d-flex justify-content-between align-items-center">
          <div class="cart-item-image">
              <img width="100px" height="100px" src="../images/ao_phong_boxy/DEVOTUS/black.webp" alt="${
                item.productName
              }" class="img-fluid">
          </div>
          <div class="cart-item-info">
              <p>${item.productName} - ${item.selectedColor} - ${
      item.selectedSize
    }</p>
              <p>${item.price.toLocaleString()} đ x ${item.quantity}</p>
          </div>
          <button class="btn btn-danger btn-sm" onclick="removeFromCart(${index})">Xóa</button>
      </div>
      <hr>
    `;
    cartContainer.innerHTML += cartItemHTML;
  });

  // Cập nhật tổng tiền
  totalPriceElement.textContent = totalPrice.toLocaleString() + " đ";
}

// Hàm xóa sản phẩm khỏi giỏ hàng mà không cần reload trang
function removeFromCart(index) {
  let cartItems = JSON.parse(localStorage.getItem("cart")) || [];

  if (index < 0 || index >= cartItems.length) return;

  cartItems.splice(index, 1); // Xóa sản phẩm theo index
  localStorage.setItem("cart", JSON.stringify(cartItems));

  renderCart(); // Cập nhật lại giao diện ngay lập tức
}
