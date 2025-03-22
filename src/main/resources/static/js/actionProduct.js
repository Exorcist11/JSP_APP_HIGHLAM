document.addEventListener("DOMContentLoaded", function () {
    let form = document.getElementById("editCategoryForm");

    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            let code = this.getAttribute("data-code");
            let name = this.getAttribute("data-name");
            let price = this.getAttribute("data-price");
            let status = this.getAttribute("data-status")
            let description = this.getAttribute("data-description");
            let category = this.getAttribute("data-category");


            document.getElementById("code").value = code;
            document.getElementById("nameP").value = name;
            document.getElementById("priceP").value = price;
            document.getElementById("flexSwitchCheckChecked").checked = status;
            document.getElementById("descriptionP").value = description;
            let categorySelect = document.getElementById("categoryIdP");
            categorySelect.value = category;

            if (!Array.from(categorySelect.options).some(option => option.value === category)) {
                categorySelect.value = "";
            }

            form.action = "/admin/products/update/" + id;
        })

    })

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

    document.querySelectorAll(".delete-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
                window.location.href = "/admin/products/delete/" + id;
            }
        });
    });
})

confirmDelete = () => {
    return confirm("Bạn có chắc muốn xóa ?");
};