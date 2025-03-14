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

    fetch('/t-shirt-luxury/status').then((response) => response.json()).then(data => { isLoggedIn = data.isLoggedIn })

    document.getElementById('addToCartBtn').addEventListener('click', function (event) {
        event.preventDefault()
        let productId = document.getElementById("productId").value;
        let selectedColor = document.querySelector('input[name="color"]:checked').value;
        let selectedSize = document.querySelector('input[name="size"]:checked').value;
        let quantity = document.getElementById("quantity").value;
        let productName = document.getElementById("productName")?.textContent.trim()
        let price = document.getElementById("price")?.textContent.trim()

        if (isLoggedIn) {
            console.log('loggin')
        } else {
            let cart = JSON.parse(localStorage.getItem('cart')) || []
            if (!cart) localStorage.setItem('cart', JSON.stringify([]))
            cart.push({ productId, productName, price, selectedColor, selectedSize, quantity })
            localStorage.setItem('cart', JSON.stringify(cart))
        }

    })
})