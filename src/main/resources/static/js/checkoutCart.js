document.addEventListener("DOMContentLoaded", function () {
  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  let cartContainer = document.getElementById("cart-items");
  let totalPriceElement = document.getElementById("total-price");
  let shippingFee = 35000; // Phí vận chuyển cố định
  let total = 0;

  function renderCart() {
    cartContainer.innerHTML = ""; // Xóa nội dung cũ


    cart.forEach((product, index) => {
      let row = document.createElement("tr");
      let productPrice = parseFloat(product.price) * product.quantity;
      total += productPrice;

      row.innerHTML = `
        <td><img style="width: 80px; height: 100px; border-radius: 10%;" src="https://via.placeholder.com/80" alt="Ảnh sản phẩm"></td>
        <td>${product.productName} - Màu ${product.selectedColor} - Size ${product.selectedSize}</td>
        <td>${productPrice.toLocaleString()}₫</td>
        <td>
            <div class="d-flex align-items-center">
                <button class="btn btn-outline-secondary btn-sm decrement" data-index="${index}">-</button>
                <input min="1" class="form-control text-center mx-2 quantity" style="width: 50px" type="text" value="${product.quantity}" data-index="${index}" />
                <button class="btn btn-outline-secondary btn-sm increment" data-index="${index}">+</button>
                <button class="btn btn-outline-danger btn-sm remove" data-index="${index}">X</button>
            </div>
        </td>
      `;

      cartContainer.appendChild(row);
    });

    // Cập nhật tổng tiền
    totalPriceElement.innerText = (total + shippingFee).toLocaleString() + "₫";
  }

  renderCart(); // Hiển thị giỏ hàng ban đầu

  document.addEventListener("click", function (event) {
    let target = event.target;
    let index = target.getAttribute("data-index");

    if (index !== null) {
      index = parseInt(index);

      if (target.classList.contains("increment")) {
        cart[index].quantity++;
      } else if (target.classList.contains("decrement") && cart[index].quantity > 1) {
        cart[index].quantity--;
      } else if (target.classList.contains("remove")) {
        cart.splice(index, 1);
      }

      localStorage.setItem("cart", JSON.stringify(cart));
      requestAnimationFrame(renderCart); // Tránh bị khựng khi cập nhật giao diện
    }
  });

  document.addEventListener("input", function (event) {
    let target = event.target;
    let index = target.getAttribute("data-index");

    if (index !== null && target.classList.contains("quantity")) {
      index = parseInt(index);
      let newQuantity = parseInt(target.value);

      if (!isNaN(newQuantity) && newQuantity > 0) {
        cart[index].quantity = newQuantity;
        localStorage.setItem("cart", JSON.stringify(cart));
        requestAnimationFrame(renderCart);
      }
    }
  });

  document.querySelector("form").addEventListener("submit", function (event) {
    event.preventDefault();

    const formData = new FormData(event.target);
    const paymentMethod = formData.get("trangThai");
    const orderData = {
      guestEmail: formData.get("guestEmail"),
      recipientName: formData.get("recipientName"),
      recipientPhone: formData.get("recipientPhone"),
      recipientAddress: formData.get("recipientAddress"),
      note: formData.get("note"),
      productItems: cart.map((item) => ({
        productID: item.productId,
        quantity: item.quantity,
        sizeID: item.selectedSize,
        colorID: item.selectedColor,
      })),
      paymentMethod: paymentMethod == "1" ? "CASH" : "VNPAY",
    };

    console.log("Dữ liệu gửi lên:", JSON.stringify(orderData));

    if (paymentMethod == "2") {
      fetch(`/pay/${total}`, {
        method: "GET",
      })
        .then((response) => response.text())
        .then((url) => (window.location.href = url))
        .catch((e) => console.error(e));
    }
    fetch("/order/save", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(orderData),
    })
      .then((response) => response.json())
      .then((data) => {
        alert("Đặt hàng thành công");
        localStorage.removeItem("cart");
        window.location.href = "/";
      })
      .catch((err) => console.error("Lỗi khi đặt hàng: ", err));
  });
});
