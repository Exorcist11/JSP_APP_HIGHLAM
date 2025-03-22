document.addEventListener("DOMContentLoaded", function () {
    let form = document.getElementById("editColorForm");

    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            let name = this.getAttribute("data-name");
            let status = this.getAttribute("data-status")
            let colorHex = this.getAttribute("data-hex");
       

            document.getElementById("colorName").value = name;
            document.getElementById("colorHex").value = colorHex;
            document.getElementById("flexSwitchCheckChecked").checked = status;

            form.action = "/admin/colors/update/" + id;
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
            if (confirm("Bạn có chắc chắn muốn xóa màu sắc này?")) {
                window.location.href = "/admin/colors/delete/" + id;
            }
        });
    });
})

confirmDelete = () => {
    return confirm("Bạn có chắc muốn xóa ?");
};