document.addEventListener("DOMContentLoaded", function () {
    let form = document.getElementById("editProductDetailForm");

    document.querySelectorAll(".edit-btn").forEach((button) => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            let size = this.getAttribute("data-size");
            let color = this.getAttribute("data-color");
            let status = this.getAttribute("data-status");
            let quantity = this.getAttribute("data-quantity");

            console.log(size);
            console.log(color);

            const sizeSelect = document.getElementById("sizeP");
            sizeSelect.value = size;
            if (
                !Array.from(sizeSelect.options).some(
                    (option) => option.value === size
                )
            ) {
                sizeSelect.value = "";
            }

            let colorSelect = document.getElementById("colorP");
            colorSelect.value = color;

            if (
                !Array.from(colorSelect.options).some(
                    (option) => option.value === color
                )
            ) {
                colorSelect.value = "";
            }

            document.getElementById("flexSwitchCheckChecked").checked = status;
            document.getElementById("quantityP").value = quantity;

            form.action = "/admin/products/update/" + id;
        });
    });

    let switchInput = document.getElementById("flexSwitchCheckChecked");
    let statusText = document.getElementById("statusText");

    function updateStatus() {
        if (switchInput.checked) {
            statusText.textContent = "Hoạt Động";
            statusText.classList.remove("text-danger");
            statusText.classList.add("text-success");
            switchInput.value = "true";
        } else {
            statusText.textContent = "Không Hoạt Động";
            statusText.classList.remove("text-success");
            statusText.classList.add("text-danger");
            switchInput.value = "false";
        }
    }

    switchInput.addEventListener("change", updateStatus);

    document.querySelectorAll(".delete-btn").forEach((button) => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
                window.location.href = "/admin/products/delete/" + id;
            }
        });
    });
});

confirmDelete = () => {
    return confirm("Bạn có chắc muốn xóa ?");
};