document.addEventListener("DOMContentLoaded", function () {
    // ========== Xử lý chung ==========
    const confirmDelete = () => confirm("Bạn có chắc muốn xóa?");
    window.confirmDelete = confirmDelete;

    // ========== Xử lý Category ==========
    const editCategoryForm = document.getElementById("editCategoryForm");
    const switchInput = document.getElementById("flexSwitchCheckChecked");
    const statusText = document.getElementById("statusText");

    // Cập nhật trạng thái hiển thị cho category
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
    if (switchInput) {
        switchInput.addEventListener("change", updateStatus);
    }

    // ========== Xử lý Category Detail ==========
    const addDetailForm = document.getElementById("addDetailForm");
    const editDetailModal = new bootstrap.Modal(document.getElementById('editDetailModal'), {
        keyboard: false
    });
    const detailStatusSwitch = document.getElementById("detailStatusSwitch");
    const detailStatusText = document.getElementById("detailStatusText");

    // Cập nhật trạng thái hiển thị cho detail
    function updateDetailStatus() {
        if (detailStatusSwitch.checked) {
            detailStatusText.textContent = "Hoạt Động";
            detailStatusText.classList.remove("text-danger");
            detailStatusText.classList.add("text-success");
            detailStatusSwitch.value = "true";
        } else {
            detailStatusText.textContent = "Không Hoạt Động";
            detailStatusText.classList.remove("text-success");
            detailStatusText.classList.add("text-danger");
            detailStatusSwitch.value = "false";
        }
    }

    // Thêm event listener cho switch trạng thái detail
    if (detailStatusSwitch) {
        detailStatusSwitch.addEventListener("change", updateDetailStatus);
    }

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
        console.log("Loading details for category ID:", categoryId);
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
                            <button class="btn edit-detail-btn mb-0" data-id="${detail.id}" data-name="${detail.name}" data-status="${detail.status}">
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
    
    // Expose loadCategoryDetails to the global scope
    window.loadCategoryDetails = loadCategoryDetails;

    // Thêm sự kiện cho các nút trong bảng detail
    function addDetailEvents() {
        // Xử lý nút sửa detail
        document.querySelectorAll('.edit-detail-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                const detailId = this.getAttribute('data-id');
                const detailName = this.getAttribute('data-name');
                const detailStatus = this.getAttribute('data-status') === "true";
                const categoryId = document.getElementById("categoryIdForDetail").value;
                
                // Cập nhật form edit detail
                document.getElementById("editDetailId").value = detailId;
                document.getElementById("editDetailCategoryId").value = categoryId;
                document.getElementById("editDetailName").value = detailName;
                detailStatusSwitch.checked = detailStatus;
                updateDetailStatus();
                
                // Hiển thị modal
                const editDetailModal = new bootstrap.Modal(document.getElementById('editDetailModal'));
                editDetailModal.show();
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

    // Xử lý nút lưu thay đổi detail
    const saveDetailChangesBtn = document.getElementById("saveDetailChanges");
    if (saveDetailChangesBtn) {
        saveDetailChangesBtn.addEventListener("click", function() {
            const form = document.getElementById("editDetailForm");
            const formData = {
                id: form.id.value,
                categoryId: form.categoryId.value,
                name: form.name.value,
                status: form.status.value === "true"
            };

            updateCategoryDetail(formData);
        });
    }

    // Hàm cập nhật category detail
    function updateCategoryDetail(formData) {
        fetch('/admin/categories/updateDetail', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Đóng modal
                    const editDetailModal = bootstrap.Modal.getInstance(document.getElementById('editDetailModal'));
                    editDetailModal.hide();
                    
                    // Tải lại danh sách
                    loadCategoryDetails(formData.categoryId);
                    showToast('Cập nhật danh mục chi tiết thành công!', 'success');
                } else {
                    showToast('Lỗi: ' + (data.message || 'Không thể cập nhật'), 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Có lỗi xảy ra khi cập nhật danh mục chi tiết', 'error');
            });
    }

    // Hàm xóa category detail
    function deleteCategoryDetail(detailId) {
        fetch(`/admin/categories/details/delete/${detailId}`, {
            method: 'POST'
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

    // Hàm hiển thị thông báo
    function showToast(message, type = 'success') {
        // Triển khai toast notification của bạn ở đây
        console.log(`${type.toUpperCase()}: ${message}`);
        
        // Kiểm tra xem đã có toast container chưa, nếu chưa thì tạo mới
        // let toastContainer = document.querySelector('.toast-container');
        // if (!toastContainer) {
        //     toastContainer = document.createElement('div');
        //     toastContainer.className = 'toast-container position-fixed bottom-0 end-0 p-3';
        //     document.body.appendChild(toastContainer);
        // }
        
        // // Tạo toast mới
        // const toastId = 'toast-' + Date.now();
        // const toast = document.createElement('div');
        // toast.className = `toast align-items-center text-white bg-${type} border-0`;
        // toast.setAttribute('role', 'alert');
        // toast.setAttribute('aria-live', 'assertive');
        // toast.setAttribute('aria-atomic', 'true');
        // toast.setAttribute('id', toastId);
        
        // toast.innerHTML = `
        //     <div class="d-flex">
        //         <div class="toast-body">
        //             ${message}
        //         </div>
        //         <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        //     </div>
        // `;
        
        // toastContainer.appendChild(toast);
        
        // // Hiển thị toast
        // const bsToast = new bootstrap.Toast(toast);
        // bsToast.show();
        
        // // Xóa toast sau khi đã hiển thị
        // toast.addEventListener('hidden.bs.toast', function () {
        //     toast.remove();
        // });
    }
});