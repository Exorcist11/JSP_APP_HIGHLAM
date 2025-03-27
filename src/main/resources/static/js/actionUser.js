document.addEventListener("DOMContentLoaded", function () {
    let userForm = document.getElementById("editUserForm");

    // Xử lý sự kiện click nút "Chỉnh Sửa"
    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            let username = this.getAttribute("data-username");
            let email = this.getAttribute("data-email");
            let role = this.getAttribute("data-role");
            let status = this.getAttribute("data-status");


            // Điền dữ liệu vào form
            document.getElementById("userId").value = id;
            document.getElementById("usernameU").value = username;
            document.getElementById("emailU").value = email;
            document.getElementById("roleU").value = role;
            document.getElementById("statusU").value = status;

            // Cập nhật action form
            userForm.action = "/admin/user/update/" + id;

        });
    });

    // Xác nhận xóa người dùng
    document.querySelectorAll(".delete-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            console.log(id)
            if (confirm("Bạn có chắc chắn muốn xóa người dùng này?")) {
                window.location.href = "/admin/user/delete/" + id;
            }
        });
    });

});