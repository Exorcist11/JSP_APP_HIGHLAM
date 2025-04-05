document.addEventListener("DOMContentLoaded", function () {
    // ========== Xử lý chung ==========
    const confirmDelete = () => confirm("Bạn có chắc muốn xóa?");

    // ========== Xử lý Category ==========
    const editCategoryForm = document.getElementById("editCategoryForm");
    const switchInput = document.getElementById("flexSwitchCheckChecked");
    const statusText = document.getElementById("statusText");

    // Cập nhật trạng thái hiển thị
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

    // Xử lý nút chỉnh sửa category
    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            const id = this.getAttribute("data-id");
            const name = this.getAttribute("data-name");
            const status = this.getAttribute("data-status") === "true";

            document.getElementById("editCategoryId").value = id;
            document.getElementById("categoryName").value = name;
            switchInput.checked = status;
            updateStatus();

            // Cập nhật action form
            editCategoryForm.action = "/admin/categories/update/" + id;

            // Set categoryId cho form thêm detail và load danh sách
            document.getElementById("categoryIdForDetail").value = id;
            loadCategoryDetails(id);
        });
    });

    // Xử lý nút xóa category
    document.querySelectorAll(".delete-btn").forEach(button => {
        button.addEventListener("click", function () {
            const id = this.getAttribute("data-id");
            if (confirmDelete()) {
                window.location.href = "/admin/categories/delete/" + id;
            }
        });
    });

    // Xử lý thay đổi trạng thái
    switchInput.addEventListener("change", updateStatus);

    // ========== Xử lý Category Detail ==========
    const addDetailForm = document.getElementById("addDetailForm");

    // Xử lý submit form thêm detail
    if (addDetailForm) {
        addDetailForm.addEventListener("submit", function (e) {
            e.preventDefault();

            const formData = {
                categoryId: this.categoryId.value,
                name: this.name.value
            };
            console.log("Form submitted", formData);

            fetch('/admin/categories/saveDetail', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData)
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        loadCategoryDetails(formData.categoryId);
                        this.reset();
                        showToast('Thêm danh mục chi tiết thành công!', 'success');
                    } else {
                        showToast('Lỗi: ' + data.message, 'error');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    showToast('Có lỗi xảy ra khi thêm danh mục chi tiết', 'error');
                });
        });
    }

    // Hàm load danh sách category detail
    function loadCategoryDetails(categoryId) {
        fetch(`/admin/categories/${categoryId}/details`)
            .then(response => response.json())
            .then(details => {
                const tableBody = document.getElementById("categoryDetailsTable");
                if (!tableBody) return;

                tableBody.innerHTML = '';
                console.log("Details loaded:", details);

                details?.forEach(detail => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td class="align-middle">${detail.name}</td>
                        <td class="align-middle">
                            ${detail.status
                            ? '<span class="badge bg-success">Hoạt Động</span>'
                            : '<span class="badge bg-danger">Không Hoạt Động</span>'}
                        </td>
                        <td class="d-flex gap-2 align-middle justify-content-end">
                            <button class="btn edit-detail-btn mb-0" data-id="${detail.id}">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <button class="btn delete-detail-btn mb-0" data-id="${detail.id}">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </td>
                    `;
                    tableBody.appendChild(row);
                });

                // Thêm sự kiện cho các nút edit/delete detail
                addDetailEvents();
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi khi tải danh sách chi tiết', 'error');
            });
    }

    // Thêm sự kiện cho các nút trong bảng detail
    function addDetailEvents() {
        // Xử lý nút sửa detail
        document.querySelectorAll('.edit-detail-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                const detailId = this.getAttribute('data-id');
                // Triển khai logic edit detail tại đây
                console.log('Edit detail:', detailId);
            });
        });

        // Xử lý nút xóa detail
        document.querySelectorAll('.delete-detail-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                const detailId = this.getAttribute('data-id');
                if (confirmDelete()) {
                    deleteCategoryDetail(detailId);
                }
            });
        });
    }

    // Hàm xóa category detail
    function deleteCategoryDetail(detailId) {
        fetch(`/admin/categories/details/delete/${detailId}`, {
            method: 'DELETE'
        })
            .then(response => {
                if (response.ok) {
                    const categoryId = document.getElementById("categoryIdForDetail").value;
                    loadCategoryDetails(categoryId);
                    showToast('Xóa danh mục chi tiết thành công', 'success');
                } else {
                    showToast('Xóa danh mục chi tiết thất bại', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi xảy ra khi xóa danh mục chi tiết', 'error');
            });
    }

    // Hàm hiển thị thông báo (tuỳ chọn)
    function showToast(message, type = 'success') {
        // Triển khai toast notification của bạn ở đây
        console.log(`${type.toUpperCase()}: ${message}`);
        // Ví dụ sử dụng Bootstrap Toast:
        // const toast = new bootstrap.Toast(document.getElementById('liveToast'));
        // document.getElementById('toastMessage').textContent = message;
        // document.getElementById('liveToast').classList.add(`text-bg-${type}`);
        // toast.show();
    }
});