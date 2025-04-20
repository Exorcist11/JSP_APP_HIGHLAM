<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sổ địa chỉ - T-SHIRT LUXURY</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <link
      rel="shortcut icon"
      href="../images/favicon.png"
      type="image/x-icon"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
      button {
        width: fit-content;
      }
      .address-card {
        border: 1px solid #e0e0e0;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
        background: #fff;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s, box-shadow 0.3s;
      }
      .address-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
      }
      .address-card.default {
        border-left: 4px solid #198754;
        background-color: #f8fff9;
      }
      .modal-content {
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      }
      .modal-header {
        background: linear-gradient(90deg, #007bff, #0056b3);
        color: white;
        border-radius: 15px 15px 0 0;
      }
      .form-control,
      .form-select {
        border-radius: 8px;
        height: 50px;
      }
      .btn-primary {
        background: #007bff;
        border: none;
        border-radius: 8px;
        padding: 10px 20px;
      }
      .btn-primary:hover {
        background: #0056b3;
      }
      .btn-secondary {
        background: #6c757d;
        border: none;
        border-radius: 8px;
        padding: 10px 20px;
      }
      .btn-secondary:hover {
        background: #5a6268;
      }
      @media (max-width: 768px) {
        .address-card {
          padding: 15px;
        }
        .form-control,
        .form-select {
          width: 100% !important;
        }
      }

      #profileForm {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-gap: 20px;
      }

      .address-content {
        flex-grow: 1;
      }

      .address-info {
        color: #495057;
        margin-bottom: 3px;
        font-size: 15px;
      }

      .address-info strong {
        color: #212529;
        min-width: 105px;
        display: inline-block;
      }

      .address-badge {
        display: inline-block;
        padding: 2px 8px;
        border-radius: 4px;
        font-size: 12px;
        font-weight: 600;
        margin-right: 10px;
      }

      .default-badge {
        background-color: #d1e7dd;
        color: #0f5132;
      }

      .full-address {
        margin-top: 8px;
        font-size: 14px;
        color: #6c757d;
        line-height: 1.5;
      }

      .address-actions {
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 8px;
      }

      .btn-action {
        width: 38px;
        height: 38px;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        transition: all 0.2s;
      }

      .btn-default {
        color: #198754;
        border-color: #198754;
      }

      .btn-default:hover {
        background-color: #198754;
        color: white;
      }

      .btn-edit {
        color: #fd7e14;
        border-color: #fd7e14;
      }

      .btn-edit:hover {
        background-color: #fd7e14;
        color: white;
      }

      .btn-delete {
        color: #dc3545;
        border-color: #dc3545;
      }

      .btn-delete:hover {
        background-color: #dc3545;
        color: white;
      }

      .btn-add {
        border-radius: 50px;
        padding: 10px 20px;
        font-weight: 500;
      }

      @media (max-width: 767px) {
        .address-card {
          padding: 15px;
        }

        .address-content {
          margin-bottom: 15px;
        }

        .address-actions {
          flex-direction: row;
          justify-content: flex-start;
        }
      }
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/fragments/header.jsp" />

    <div class="container-fluid" style="margin-top: 90px">
      <div class="row flex-nowrap">
        <div class="col-auto px-0">
          <jsp:include page="/WEB-INF/views/Profile/fragments/sideBar.jsp" />
        </div>

        <div class="col py-3">
          <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>Sổ địa chỉ</h3>
            <button
              class="btn btn-primary btn-add"
              data-bs-toggle="modal"
              data-bs-target="#addressModal"
              onclick="resetModal('Thêm địa chỉ mới')"
            >
              <i class="fas fa-plus me-2"></i> Thêm địa chỉ
            </button>
          </div>

          <!-- Danh sách địa chỉ -->
          <div class="address-list">
            <c:forEach items="${profiles}" var="profile">
              <div class="address-card ${profile.isDefault ? 'default' : ''}">
                <div
                  class="d-flex flex-column flex-md-row justify-content-between"
                >
                  <div class="address-content">
                    <div class="d-flex align-items-center mb-2">
                      <h5 class="mb-0 me-2">${profile.fullName}</h5>
                      <c:if test="${profile.isDefault}">
                        <span class="address-badge default-badge">
                          <i class="fas fa-check-circle me-1"></i>Mặc định
                        </span>
                      </c:if>
                    </div>

                    <p class="address-info">
                      <strong>Số điện thoại:</strong> ${profile.phoneNumber}
                    </p>

                    <div class="full-address">
                      <i class="fas fa-map-marker-alt me-2 text-primary"></i>
                      ${profile.detail}, ${profile.wardName},
                      ${profile.districtName}, ${profile.provinceName}
                    </div>
                  </div>

                  <div class="address-actions mt-3 mt-md-0">
                    <c:if test="${!profile.isDefault}">
                      <button
                        class="btn btn-outline-success btn-action btn-default"
                        onclick="setDefault(${profile.id})"
                        title="Đặt làm mặc định"
                      >
                        <i class="fas fa-check"></i>
                      </button>
                    </c:if>
                    <button
                      class="btn btn-outline-warning btn-action btn-edit"
                      data-bs-toggle="modal"
                      data-bs-target="#addressModal"
                      onclick="editProfile(${profile.id}, 'Sửa địa chỉ')"
                      title="Sửa địa chỉ"
                    >
                      <i class="fas fa-edit"></i>
                    </button>
                    <button
                      class="btn btn-outline-danger btn-action btn-delete"
                      onclick="deleteProfile(${profile.id})"
                      title="Xóa địa chỉ"
                    >
                      <i class="fas fa-trash"></i>
                    </button>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>

          <!-- Modal thêm/sửa địa chỉ -->
          <div
            class="modal fade"
            id="addressModal"
            tabindex="-1"
            aria-labelledby="addressModalLabel"
            aria-hidden="true"
          >
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="addressModalLabel">
                    Thêm địa chỉ mới
                  </h5>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                  ></button>
                </div>
                <div class="modal-body">
                  <form id="profileForm">
                    <input type="hidden" id="profileId" />
                    <div class="mb-3">
                      <label for="fullName" class="form-label"
                        >Người nhận</label
                      >
                      <input
                        type="text"
                        class="form-control"
                        id="fullName"
                        name="fullName"
                        required
                      />
                    </div>
                    <div class="mb-3">
                      <label for="phoneNumber" class="form-label"
                        >Số điện thoại</label
                      >
                      <input
                        type="text"
                        class="form-control"
                        id="phoneNumber"
                        name="phoneNumber"
                        required
                      />
                    </div>
                    <div class="mb-3">
                      <label for="province" class="form-label"
                        >Tỉnh/Thành phố</label
                      >
                      <select
                        class="form-select"
                        id="province"
                        name="provinceCode"
                        required
                      >
                        <option value="">Chọn tỉnh</option>
                      </select>
                    </div>
                    <div class="mb-3">
                      <label for="district" class="form-label"
                        >Quận/Huyện</label
                      >
                      <select
                        class="form-select"
                        id="district"
                        name="districtCode"
                        disabled
                        required
                      >
                        <option value="">Chọn quận/huyện</option>
                      </select>
                    </div>
                    <div class="mb-3">
                      <label for="ward" class="form-label">Phường/Xã</label>
                      <select
                        class="form-select"
                        id="ward"
                        name="wardCode"
                        disabled
                        required
                      >
                        <option value="">Chọn phường/xã</option>
                      </select>
                    </div>
                    <div class="mb-3">
                      <label for="detail" class="form-label"
                        >Địa chỉ cụ thể</label
                      >
                      <input
                        type="text"
                        class="form-control"
                        id="detail"
                        name="detail"
                        required
                      />
                    </div>
                    <div class="mb-3 form-check">
                      <input
                        type="checkbox"
                        class="form-check-input"
                        id="isDefault"
                        name="isDefault"
                      />
                      <label class="form-check-label" for="isDefault"
                        >Đặt làm mặc định</label
                      >
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                  >
                    Hủy
                  </button>
                  <button
                    type="submit"
                    class="btn btn-primary"
                    onclick="document.getElementById('profileForm').dispatchEvent(new Event('submit'))"
                  >
                    Lưu
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp" />

    <script>
      const userId = 1;
      const API_BASE_URL = "https://vn-public-apis.fpo.vn";

      document.addEventListener("DOMContentLoaded", async function () {
        const provinceSelect = document.getElementById("province");
        const districtSelect = document.getElementById("district");
        const wardSelect = document.getElementById("ward");

        // Load provinces
        try {
          const response = await fetch(
            API_BASE_URL + `/provinces/getAll?limit=-1`
          );
          const data = await response.json();
          if (data.data && data.data.data && data.data.data.length > 0) {
            provinceSelect.innerHTML = '<option value="">Chọn tỉnh</option>';
            data.data.data.forEach((province) => {
              const option = document.createElement("option");
              option.value = province.code;
              option.textContent = province.name_with_type;
              provinceSelect.appendChild(option);
            });
          } else {
            console.error("Error fetching provinces:", data);
            alert("Không thể tải danh sách tỉnh. Vui lòng thử lại sau.");
          }
        } catch (error) {
          console.error("Error fetching provinces:", error);
          alert(
            "Lỗi kết nối đến API tỉnh. Vui lòng kiểm tra mạng hoặc thử lại sau."
          );
        }

        // Province change event
        provinceSelect.addEventListener("change", async function () {
          const provinceCode = this.value;
          districtSelect.innerHTML =
            '<option value="">Chọn quận/huyện</option>';
          wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
          districtSelect.disabled = true;
          wardSelect.disabled = true;

          if (provinceCode) {
            districtSelect.disabled = false;
            try {
              const response = await fetch(
                API_BASE_URL +
                  `/districts/getByProvince?provinceCode=` +
                  provinceCode +
                  `&limit=-1`
              );
              const data = await response.json();
              if (data.data && data.data.data && data.data.data.length > 0) {
                data.data.data.forEach((district) => {
                  const option = document.createElement("option");
                  option.value = district.code;
                  option.textContent = district.name_with_type;
                  districtSelect.appendChild(option);
                });
              } else {
                console.error("Error fetching districts:", data);
              }
            } catch (error) {
              console.error("Error fetching districts:", error);
            }
          }
        });

        // District change event
        districtSelect.addEventListener("change", async function () {
          const districtCode = this.value;
          wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';
          wardSelect.disabled = true;

          if (districtCode) {
            wardSelect.disabled = false;
            try {
              const response = await fetch(
                API_BASE_URL +
                  `/wards/getByDistrict?districtCode=` +
                  districtCode +
                  `&limit=-1`
              );
              const data = await response.json();
              if (data.data && data.data.data && data.data.data.length > 0) {
                data.data.data.forEach((ward) => {
                  const option = document.createElement("option");
                  option.value = ward.code;
                  option.textContent = ward.name_with_type;
                  wardSelect.appendChild(option);
                });
              } else {
                console.error("Error fetching wards:", data);
              }
            } catch (error) {
              console.error("Error fetching wards:", error);
            }
          }
        });

        // Form submission
        document
          .getElementById("profileForm")
          .addEventListener("submit", async (e) => {
            e.preventDefault();
            const profileId = document.getElementById("profileId").value;

            // Validate required fields
            if (
              !provinceSelect.value ||
              !districtSelect.value ||
              !wardSelect.value
            ) {
              alert("Vui lòng chọn đầy đủ tỉnh, quận và phường/xã");
              return;
            }

            const dto = {
              fullName: document.getElementById("fullName").value,
              detail: document.getElementById("detail").value,
              phoneNumber: document.getElementById("phoneNumber").value,
              provinceCode: provinceSelect.value,
              provinceName:
                provinceSelect.options[provinceSelect.selectedIndex].text,
              districtCode: districtSelect.value,
              districtName:
                districtSelect.options[districtSelect.selectedIndex].text,
              wardCode: wardSelect.value,
              wardName: wardSelect.options[wardSelect.selectedIndex].text,
              isDefault: document.getElementById("isDefault").checked,
            };

            const url = profileId
              ? `/api/profiles/` + profileId + `?userId=` + userId
              : `/api/profiles`;
            const method = profileId ? "PUT" : "POST";

            try {
              const response = await fetch(url, {
                method: method,
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(dto),
              });
              if (!response.ok) {
                throw new Error("Lỗi khi lưu địa chỉ");
              }
              await response.json();
              window.location.reload();
            } catch (error) {
              console.error("Error saving profile:", error);
              alert("Đã có lỗi xảy ra khi lưu địa chỉ");
            }
          });
      });

      function editProfile(profileId, title) {
        fetch(`/api/profiles?userId=` + userId)
          .then((response) => response.json())
          .then((profiles) => {
            const profile = profiles.find((p) => p.id == profileId);
            if (profile) {
              document.getElementById("addressModalLabel").textContent = title;
              document.getElementById("profileId").value = profile.id;
              document.getElementById("fullName").value = profile.fullName;
              document.getElementById("phoneNumber").value =
                profile.phoneNumber;
              document.getElementById("detail").value = profile.detail;
              document.getElementById("isDefault").checked = profile.isDefault;

              // Trigger province change to load districts and wards
              const provinceSelect = document.getElementById("province");
              provinceSelect.value = profile.provinceCode;
              const event = new Event("change");
              provinceSelect.dispatchEvent(event);

              // Use setTimeout to wait for districts to load
              setTimeout(() => {
                const districtSelect = document.getElementById("district");
                districtSelect.value = profile.districtCode;
                const districtEvent = new Event("change");
                districtSelect.dispatchEvent(districtEvent);

                // Use another setTimeout to wait for wards to load
                setTimeout(() => {
                  document.getElementById("ward").value = profile.wardCode;
                }, 500);
              }, 500);
            }
          })
          .catch((error) => {
            console.error("Error fetching profile:", error);
            alert("Lỗi khi tải thông tin địa chỉ");
          });
      }

      function deleteProfile(profileId) {
        if (confirm("Bạn có chắc muốn xóa địa chỉ này?")) {
          fetch(`/api/profiles/` + profileId + `?userId=` + userId, {
            method: "DELETE",
          })
            .then(() => window.location.reload())
            .catch((error) => {
              console.error("Error deleting profile:", error);
              alert("Đã có lỗi xảy ra khi xóa địa chỉ");
            });
        }
      }

      function setDefault(profileId) {
        console.log("Setting default profile:", profileId);
        fetch(`/api/profiles/` + profileId + `/default?userId=` + userId, {
          method: "POST",
        })
          .then(() => window.location.reload())
          .catch((error) => {
            console.error("Error setting default:", error);
            alert("Đã có lỗi xảy ra khi đặt địa chỉ mặc định");
          });
      }

      function resetModal(title) {
        document.getElementById("profileForm").reset();
        document.getElementById("profileId").value = "";
        document.getElementById("addressModalLabel").textContent = title;
        document.getElementById("district").disabled = true;
        document.getElementById("ward").disabled = true;
        document.getElementById("province").value = "";
        document.getElementById("district").innerHTML =
          '<option value="">Chọn quận/huyện</option>';
        document.getElementById("ward").innerHTML =
          '<option value="">Chọn phường/xã</option>';
      }
    </script>
  </body>
</html>
