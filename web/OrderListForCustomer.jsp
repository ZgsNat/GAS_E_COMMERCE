<%-- 
    Document   : productInfo
    Created on : May 13, 2023, 8:57:59 PM
    Author     : Peanut
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                            <span class="app-brand-text menu-text fw-bolder" style="border-width:1px; border-style:solid; border-color:#696cff; padding: 5px; font-family: 'Mukta';color: #696cff; font-weight: 50; font-size: 25px"> GAS VIETNAM </span>
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
                        <li class="menu-item active">
                            <a href="customerInfo" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-group"></i>
                                <div data-i18n="Basic">Customer</div>
                            </a>
                        </li>
                        <!-- Coupon -->
                        <li class="menu-item">
                            <a href="coupon_admin" class="menu-link active">
                                <i class="menu-icon tf-icons bx bxs-discount"></i>
                                <div data-i18n="Basic">Coupon</div>
                            </a>
                        </li>
                        <!-- News -->
                        <li class="menu-item">
                            <a href="news" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-news"></i>
                                <div data-i18n="Basic">News</div>
                            </a>
                        </li>
                        <!-- HomePage Management -->
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
                                            <a class="dropdown-item" href="#">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle">My Profile</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="admininfo">
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

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-sm flex-grow-1 container-p-y">
                            <!-- Bootstrap Table with Header - Light -->
                            <div class="card">
                                <div class="container-fluid pt-4 px-4">
                                    <h5 class="mb-0">Customer Info</h5>
                                    <div class="bg-light text-center rounded p-4">
                                        <c:catch var="customer">
                                            <c:if test="${customer != null}">
                                                <div class="row">
                                                    <div class="col-md-4" style="min-height:200px; max-height: 300px">
                                                        <div class="circle-image" style="height:100%">
                                                            <c:if test="${not fn:contains(customer.getAvatar(), 'jpg')}">
                                                                <img id="preview" alt="" style="height: 100%" class="img-circle img-thumbnail" src="${customer.getAvatar()}" data-original-title>  
                                                            </c:if>
                                                            <c:if test="${fn:contains(customer.getAvatar(), 'jpg')}">
                                                                <img id="preview" alt="" style="height: 100%"  class="img-circle img-thumbnail" src="avatars/${customer.getAvatar()}" data-original-title>  
                                                            </c:if>
                                                        </div>
                                                        <input type="file" id="thumbnail" name="filename" onchange="previewImage();">
                                                    </div>
                                                    <!--                                                    <div class="col-md-4">
                                                                                                            <img alt="" style="width:600px;" title="" class="img-circle img-thumbnail" src="https://bootdey.com/img/Content/avatar/avatar7.png" data-original-title>
                                                                                                            <form action="/action_page.php">
                                                                                                                <input type="file" id="myFile" name="filename">
                                                                                                                <input type="submit">
                                                                                                            </form>
                                                                                                        </div>-->
                                                    <%--<div class="table-responsive">
                                                        <table class="table text-lg-center text-start align-middle table-bordered table-hover mb-0">
                                                            <thead>
                                                                <tr class="text-dark">
                                                                    <th>CustomerID</th>
                                                                    <th>CustomerName</th>
                                                                    <th>PhoneNumber</th>
                                                                    <th>Email</th>
                                                                    <th style="word-break: break-all">Adress</th>
                                                                    <th>Registration Date</th>
                                                                    <th>DOB</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="col-md-2">${customer.getCustomerID()}</td>
                                                                    <td>${customer.getCustomerName()}</td>
                                                                    <td>${customer.getPhoneNumber()}</td>
                                                                    <td class="col-md-3" style="word-break: break-all">${customer.getEmail()}</td>
                                                                    <td class="col-md-3" style="word-break: normal">${customer.getAddress()}</td>
                                                                    <td>${customer.getRegistrationDate()}</td>
                                                                    <td class="col-md-4" style="word-break: keep-all">${customer.getDOB()}</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>--%>
                                                    <div class="col-md-8">
                                                        <div class="row mb-3">
                                                            <label class="col-sm-2 col-form-label" for="basic-default-name">Customer Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control-plaintext" id="basic-default-name" placeholder="Name" name="name" value="${customer.getCustomerName()}"/>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label class="col-sm-2 col-form-label" for="basic-default-message">Phone Number: </label>
                                                            <div class="col-sm-10">
                                                                <input
                                                                    id="basic-default-message"
                                                                    class="form-control-plaintext"
                                                                    placeholder="Message"
                                                                    aria-label=""
                                                                    aria-describedby="basic-icon-default-message2"
                                                                    name="phonenumber" value="${customer.getPhoneNumber()}"
                                                                    >
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label class="col-sm-2 col-form-label" for="basic-default-name">Email:</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control-plaintext" id="basic-default-name"  name="email" value="${customer.getEmail()}"/>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="html5-date-1" class="col-md-2 col-form-label">Date of birth: </label>
                                                            <div class="col-md">
                                                                <input class="form-control-plaintext" type="text" id="html5-date-1" name="DOB" value="${customer.getDOB()}"/>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label class="col-sm-2 col-form-label" for="basic-default-name">Email:</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control-plaintext" id="basic-default-name"  name="email" value="${customer.getAddress()}"/>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label for="html5-date-2" class="col-md-2 col-form-label">Registration Date: </label>
                                                            <div class="col-md">
                                                                <input class="form-control-plaintext" type="text" id="html5-date-2" name="" value="${customer.getRegistrationDate()}" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:catch>
                                        <br> CUSTOMER'S ORDERLIST <br>
                                        <br><br>
                                    </div>
                                </div>
                                <div class="card mb-4">
                                    <div class="card-header d-flex align-items-center justify-content-between">
                                        <h6 class="mb-0">Promoted Coupon</h6>
                                    </div>
                                    <div class="card-body">
                                        <c:catch var="data">
                                            <c:if test="${data == null}">
                                                <div>
                                                    <p>
                                                        No Coupon found!
                                                    </p>
                                                </div>
                                            </c:if>
                                            <c:if test="${data != null}">
                                                <table class="table text-end-center">
                                                    <thead class="table-light">
                                                        <tr class="text-dark">
                                                            <th style="table-layout: fixed; width: 15%;">Code</th>
                                                            <th style="table-layout: fixed; max-width:300px;width: 25% ">Message</th>
                                                            <th style="table-layout: fixed; width: 10%">Valid from</th>
                                                            <th style="table-layout: fixed; width: 10%">Valid to</th>
                                                            <th style="table-layout: fixed; width: 15%">Status</th>
                                                            <th>Usage status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="table-border-bottom-0">
                                                        <c:forEach items="${data}" var="item">
                                                            <tr>
                                                                <td>${item.getCoupon().getName()}</td>
                                                                <td style="table-layout: fixed; max-width:300px ">${item.getCoupon().getMessage()}</td>
                                                                <td>${item.getCoupon().getValid_fromString()}</td>
                                                                <td>${item.getCoupon().getValid_toString()}</td>
                                                                <c:if test="${item.getCoupon().getStatus()==0}"><td><span class="badge bg-label-dark" >Not Avail</span></td></c:if>
                                                                <c:if test="${item.getCoupon().getStatus()==1}"><td><span class="badge bg-label-primary" >Available</span></td></c:if>
                                                                <c:if test="${item.getCoupon().getStatus()==2}"><td><span class="badge bg-label-success" >In usage</span></td></c:if>
                                                                <c:if test="${item.getCoupon().getStatus()==3}"><td><span class="badge bg-label-danger" >Banned</span></td></c:if>
                                                                <c:if test="${item.getCoupon().getStatus()==4}"><td><span class="badge bg-label-secondary" >Outdated</span></td></c:if>
                                                                <td>${item.getStatus() == 1 ? 'Used':'Not yet'}</td>

                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </c:catch>


                                    </div>
                                </div>
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
            function previewImage() {
                var preview = document.getElementById('preview');
                var file = document.getElementById('thumbnail').files[0];
                if (file.size > 2 * 1024 * 1024) {
                    alert("Dung lượng ảnh vượt quá giới hạn cho phép!");
                    document.getElementById('thumbnail').value = "";
                } else {
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
            }

            tinymce.init({
                selector: 'textarea',
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
