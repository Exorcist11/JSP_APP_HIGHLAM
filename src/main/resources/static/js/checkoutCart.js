document.addEventListener("DOMContentLoaded", function () {
  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  let cartContainer = document.getElementById("cart-items");
  let totalPriceElement = document.getElementById("total-price");
  let shippingFee = 35000; // Phí vận chuyển cố định

  function renderCart() {
    cartContainer.innerHTML = "";
    let total = 0;

    cart.forEach((product, index) => {
      let row = document.createElement("tr");
      let productPrice = parseFloat(product.price) * product.quantity;
      total += productPrice;

      row.innerHTML = `
        <td><img style="width: 80px; height: 100px; border-radius: 10%;" src="https://via.placeholder.com/80" alt="Ảnh sản phẩm"></td>
        <td>${product.productName} - Màu ${product.selectedColor} - Size ${
        product.selectedSize
      }</td>
        <td class="product-price" data-index="${index}">${productPrice.toLocaleString()}₫</td>
        <td>
          <div class="d-flex align-items-center">
            <button type="button" class="btn btn-outline-secondary btn-sm decrement" data-index="${index}">-</button>
            <input min="1" class="form-control text-center mx-2 quantity" style="width: 50px" type="text" value="${
              product.quantity
            }" data-index="${index}"/>
            <button type="button" class="btn btn-outline-secondary btn-sm increment" data-index="${index}">+</button>
          </div>
        </td>
      `;

      cartContainer.appendChild(row);
    });

    totalPriceElement.innerText = (total + shippingFee).toLocaleString() + "₫";
    localStorage.setItem("cart", JSON.stringify(cart));
  }

  renderCart();

  document.addEventListener("click", function (event) {
    let target = event.target;
    let index = target.getAttribute("data-index");

    if (index !== null) {
      index = parseInt(index);
      let product = cart[index];

      if (target.classList.contains("increment")) {
        product.quantity++;
      } else if (
        target.classList.contains("decrement") &&
        product.quantity > 1
      ) {
        product.quantity--;
      }

      renderCart();
    }
  });

  document.addEventListener("input", function (event) {
    if (event.target.classList.contains("quantity")) {
      let index = parseInt(event.target.getAttribute("data-index"));
      let newValue = parseInt(event.target.value);

      if (!isNaN(newValue) && newValue > 0) {
        cart[index].quantity = newValue;
        renderCart();
      }
    }
  });
});
