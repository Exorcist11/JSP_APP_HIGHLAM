document.addEventListener("DOMContentLoaded", async function () {
  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  let cartContainer = document.getElementById("cart-items");
  let totalPriceElement = document.getElementById("total-price");
  let shippingFee = 35000; // Phí vận chuyển cố định
  let total = 0;

  const cartUser = await fetch("/getCart", {
    method: "GET", headers: {
      'Content-Type': 'application/json'
    },
    credentials: 'include'
  })
    .then((response) => response.json())
    .then((data) => { return data })
    .catch((e) => console.error(e));

  const totalServer = cartUser.reduce((sum, item) => sum + item.total, 0)
  console.log(totalServer)




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
            <div class="d-flex align-items-center gap-2">

                <div class="input-group" style="width: 120px">
                  <button
                    class="btn btn-outline-secondary decrement"
                    type="button"
                    id="decrease"
                    data-index="${index}"
                  >
                    -
                  </button>
                  <input
                    type="text"
                    class="form-control text-center"
                    value="${product.quantity}" 
                    data-index="${index}"
                    id="quantity"
                    min="1"
                    readonly
                  />
                  <button
                    class="btn btn-outline-secondary increment"
                    type="button"
                    id="increase"
                    data-index="${index}"
                  >
                    +
                  </button>
                </div>
               
                <button class="btn btn-outline-danger  remove" data-index="${index}">Xóa</button>
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

  document.querySelector("form").addEventListener("submit", async function (event) {
    event.preventDefault();

    const formData = new FormData(event.target);
    const paymentMethod = formData.get("trangThai");

    const cartLocal = cart?.map((item) => ({
      productID: item.productId,
      quantity: item.quantity,
      sizeID: item.selectedSize,
      colorID: item.selectedColor,
    }))

    const cartSever = cartUser?.map((item) => ({
      productID: item.productID,
      quantity: item.quantity,
      sizeID: item.sizeID,
      colorID: item.colorID,
    }))

    const orderData = {
      guestEmail: formData.get("guestEmail"),
      recipientName: formData.get("recipientName"),
      recipientPhone: formData.get("recipientPhone"),
      recipientAddress: formData.get("recipientAddress"),
      note: formData.get("note"),

      productItems: cartSever ? cartSever : cartLocal,
      paymentMethod: paymentMethod == "1" ? "CASH" : "VNPAY",
    };

    console.log("Dữ liệu gửi lên:", JSON.stringify(orderData));

    if (paymentMethod == "2") {
      await fetch(`/pay/${cartUser ? totalServer : total}`, {
        method: "GET",
      })
        .then((response) => response.text())
        .then((url) => (window.location.href = url))
        .catch((e) => console.error(e));
    }
    await fetch("/order/save", {
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
        if (cartUser) {
          fetch("/deleteCart", { method: "DELETE", credentials: "include" })
        }
        window.location.href = "/";
      })
      .catch((err) => console.error("Lỗi khi đặt hàng: ", err));
  });
});
