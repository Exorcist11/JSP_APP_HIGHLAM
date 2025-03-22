document.addEventListener("DOMContentLoaded", function () {
    let form = document.getElementById("editCategoryForm");
    // Lắng nghe sự kiện click vào nút "Chỉnh Sửa"
    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            let name = this.getAttribute("data-name");

            let status = this.getAttribute("data-status")

            // Gán giá trị vào modal
            document.getElementById("editCategoryId").value = id;
            document.getElementById("categoryName").value = name;

            document.getElementById("flexSwitchCheckChecked").checked = status;

            form.action = "/admin/categories/update/" + id;
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

    document.querySelectorAll(".delete-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            if (confirm("Bạn có chắc chắn muốn xóa danh mục này?")) {
                window.location.href = "/admin/categories/delete/" + id;
            }
        });
    });

});

confirmDelete = () => {
    return confirm("Bạn có chắc muốn xóa ?");
};

