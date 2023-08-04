<%-- 
    Document   : productInfo
    Created on : May 13, 2023, 8:57:59 PM
    Author     : Peanut
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

        <title>Coupon Management</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
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
    </head>
    <body>
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
                            <span class="app-brand-text menu-text fw-bolder" style="border-width:2px; border-style:solid; border-color:#233446; padding: 5px; font-family: 'Mukta';color: #333; font-weight: 50; font-size: 25px"> GAS VIETNAM </span>
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
                        <li class="menu-item active">
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
                        <li class="menu-item">
                            <a href="productInfo" class="menu-link">
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
                            <a href="productInfo" class="menu-link">
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
                                            <img src="assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0 me-3">
                                                        <div class="avatar avatar-online">
                                                            <img src="assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                                        </div>
                                                    </div>
                                                    <div class="flex-grow-1">
                                                        <span class="fw-semibold d-block">John Doe</span>
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
                                            <a class="dropdown-item" href="loginadmin">
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
                    <!-- Content -->
                    <div class="content-wrapper">
                        <div class="container-sm flex-grow-1 container-p-y">
                            <!-- Main Start -->
                            <div class="row">
                                <div class="col-xxl">
                                    <div class="card mb-4">
                                        <div class="card-header d-flex align-items-center justify-content-between">
                                            <h5 class="mb-0">Create Product</h5>
                                            <small class="text-muted float-end"></small>
                                        </div>
                                        <div class="card-body">
                                            <form action="addProduct" method="post" class="row" id="submit" enctype='multipart/form-data'>
                                                <div class="row mb-3">
                                                    <label class="col-sm-2 col-form-label" for="basic-default-name">Name: </label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="basic-default-name" name="pName" placeholder="Enter Product Name here..."/>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <label class="col-sm-2 col-form-label" for="basic-default-message">Category</label>
                                                    <div class="col-sm-10">
                                                        <select class="form-select" id="category" aria-label="Default select example" name="cID" onchange="change2()">
                                                            <c:forEach  items="${data}" var="item">
                                                                <option value="${item.getCategoryID()}">${item.getCategoryName()}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <!--                                                        <input
                                                                                                                    id="basic-default-message"
                                                                                                                    class="form-control"
                                                                                                                    aria-label=""
                                                                                                                    aria-describedby="basic-icon-default-message2"
                                                                                                                    name="cID"  placeholder="Enter Category ID here(1: Binh ga, 2: Bep ga, 3: Linh kien bep)..."
                                                                                                                    >-->
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <label class="col-sm-2 col-form-label" for="basic-default-value">Price: </label>
                                                    <div class="col-sm-4">
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="basic-default-value"
                                                            placeholder="Enter Product Price here..."
                                                            name="pPrice"
                                                            />
                                                    </div>
                                                    <label class="col-sm-2 col-form-label" for="basic-default-value">Quantity: </label>
                                                    <div class="col-sm-4">
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="basic-default-value"
                                                            placeholder="Enter Product Price here..."
                                                            name="pQuantity"
                                                            />
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <label class="col-sm-2 col-form-label" for="basic-default-bill">Warranty: </label>
                                                    <div class="col-sm-4">
                                                        <div class="input-group input-group-merge">
                                                            <input type="text" class="form-control" id="basic-default-bill" placeholder="Enter Product Warranty Period here..." name="pWarranty" value=""/>
                                                            <span class="input-group-text">Year</span>
                                                        </div>
                                                    </div>
                                                    <label class="col-sm-2 col-form-label" for="basic-default-value">Created By: </label>
                                                    <div class="col-sm-4">
                                                        <input
                                                            type="text" readonly=""
                                                            class="form-control-plaintext"
                                                            id="basic-default-value"
                                                            value="${sessionScope['name']}"
                                                            />
                                                    </div>
                                                </div>
                                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                                    <thead>
                                                        <tr class="text-dark">
                                                            <th class="col-md-3">Product Detail</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <TR>
                                                            <td><textarea id="pDetail" name="pDetail" cols="10" rows="3" style="width: 100%;word-break: normal;">${p.getDetail()}</textarea></td> 
                                                        </TR> 
                                                    </tbody>
                                                </table>
                                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                                    <thead>
                                                        <tr class="text-dark">
                                                            <th class="col-md-3">Preview Product Image</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <TR>
                                                            <td>
                                                                <input id="imagesss" type="file" name="image" onchange="previewImage()">
                                                            </td>
                                                            <td><img id="imagess"  style="width: 100px;height: 100px;object-fit: fill;" src="" alt="Image"></td>
                                                        </TR> 
                                                    </tbody>
                                                </table>
<!--                                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                                    <thead>
                                                        <tr class="text-dark">
                                                            <th class="col-md-3">Product Image</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <TR>
                                                            <td>
                                                                <input id="imagesss" type="file" name="imageMulti" multiple>
                                                            </td>
                                                            <td><img id="imagess"  style="width: 100px;height: 100px;object-fit: fill;" src="" alt="Image"></td>
                                                        </TR> 
                                                    </tbody>
                                                </table>-->

                                                <div class="col-lg-4 col-md-6">
                                                    <div class="mt-3">
                                                        <button type="submit" class="btn btn-primary" name="addSubmit">Create Product</button><br><br>
                                                        <button type="reset" class="btn btn-primary" name="cancel"><a href="productInfo">Cancel</a></button>
                                                    </div>
                                                </div>
                                            </form>
                                            <div id="updateError">
                                                <h5>${updateError}</h5>
                                            </div>
                                        </div>
                                        <div id="insert">
                                            ${wordExist}
                                            ${insertSuccess}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Content-->

                        </div>
                    </div>
                </div>
                <!-- Content End -->
                <!-- Back to Top -->
            </div>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
                                                                    function previewImage() {
                                                                        var preview = document.getElementById('imagess');
                                                                        var file = document.getElementById('imagesss').files[0];
                                                                        var reader = new FileReader();

                                                                        reader.onloadend = function () {
                                                                            preview.src = reader.result;
                                                                        }

                                                                        if (file) {
                                                                            reader.readAsDataURL(file);
                                                                        } else {
                                                                            preview.src = "";
                                                                        }
                                                                    }


                                                                    tinymce.init({
                                                                        selector: '#pDetail',
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
    </body>

</html>
