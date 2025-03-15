document.addEventListener("DOMContentLoaded", function () {
  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  let cartContainer = document.getElementById("cart-items");
  let totalPriceElement = document.getElementById("total-price");
  let shippingFee = 35000; // Phí vận chuyển cố định

  let total = 0;

  cart.forEach((product) => {
    let row = document.createElement("tr");
    let productPrice = parseFloat(product.price) * product.quantity;
    total += productPrice;

    row.innerHTML = `
          <td><img style="width: 80px; height: 100px; border-radius: 10%;" src="https://via.placeholder.com/80" alt="Ảnh sản phẩm"></td>
          <td>${product.productName} - Màu ${product.selectedColor} - Size ${
      product.selectedSize
    }</td>
          <td>${productPrice.toLocaleString()}₫</td>
          <td>
              <div class="d-flex align-items-center">
                  <button class="btn btn-outline-secondary btn-sm decrement" data-id="${
                    product.productId
                  }">-</button>
                  <input min="1" class="form-control text-center mx-2 quantity" style="width: 50px" type="text" value="${
                    product.quantity
                  }" />
                  <button class="btn btn-outline-secondary btn-sm increment" data-id="${
                    product.productId
                  }">+</button>
              </div>
          </td>
      `;

    cartContainer.appendChild(row);
  });

  // Cập nhật tổng tiền
  totalPriceElement.innerText = (total + shippingFee).toLocaleString() + "₫";

  document.querySelector("form").addEventListener("submit", function (event) {
    event.preventDefault();

    const formData = new FormData(event.target);
    const orderData = {
      guestEmail: formData.get("guestEmail"),
      recipientName: formData.get("recipientName"),
      recipientPhone: formData.get("recipientPhone"),
      recipientAddress: formData.get("recipientAddress"),
      notes: formData.get("note"),
      orderItems: [],
    };

    // Chưa xử lý được case product detail
    orderData.orderItems = cart.map((item) => ({
      productDetailID: 7,
      quantity: item.quantity,
      price: parseFloat(item.price),
    }));

    console.log("Dữ liệu gửi lên:", JSON.stringify(orderData));

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
        // localStorage.removeItem("cart");
        // window.location.href = "/";
      })
      .catch((err) => console.error("Lỗi khi đặt hàng: ", err));
  });
});

document.addEventListener("click", function (event) {
  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  let target = event.target;

  if (
    target.classList.contains("increment") ||
    target.classList.contains("decrement")
  ) {
    let productId = target.getAttribute("data-id");
    let product = cart.find((p) => p.productId === productId);

    if (product) {
      if (target.classList.contains("increment")) {
        product.quantity++;
      } else if (
        target.classList.contains("decrement") &&
        product.quantity > 1
      ) {
        product.quantity--;
      }

      localStorage.setItem("cart", JSON.stringify(cart));

      location.reload();
    }
  }
});
