document.addEventListener("DOMContentLoaded", function () {
    // Lắng nghe sự kiện click vào nút "Chỉnh Sửa"
    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            const id = this.getAttribute("data-id");
            const code = this.getAttribute("data-code");
            const name = this.getAttribute("data-name");
            const price = this.getAttribute("data-price");
            const status = this.getAttribute("data-status");
            const description = this.getAttribute("data-description");
            const category = this.getAttribute("data-category");

            document.getElementById("code").value = code;
            document.getElementById("nameP").value = name;
            document.getElementById("priceP").value = price;
            document.getElementById("descriptionP").value = description;

            let categorySelect = document.getElementById("categoryIdP");
            categorySelect.value = category;
            if (!Array.from(categorySelect.options).some(option => option.value === category)) {
                categorySelect.value = "";
            }

            // Gán giá trị dropdown status
            let statusSelect = document.getElementById("statusSelect");
            statusSelect.value = status;

            document.getElementById("editCategoryForm").action = "/admin/products/update/" + id;
        });
    });

    // Xử lý nút xóa
    document.querySelectorAll(".delete-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này?")) {
                window.location.href = "/admin/products/delete/" + id;
            }
        });
    });
});

// Hàm xác nhận xóa
function confirmDelete() {
    return confirm("Bạn có chắc muốn xóa ?");
}
