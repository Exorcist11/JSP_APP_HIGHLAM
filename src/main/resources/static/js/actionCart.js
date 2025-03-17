document.getElementById("decrease").addEventListener("click", function () {
  let qty = document?.getElementById("quantity");
  let value = parseInt(qty.value);
  if (value > 1) qty.value = value - 1;
});

document.getElementById("increase").addEventListener("click", function () {
  let qty = document?.getElementById("quantity");
  qty.value = parseInt(qty.value) + 1;
});

document.addEventListener("DOMContentLoaded", async function () {
  let isLoggedIn = await fetch("/getCurrent")
    .then(response => response.json())
    .then(data => {

      return !!data; // Chuyển về boolean
    })
    .catch(err => {
      return false;
    });


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

    const cartItems = {
      quantity: quantity,
      sizeID: selectedSize,
      colorID: selectedColor,
      productID: productId
    }
    console.log("data send: ", cartItems)

    if (isLoggedIn) {
      syncLocalStorageToServer();

      fetch("/saveCart", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(cartItems),
      })
        .then(response => {
          if (!response.ok) {
            throw new Error("Lỗi từ server!");
          }
          return response.text(); // Trả về text (String)
        })
        .then(data => {
          alert("Thêm sản phẩm thành công!"); // Hiển thị thông báo từ server
          localStorage.removeItem("cart");
        })
        .catch(err => {
          alert("Lỗi khi thêm sản phẩm: " + err.message); // Thông báo nếu có lỗi
          console.error("Lỗi khi đặt hàng: ", err);
        });

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

  document
    .getElementById("addToCartBtn")
    .addEventListener("click", handleAddToCart);

  document.getElementById("buyNow").addEventListener("click", function (event) {
    handleAddToCart(event);
    window.location.href = "/cart/checkout";
  });
});

// Hàm đồng bộ dữ liệu từ LocalStorage lên Server
function syncLocalStorageToServer() {
  let localCart = JSON.parse(localStorage.getItem("cart")) || [];

  if (localCart.length > 0) {
    console.log("Đang đồng bộ giỏ hàng...");

    fetch("/saveCartBulk", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(localCart),
    })
      .then(response => {
        if (!response.ok) {
          throw new Error("Lỗi từ server!");
        }
        return response.text();
      })
      .then(data => {
        console.log(data);
        localStorage.removeItem("cart"); // Xóa giỏ hàng cục bộ sau khi đồng bộ
      })
      .catch(err => {
        console.error("Lỗi khi đồng bộ giỏ hàng:", err);
      });
  }
}
