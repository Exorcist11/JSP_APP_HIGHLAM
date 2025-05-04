document.addEventListener("DOMContentLoaded", function () {
    let form = document.getElementById("editColorForm");
    
    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            let name = this.getAttribute("data-name");
            let status = this.getAttribute("data-status");
            let colorHex = this.getAttribute("data-hex");
            
            document.getElementById("editColorId").value = id;
            document.getElementById("colorName").value = name;
            document.getElementById("colorHex").value = colorHex;
            
            // Set dropdown value based on status
            document.getElementById("editColorStatus").value = status;
            
            form.action = "/admin/colors/update/" + id;
        });
    });
    
    // Preview color khi nhập mã hex (tùy chọn)
    const colorHexInput = document.getElementById("colorHex");
    if (colorHexInput) {
        colorHexInput.addEventListener("input", function() {
            try {
                // Thêm # nếu người dùng không nhập
                let hexValue = this.value;
                if (hexValue && !hexValue.startsWith('#')) {
                    hexValue = '#' + hexValue;
                }
                this.style.borderColor = hexValue;
            } catch (e) {
                // Nếu giá trị không hợp lệ, giữ nguyên border
            }
        });
    }
    
    document.querySelectorAll(".delete-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            if (confirm("Bạn có chắc chắn muốn xóa màu sắc này?")) {
                window.location.href = "/admin/colors/delete/" + id;
            }
        });
    });
});

confirmDelete = () => {
    return confirm("Bạn có chắc muốn xóa ?");
};