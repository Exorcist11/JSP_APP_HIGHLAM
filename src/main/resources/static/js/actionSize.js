document.addEventListener("DOMContentLoaded", function () {
    let form = document.getElementById("editSizeForm");
    
    // Lắng nghe sự kiện click vào nút "Chỉnh Sửa"
    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            let name = this.getAttribute("data-name");
            let description = this.getAttribute("data-description");
            let status = this.getAttribute("data-status");
            
            // Gán giá trị vào modal
            document.getElementById("editSizeId").value = id;
            document.getElementById("editSizeName").value = name;
            document.getElementById("editSizeDescription").value = description;
            
            // Set selected option in dropdown based on status
            document.getElementById("editSizeStatus").value = status;
            
            form.action = "/admin/sizes/update/" + id;
        });
    });
    
    document.querySelectorAll(".delete-btn").forEach(button => {
        button.addEventListener("click", function () {
            let id = this.getAttribute("data-id");
            if (confirm("Bạn có chắc chắn muốn xóa size này?")) {
                window.location.href = "/admin/sizes/delete/" + id;
            }
        });
    });
});

confirmDelete = () => {
    return confirm("Bạn có chắc muốn xóa ?");
};