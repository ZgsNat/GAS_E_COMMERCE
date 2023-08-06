<%-- 
    Document   : couponList
    Created on : Jun 2, 2023, 9:17:37 PM
    Author     : CAT PHUONG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Coupon" %>
<jsp:useBean id="now" class="java.util.Date"/>
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
                        <li class="menu-item">
                            <a href="customerInfo" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-group"></i>
                                <div data-i18n="Basic">Customer</div>
                            </a>
                        </li>
                        <!-- Coupon -->
                        <li class="menu-item active">
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
                                    <i class="bx bx-search fs-4 lh-0"></i>
                                    <input
                                        type="text"
                                        class="form-control border-0 shadow-none"
                                        placeholder="Search..."
                                        aria-label="Search..."
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
                            <div class="card" >
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <h5 class="mb-0">Coupon List</h5>
                                    <small class="text-muted float-end"><a href="CouponExcel" ><i class='bx bxs-file-export me-1'></i></a></small>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6" >
                                        <div class="input-group input-group-merge">
                                            <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Search..."
                                                id="Name" type="text" name="Name" value="${Name}"
                                                />
                                        </div>
                                    </div>
                                    <div class="col-sm-6 row">
                                        <label for="startDate" class="col-md-2 col-form-label">From: </label>
                                        <div class="col-md-4">
                                            <input class="form-control" id="startDate" type="date" name="startDate" value="${start}" onchange="change2(-1)"/>
                                        </div>

                                        <label for="endDate" class="col-md-2 col-form-label">To:</label>
                                        <div class="col-md-4">
                                            <input class="form-control" id="endDate" type="date" name="endDate" value="${end}" onchange="change2(-1)"/>
                                        </div>
                                    </div>
                                </div>
                                <input type="number" id="npp" name="npp" value="${npp}" style="display: none" />
                                <input type="number" id="nextp" name="nextp" value="1" style="display: none" />

                                <div class="divider">
                                    <div class="divider-text">Search</div>
                                </div>
                                <a type="button" class="btn btn-primary" href="CRUD_Coupon?mod=create">
                                    <span class="tf-icons bx bx-plus"></span> Create new Coupon
                                </a>
                                <div class="divider">
                                    <div class="divider-text">Table</div>
                                </div>
                                <input type="number" hidden="" id="status" value="-1">
                                <div id="content" style="margin-left: 20px; margin-right:20px">
                                    <div class="table-responsive">
                                        <table class="table text-end-center">
                                            <thead class="table-light">
                                                <tr class="text-dark">
                                                    <th style="table-layout: fixed; width: 15%;">Code</th>
                                                    <th style="table-layout: fixed; max-width:300px;width: 25% ">Message</th>
                                                    <th style="table-layout: fixed; width: 10%">Valid from</th>
                                                    <th style="table-layout: fixed; width: 10%">Valid to</th>
                                                    <th style="table-layout: fixed; width: 15%"><a
                                                            class="dropdown-toggle"
                                                            data-bs-toggle="dropdown"
                                                            aria-expanded="false"
                                                            >Status</a>
                                                        <ul class="dropdown-menu">
                                                            <li><a class="dropdown-item" onclick="change2(-1)"><span class="badge bg-label-info" >All</span></a></li>
                                                            <li><a class="dropdown-item" onclick="change2(0)"><span class="badge bg-label-dark" >Not Avail</span></a></li>
                                                            <li><a class="dropdown-item" onclick="change2(1)"><span class="badge bg-label-primary" >Available</span></a></li>
                                                            <li><a class="dropdown-item" onclick="change2(2)"><span class="badge bg-label-success" >In usage</span></a></li>
                                                            <li><a class="dropdown-item" onclick="change2(3)"><span class="badge bg-label-danger" >Banned</span></a></li>
                                                            <li><a class="dropdown-item" onclick="change2(4)"><span class="badge bg-label-secondary" >Outdated</span></a></li>
                                                        </ul>
                                                    </th>
                                                    <th style="table-layout: fixed; width: 10%">Free</th>
                                                    <th style="table-layout: fixed; width: 15%">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody class="table-border-bottom-0">
                                                <c:forEach items="${data}" var="item">
                                                    <tr>
                                                        <td>${item.getName()}</td>
                                                        <td style="table-layout: fixed; max-width:300px ">${item.getMessage()}</td>
                                                        <td>${item.getValid_fromString()}</td>
                                                        <td>${item.getValid_toString()}</td>
                                                        <c:if test="${item.getStatus()==0}"><td><span class="badge bg-label-dark" >Not Avail</span></td></c:if>
                                                        <c:if test="${item.getStatus()==1}"><td><span class="badge bg-label-primary" >Available</span></td></c:if>
                                                        <c:if test="${item.getStatus()==2}"><td><span class="badge bg-label-success" >In usage</span></td></c:if>
                                                        <c:if test="${item.getStatus()==3}"><td><span class="badge bg-label-danger" >Banned</span></td></c:if>
                                                        <c:if test="${item.getStatus()==4}"><td><span class="badge bg-label-secondary" >Outdated</span></td></c:if>
                                                        <td>${item.isFree_check()}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${item.getValid_from() lt now}">
                                                                    <div style="display: inline-flex">
                                                                        <a class="btn btn-icon btn-sm" data-bs-toggle="modal" data-bs-target="#updateCoupon"
                                                                           ><i class="bx bx-edit-alt me-1"></i></a
                                                                        >
                                                                        <a class="btn btn-icon btn-sm"  onclick="editCoupon('${item.getId()}', 'delete')"
                                                                           ><i class="bx bx-trash me-1"></i></a
                                                                        >
                                                                        <a class="btn btn-icon btn-sm" onclick="editCoupon('${item.getId()}', 'detail')"
                                                                           ><i class='bx bxs-info-circle me-1'></i></a
                                                                        >
                                                                        <a class="btn btn-icon btn-sm" onclick="customersPromotion('${item.getId()}')"
                                                                           ><i class='bx bxs-discount me-1'></i></a
                                                                        >
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div style="display: inline-flex">
                                                                        <a class="btn btn-icon btn-sm" onclick="editCoupon('${item.getId()}', 'update')"
                                                                           ><i class="bx bx-edit-alt me-1"></i></a
                                                                        >
                                                                        <a class="btn btn-icon btn-sm"  onclick="editCoupon('${item.getId()}', 'delete')"
                                                                           ><i class="bx bx-trash me-1"></i></a
                                                                        >
                                                                        <a class="btn btn-icon btn-sm" onclick="editCoupon('${item.getId()}', 'detail')"
                                                                           ><i class='bx bxs-info-circle me-1'></i></a
                                                                        >
                                                                        <a class="btn btn-icon btn-sm" onclick="customersPromotion('${item.getId()}')"
                                                                           ><i class='bx bxs-discount me-1'></i></a
                                                                        >
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                        <h5 class="card-header"></h5>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="updateCoupon" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel1">Alert</h5>
                                                    <button
                                                        type="button"
                                                        class="btn-close"
                                                        data-bs-dismiss="modal"
                                                        aria-label="Close"
                                                        ></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col mb-3">
                                                            The coupon is in usage period. Do you want to create new Coupon instead?
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                                        Close
                                                    </button>
                                                    <a type="button" class="btn btn-primary" name="check" value="true" href="CRUD_Coupon?mod=create">Create new Coupon</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Pagination -->
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination pagination-sm justify-content-end">


                                            <c:choose>
                                                <c:when test="${curp==1}">
                                                    <li class="page-item prev">
                                                        <a class="page-link disabled" 
                                                           ><i class="tf-icon bx bx-chevrons-left"></i
                                                            ></a>
                                                    </li>
                                                    <li class="page-item active">
                                                        <button class="page-link">1</button>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item">
                                                        <button class="page-link" onclick="switchPage(${curp -1})" >
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </button>
                                                    </li>
                                                    <li class="page-item">
                                                        <button onclick="switchPage(1)" class="page-link">1</button>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>

                                            <c:choose>
                                                <c:when test="${curp-2>1}">
                                                    <li class="page-item">
                                                        <button class="page-link disabled">...</button>
                                                    </li>
                                                </c:when>
                                            </c:choose>

                                            <c:forEach begin="2" end="${maxp-1}" varStatus="loop">
                                                <c:choose>
                                                    <c:when test="${loop.index<=(curp+1)&&loop.index>=(curp-1)}">
                                                        <c:choose>
                                                            <c:when test="${curp==loop.index}">
                                                                <li class="page-item active">
                                                                    <button class="page-link">${loop.index}</button>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item">
                                                                    <button onclick="switchPage(${loop.index})" class="page-link">${loop.index}</button>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>

                                            <c:choose>
                                                <c:when test="${curp+2<maxp}">
                                                    <li class="page-item disabled">
                                                        <button class="page-link disabled">...</button>
                                                    </li>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${1==maxp }">
                                                    <li class="page-item disabled">
                                                        <button class="page-link disabled" >
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </button>
                                                    </li>
                                                </c:when>  
                                                <c:when test="${curp==maxp}">
                                                    <li class="page-item active">
                                                        <button class="page-link disabled">${maxp}</button>
                                                    </li>
                                                    <li class="page-item">
                                                        <button class="page-link disabled" >
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </button>
                                                    </li>
                                                </c:when>

                                                <c:otherwise>
                                                    <li class="page-item">
                                                        <button onclick="switchPage(${maxp})" class="page-link">${maxp}</button>
                                                    </li>
                                                    <li class="page-item">
                                                        <button class="page-link" onclick="switchPage(${curp +1})" >
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </button>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </nav>
                                    <!-- Pagination -->
                                </div>
                            </div>
                            <!-- / Content -->

                            <!-- Footer -->
                            <footer class="content-footer footer bg-footer-theme">
                                <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                                    <div class="mb-2 mb-md-0">
                                        ©
                                        <script>
                                            document.write(new Date().getFullYear());
                                        </script>
                                        , made with ❤️ by
                                        <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                                    </div>
                                    <div>
                                        <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                                        <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                                        <a
                                            href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                                            target="_blank"
                                            class="footer-link me-4"
                                            >Documentation</a
                                        >

                                        <a
                                            href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                                            target="_blank"
                                            class="footer-link me-4"
                                            >Support</a
                                        >
                                    </div>
                                </div>
                            </footer>
                            <!-- / Footer -->

                            <div class="content-backdrop fade"></div>
                        </div>
                        <!-- Content wrapper -->
                    </div>
                    <!-- / Layout page -->
                </div>
            </div>

            <!-- Overlay -->
            <div class="layout-overlay layout-menu-toggle"></div>
        </div>
        <!-- / Layout wrapper -->

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

        <!--My script-->
        <script>
                                            function switchPage(p) {
//                                                alert("hi");
                                                var s = document.getElementById("status").value;
                                                searchAjax(s, p);
                                            }
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
                                            function searchAjax(s, p) {
                                                var name = document.getElementById("Name").value;
                                                var startDate = document.getElementById("startDate").value;
                                                var endDate = document.getElementById("endDate").value;
                                                var npp = document.getElementById("npp").value;
                                                $.ajax({
                                                    url: "searchCoupon",
                                                    data: {name: name, startDate: startDate, endDate: endDate, npp: npp, nextp: p, status: s},
                                                    type: "POST",
                                                    success: function (data) {
                                                        var searchList = document.getElementById('content');
                                                        searchList.innerHTML = data;
                                                    }
                                                });
                                            }
                                            $(document).ready(function () {
                                                $("#Name").on("keyup", function () {
                                                    var d = document.getElementById("status");
                                                    d.value = -1;
                                                    searchAjax(-1, 1);
                                                });
                                            });


        </script>

        <script>
            function editCoupon(id, mode) {
                window.location = "/SWP391_1/CRUD_Coupon?mod=" + mode + "&id=" + id;
            }
            function customersPromotion(id) {
                window.location = "/SWP391_1/promotion?" + "id=" + id;
            }
        </script>
        <script>
            function change2(s) {
                var d = document.getElementById("status");
                d.value = s;
                searchAjax(s, 1);
            }
        </script>

    </body>
</html>
