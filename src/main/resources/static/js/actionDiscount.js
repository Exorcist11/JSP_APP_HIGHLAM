document.addEventListener("DOMContentLoaded", function () {
    let form = document.getElementById("editSizeForm");
    // Lắng nghe sự kiện click vào nút "Chỉnh Sửa"
    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            const id = this.getAttribute("data-id");
            const code = this.getAttribute("data-code");
            const percentage = this.getAttribute("data-percentage");
            const startDate = this.getAttribute("data-startdate");
            const endDate = this.getAttribute("data-enddate");
            const status = this.getAttribute("data-status") === "true";

            document.getElementById("editDiscountId").value = id;
            document.getElementById("editCode").value = code;
            document.getElementById("editPercentage").value = percentage;

            document.getElementById("editStartDate").value = startDate.slice(0, 16);
            document.getElementById("editEndDate").value = endDate.slice(0, 16);

            document.getElementById("editStatus").checked = status;
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
            if (confirm("Bạn có chắc chắn muốn xóa mã giảm giá này?")) {
                window.location.href = "/admin/discount/delete/" + id;
            }
        });
    });

});

confirmDelete = () => {
    return confirm("Bạn có chắc muốn xóa ?");
};

