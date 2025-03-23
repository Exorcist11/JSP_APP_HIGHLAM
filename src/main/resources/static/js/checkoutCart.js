document.addEventListener("DOMContentLoaded", async function () {
  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  let cartContainer = document.getElementById("tableCart");
  let totalPriceElement = document.getElementById("total-price");
  let shippingFee = 35000; // Phí vận chuyển cố định
  let total = 0;

  function renderCart() {
    cartContainer.innerHTML = "";

    let table = document.createElement("table");
    table.classList.add("table", "table-bordered", "text-center", "mt-3");

    let thead = document.createElement("thead");
    thead.classList.add("table-light");
    thead.innerHTML = `
        <tr>
            <th>Tên sản phẩm</th>
            <th>Size</th>
            <th>Màu sắc</th>
            <th>Số lượng</th>
            <th>Giá</th>
        </tr>
    `;

    let tbody = document.createElement("tbody");
    tbody.id = "tableBody";

    cart.forEach((product, index) => {
      let row = document.createElement("tr");
      let productPrice = parseFloat(product.price) * product.quantity;
      total += productPrice;

      row.innerHTML = `
            <td>${product.productName}</td>
            <td>${product.selectedSize}</td>
            <td>${product.selectedColor}</td>
            <td>${product.quantity}</td>
            <td>${productPrice.toLocaleString()}₫</td>
        `;

      tbody.appendChild(row);
    });

    table.appendChild(thead);
    table.appendChild(tbody);


    cartContainer.appendChild(table);

    if (totalPriceElement) {
      totalPriceElement.innerText = (total + shippingFee).toLocaleString() + "₫";
    }
  }

  const cartUser = await fetch("/getCart", {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
    credentials: "include",
  })
    .then(async (response) => {
      if (!response.ok) {
        console.warn("Người dùng chưa đăng nhập hoặc giỏ hàng trống!");
        return null; // Trả về null nếu chưa đăng nhập
      }
      return response.json();
    })
    .catch((e) => {
      console.error("Lỗi khi lấy giỏ hàng:", e);
      return null; // Trả về null khi có lỗi bất ngờ
    });


  !cartUser && renderCart(); // Hiển thị giỏ hàng ban đầu

  const totalServer = cartUser?.reduce((sum, item) => sum + item.total, 0)

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
      requestAnimationFrame(renderCart);
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
