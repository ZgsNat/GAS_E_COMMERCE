<%-- 
    Document   : news
    Created on : May 17, 2023, 11:37:49 AM
    Author     : myth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Employee Management</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
        <script src="https://cdn.tiny.cloud/1/960h90rahv9jcykqywlacmvxqve30f5e9a1jn5id5msshl6a/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <style>
            /* Container div */
            .card {
                padding: 20px;
                margin: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            /* Input styles */
            input[type="text"],
            input[type="file"],
            select {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 10px;
            }
            label{
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            /* Textarea styles */
            textarea {
                width: 100%;
                height: 300px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 10px;
            }
            .tox-tinymce {
                width: 100%;
                min-height: 700px;
            }

            /* Button styles */
            input[type="submit"],
            button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 10px;
            }

            input[type="submit"]:hover,
            button:hover {
                background-color: #45a049;
            }

            /* Cancel button style */
            .cancel-button {
                background-color: #e74c3c;
            }

            .cancel-button:hover {
                background-color: #c0392b;
            }

            /* Footer styles */
            .container-fluid {
                margin-top: 20px;
            }

            .bg-light {
                background-color: #f8f9fa;
            }

            .rounded-top {
                border-top-left-radius: 4px;
                border-top-right-radius: 4px;
            }

            .p-4 {
                padding: 16px;
            }

            .text-center {
                text-align: center;
            }

            .text-sm-start {
                text-align: start;
            }

            .text-sm-end {
                text-align: end;
            }
        </style>

    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->
                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                    <div class="app-brand demo">
                        <a href="index.html" class="app-brand-link">
                            <span class="app-brand-logo demo">
                                <svg
                                    width="25"
                                    viewBox="0 0 25 42"
                                    version="1.1"
                                    xmlns="http://www.w3.org/2000/svg"
                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                    >                  
                                <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                                <g id="Icon" transform="translate(27.000000, 15.000000)">
                                <g id="Mask" transform="translate(0.000000, 8.000000)">
                                <mask id="mask-2" fill="white">
                                    <use xlink:href="#path-1"></use>
                                </mask>
                                <use fill="#696cff" xlink:href="#path-1"></use>
                                <g id="Path-3" mask="url(#mask-2)">
                                <use fill="#696cff" xlink:href="#path-3"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                                </g>
                                <g id="Path-4" mask="url(#mask-2)">
                                <use fill="#696cff" xlink:href="#path-4"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                                </g>
                                </g>
                                <g
                                    id="Triangle"
                                    transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                                    >
                                <use fill="#696cff" xlink:href="#path-5"></use>
                                <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                                </g>
                                </g>
                                </g>
                                </g>
                                </svg>
                            </span>
                            <span class="app-brand-text demo menu-text fw-bolder ms-2">Sneat</span>
                        </a>

                        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                            <i class="bx bx-chevron-left bx-sm align-middle"></i>
                        </a>
                    </div>

                    <div class="menu-inner-shadow"></div>

                    <ul class="menu-inner py-1">
                        <!-- General -->
                        <li class="menu-item">
                            <a href="general" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                                <div data-i18n="Analytics">General</div>
                            </a>
                        </li>


                        <!-- Management -->
                        <li class="menu-header small text-uppercase"><span class="menu-header-text">Management</span></li>
                        <!-- Product -->
                        <li class="menu-item">
                            <a href="productInfo" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-collection"></i>
                                <div data-i18n="Basic">Product</div>
                            </a>
                        </li>
                        <!-- Customer -->
                        <li class="menu-item">
                            <a href="customerInfo" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-group"></i>
                                <div data-i18n="Basic">Customer</div>
                            </a>
                        </li>
                        <!-- Coupon -->
                        <li class="menu-item">
                            <a href="coupon_admin" class="menu-link">
                                <i class="menu-icon tf-icons bx bxs-discount"></i>
                                <div data-i18n="Basic">Coupon</div>
                            </a>
                        </li>
                        <!-- News -->
                        <li class="menu-item active">
                            <a href="news" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-news"></i>
                                <div data-i18n="Basic">News</div>
                            </a>
                        </li>
                        <li class="menu-item">
                            <a href="javascript:void(0);" class="menu-link menu-toggle">
                                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                                <div data-i18n="Account Settings">HomePage Management</div>
                            </a>
                            <ul class="menu-sub">
                                <li class="menu-item">
                                    <a href="HFM" class="menu-link">
                                        <div data-i18n="Account">Navigation</div>
                                    </a>
                                </li>
                                <li class="menu-item">
                                    <a href="banner" class="menu-link">
                                        <div data-i18n="Notifications">Banner</div>
                                    </a>
                                </li>
                                <li class="menu-item">
                                    <a href="contact" class="menu-link">
                                        <div data-i18n="Connections">Contact</div>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Employee -->
                        <li class="menu-item">
                            <a href="employee" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-list-ul"></i>
                                <div data-i18n="Basic">Employee</div>
                            </a>
                        </li>
                    </ul>
                </aside>
                <!-- Menu -->
                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->

                    <nav
                        class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                        id="layout-navbar"
                        >
                        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                <i class="bx bx-menu bx-sm"></i>
                            </a>
                        </div>

                        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                            <!-- Search -->
                            <div class="navbar-nav align-items-center">
                                <div class="nav-item d-flex align-items-center">
                                    <input
                                        type="text"
                                        class="form-control border-0 shadow-none"
                                        />
                                </div>
                            </div>
                            <!-- /Search -->

                            <ul class="navbar-nav flex-row align-items-center ms-auto">
                                <!-- User -->
                                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                    <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                        <div class="avatar avatar-online">
                                            <img src="avatars/${sessionScope['adminavt']}" alt class="w-px-40 h-px-40 rounded-circle" />
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0 me-3">
                                                        <div class="avatar avatar-online">
                                                            <img src="avatars/${sessionScope['adminavt']}" alt class="w-px-40 h-px-40 rounded-circle" />
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <span class="fw-semibold d-block">${sessionScope['name']}</span>
                                                        <small class="text-muted">Admin</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="admininfo">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle">My Profile</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <i class="bx bx-cog me-2"></i>
                                                <span class="align-middle">Settings</span>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="login">
                                                <i class="bx bx-power-off me-2"></i>
                                                <span class="align-middle">Log Out</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <!--/ User -->
                            </ul>
                        </div>
                    </nav>

                    <!-- / Navbar -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-sm flex-grow-1 container-p-y">
                            <!-- Bootstrap Table with Header - Light -->
                            <div class="card">
                                <!-- Table Start -->
                                <div >
                                    <div>
                                        <form action="news" method="post" enctype="multipart/form-data">
                                            <label for="title">Title:</label>
                                            <input type="text" name="title" id="title" required style="width: 100%;"><br><br>
                                            <label for="title">Summary:</label>
                                            <textarea type="text" name="summary" id="summary" required style="width: 100%;"></textarea><br><br>
                                            <label for="thumbnail">Thumbnail:</label>
                                            <input type="file" name="thumbnail" id="thumbnail" onchange="previewImage(this);">
                                            <!--                                            <label for="imageUrl">Thumbnail(Enter URL):</label>
                                                                                        <input type="text" id="imageUrl" name="imageUrl" >-->
                                            <div id="previewContainer"></div>
                                            <label for="Category">Category</label>
                                            <select name="Category" id="Category">
                                                <c:forEach items="${Category}" var="item"> 
                                                    <option value="${item.getId()}">${item.getName()}</option>
                                                </c:forEach>
                                            </select><br><br>
                                            <label for="editor_text">Content:</label>
                                            <textarea style="height: 300px !important;" class="editor_text" id="editor_text" name="editor_text"></textarea>
                                            <div style="margin-top: 20px">
                                                <input type="submit" value="Submit">
                                                <button type="button" class="cancel-button" onclick="cancel()">Cancel</button>
                                            </div>
                                        </form>
                                    </div>


                                </div>
                                <!-- Table End -->


                                <!-- Footer Start -->
                                <div class="container-fluid pt-4 px-4">
                                    <div class="bg-light rounded-top p-4">
                                        <div class="row">
                                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                                &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
                                            </div>
                                            <div class="col-12 col-sm-6 text-center text-sm-end">
                                                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                                Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Footer End -->
                            </div>
                            <!-- Content End -->


                            <!-- Back to Top -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function previewImage(fileInput) {
//                var preview = document.getElementById('preview');
                var fileSize = fileInput.files[0].size;
                var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

                if (!allowedExtensions.exec(fileInput.value)) {
                    alert('Chỉ chấp nhận tệp tin hình ảnh có định dạng JPEG, JPG, PNG, GIF.');
                    fileInput.value = '';
                    previewContainer.innerHTML = "";
                }

                if (fileSize > 2 * 1024 * 1024) {
                    alert("Dung lượng ảnh vượt quá giới hạn cho phép!");
                    fileInput.value = '';
                    previewContainer.innerHTML = "";
                } else {
                    var reader = new FileReader();
                    previewContainer.innerHTML = "";
                    reader.onloadend = function () {
                        var img = document.createElement('img');
                        img.src = reader.result;
                        img.style = 'width: 100px;height: 100px;object-fit: fill;';
                        previewContainer.appendChild(img);
                    }

                    if (fileInput.files[0]) {
                        reader.readAsDataURL(fileInput.files[0]);
                    }
                }
            }
            function cancel() {
                window.location.href = "news";
            }
            tinymce.init({
                selector: 'textarea#editor_text',
                plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
                toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
                images_upload_url: '/WebApplication1/UploadImageServlet',
                images_upload_handler: function (blobInfo, success, failure) {
                    var xhr, formData;
                    xhr = new XMLHttpRequest();
                    xhr.withCredentials = false;
                    xhr.open('POST', '/SWP391_1/UploadImageTinyMCE');
                    xhr.onload = function () {
                        var json;

                        if (xhr.status != 200) {
                            failure('HTTP Error: ' + xhr.status);
                            return;
                        }

                        json = JSON.parse(xhr.responseText);

                        if (!json || typeof json.location != 'string') {
                            failure('Invalid JSON: ' + xhr.responseText);
                            return;
                        }

                        success(json.location);
                    };
                    formData = new FormData();
                    formData.append('file', blobInfo.blob(), blobInfo.filename());
                    xhr.send(formData);
                }
            });
        </script>
        <!-- JavaScript Libraries -->
        <!-- Core JS -->
        <!-- build:js assets/vendor/js/core.js -->
        <script src="assets/vendor/libs/jquery/jquery.js"></script>
        <script src="assets/vendor/libs/popper/popper.js"></script>
        <script src="assets/vendor/js/bootstrap.js"></script>
        <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

        <script src="assets/vendor/js/menu.js"></script>
        <!-- endbuild -->

        <!-- Vendors JS -->

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>

        <!-- Page JS -->

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>

    </body>

</html>
