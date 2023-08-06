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
                        <!--Navigation-->
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
                                    <div class="bg-light text-center rounded p-4">
                                        <div class="d-flex align-items-center justify-content-between mb-4">
                                            <!--                            <form class="col-md-6 xl" action="customerInfo" method="post">
                                                                            <label class="text-dark">Search by name: </label>
                                                                            <input type="text" name="Name" placeholder="Name">
                                                                                                            <select name="TypeofSearch">
                                                                                                                <option value="1">By Phone</option>
                                                                                                                <option value="2">By Name</option>
                                                                                                            </select>
                                                                            <input type="submit" name="search" value="Search" class="btn btn-sm btn-primary">
                                                                        </form>
                                                                        <form class="col-md-6 xxl" action="customerInfo" method="post">
                                                                            <label class="text-dark">Sort By:</label>
                                                                            <select name="TypeofSort">
                                                                                <option value="1">A-Z</option>
                                                                                <option value="2">Z-A</option>
                                                                                <option value="3">New Customer</option>
                                                                                <option value="4">Old Customer</option>
                                                                            </select>
                                                                            <input type="submit" name="search" value="Search" class="btn btn-sm btn-primary">
                                                                        </form>-->

                                        </div>

                                        <div class="table-responsive">
                                            <form action="updateProduct?pID=${p.getProductID()}" method="post" enctype='multipart/form-data'>
                                                <div class="row mb-3">
                                                    <label class="col-sm-2 col-form-label" for="basic-default-name">Name: </label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="basic-default-name" name="pName" value="${p.getProductName()}"/>
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <label class="col-sm-2 col-form-label" for="basic-default-message">Category</label>
                                                    <div class="col-sm-10">
                                                        <input
                                                            id="basic-default-message"
                                                            class="form-control"
                                                            aria-label=""
                                                            aria-describedby="basic-icon-default-message2"
                                                            name="cName"  value="${p.getCategoryName()}"
                                                            >
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <label class="col-sm-2 col-form-label" for="basic-default-value">Price: </label>
                                                    <div class="col-sm-4">
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="basic-default-value"
                                                            value="${p.getProductPrice()}"
                                                            name="pPrice"
                                                            />
                                                    </div>
                                                    <label class="col-sm-2 col-form-label" for="basic-default-value">Quantity: </label>
                                                    <div class="col-sm-4">
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="basic-default-value"
                                                            value="${p.getQuantity()}"
                                                            name="pQuantity"
                                                            />
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <label class="col-sm-2 col-form-label" for="basic-default-bill">Warranty: </label>
                                                    <div class="col-sm-4">
                                                        <div class="input-group input-group-merge">
                                                            <input type="text" class="form-control" id="basic-default-bill" value="${p.getWarranttyPeriod()}" name="pWarranty"/>
                                                            <span class="input-group-text">Year</span>
                                                        </div>
                                                    </div>

                                                    <label class="col-sm-2 col-form-label" for="basic-default-value">Modified By: </label>
                                                    <div class="col-sm-4">
                                                        <input
                                                            type="text" readonly=""
                                                            class="form-control-plaintext"
                                                            id="basic-default-value"
                                                            value="${sessionScope['name']}"
                                                            />
                                                    </div>

                                                </div>
                                                <div class="row mb-3">
                                                    <label class="col-sm-2 col-form-label" for="basic-default-bill">Modified Date: </label>
                                                    <div class="col-sm-10">
                                                        <input type="text" readonly class="form-control-plaintext" id="basic-default-bill" value="${p.getModifiedDate()}" name="pWarranty"/>
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
                                                            <th class="col-md-3">Product Image</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <TR>
                                                            <td>
                                                                <input id="imagesss" type="file" name="image" onchange="previewImage()">
                                                            </td> 
                                                    <input hidden name="smallImg" value="${p.getSmallImg()}">
                                                    <td><img id="imagess"  style="width: 100px;height: 100px;object-fit: fill;" src="uploads/${p.getSmallImg()}" alt="Image"></td>
                                                    </TR> 
                                                    </tbody>
                                                </table>

                                                <br>
                                                <button type="submit" class="btn btn-sm btn-primary" name="update">Update Product</button><br><br>
                                                <button type="reset" class="btn btn-sm btn-primary" name="cancel"><a style="text-decoration: none" href="productInfo">Cancel</a></button>
                                                <input name="cID" hidden value="${p.getCategoryID()}">
                                            </form>
                                            <td><textarea name="pID" cols="10" rows="3" style="width: 100%;word-break: normal;" hidden readonly>${p.getProductID()}</textarea></td>

                                            <div id="updateError">
                                                <h3>${updateError}</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--
                                <!-- Other Elements Start -->
                                <div class="container-fluid pt-4 px-4">
                                    <div class="row g-4">
                                        <div class="col-sm-12 col-xl-6">
                                            <div class="bg-light rounded h-100 p-4">
                                                <h6 class="mb-4">Basic Alerts</h6>
                                                <div class="alert alert-primary" role="alert">
                                                    A simple primary alert—check it out!
                                                </div>
                                                <div class="alert alert-secondary" role="alert">
                                                    A simple secondary alert—check it out!
                                                </div>
                                                <div class="alert alert-success" role="alert">
                                                    A simple success alert—check it out!
                                                </div>
                                                <div class="alert alert-danger" role="alert">
                                                    A simple danger alert—check it out!
                                                </div>
                                                <div class="alert alert-warning" role="alert">
                                                    A simple warning alert—check it out!
                                                </div>
                                                <div class="alert alert-info" role="alert">
                                                    A simple info alert—check it out!
                                                </div>
                                                <div class="alert alert-light" role="alert">
                                                    A simple light alert—check it out!
                                                </div>
                                                <div class="alert alert-dark mb-0" role="alert">
                                                    A simple dark alert—check it out!
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-xl-6">
                                            <div class="bg-light rounded h-100 p-4">
                                                <h6 class="mb-4">Icons & Dismissing Alerts</h6>
                                                <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                                    <i class="fa fa-exclamation-circle me-2"></i>An icon & dismissing primary alert—check it out!
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                                <div class="alert alert-secondary alert-dismissible fade show" role="alert">
                                                    <i class="fa fa-exclamation-circle me-2"></i>An icon & dismissing secondary alert—check it out!
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                    <i class="fa fa-exclamation-circle me-2"></i>An icon & dismissing success alert—check it out!
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                    <i class="fa fa-exclamation-circle me-2"></i>An icon & dismissing danger alert—check it out!
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                                    <i class="fa fa-exclamation-circle me-2"></i>An icon & dismissing warning alert—check it out!
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                                <div class="alert alert-info alert-dismissible fade show" role="alert">
                                                    <i class="fa fa-exclamation-circle me-2"></i>An icon & dismissing info alert—check it out!
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                                <div class="alert alert-light alert-dismissible fade show" role="alert">
                                                    <i class="fa fa-exclamation-circle me-2"></i>An icon & dismissing light alert—check it out!
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                                <div class="alert alert-dark alert-dismissible fade show mb-0" role="alert">
                                                    <i class="fa fa-exclamation-circle me-2"></i>An icon & dismissing dark alert—check it out!
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-xl-6">
                                            <div class="bg-light rounded h-100 p-4">
                                                <h6 class="mb-4">Basic Accordion</h6>
                                                <div class="accordion" id="accordionExample">
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header" id="headingOne">
                                                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                                data-bs-target="#collapseOne" aria-expanded="true"
                                                                aria-controls="collapseOne">
                                                                Accordion Item #1
                                                            </button>
                                                        </h2>
                                                        <div id="collapseOne" class="accordion-collapse collapse show"
                                                            aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                            <div class="accordion-body">
                                                                Gubergren justo eos magna eirmod lorem magna, amet dolores ipsum sadipscing ipsum consetetur invidunt et clita diam, vero dolor dolor est eirmod. Rebum accusam amet ipsum et. Et et lorem sanctus amet eos eos elitr ea, sanctus magna et et sed eos sit takimata sadipscing, dolor rebum sed stet vero.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header" id="headingTwo">
                                                            <button class="accordion-button collapsed" type="button"
                                                                data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                                                aria-expanded="false" aria-controls="collapseTwo">
                                                                Accordion Item #2
                                                            </button>
                                                        </h2>
                                                        <div id="collapseTwo" class="accordion-collapse collapse"
                                                            aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                                            <div class="accordion-body">
                                                                Voluptua sit dolores consetetur ea et diam est et takimata. Et erat sadipscing dolores et stet diam ut ut diam, sit aliquyam no magna et dolore lorem dolor sit. Lorem lorem sed sed duo, eirmod sit diam ipsum sit erat, lorem sit dolor diam amet ea aliquyam tempor rebum invidunt,.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header" id="headingThree">
                                                            <button class="accordion-button collapsed" type="button"
                                                                data-bs-toggle="collapse" data-bs-target="#collapseThree"
                                                                aria-expanded="false" aria-controls="collapseThree">
                                                                Accordion Item #3
                                                            </button>
                                                        </h2>
                                                        <div id="collapseThree" class="accordion-collapse collapse"
                                                            aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                                            <div class="accordion-body">
                                                                Dolore eos dolor tempor justo sea eos amet eos kasd dolor, et diam tempor lorem dolores vero. Stet dolore gubergren nonumy diam. Consetetur sit takimata magna invidunt, dolore sea amet consetetur ea et rebum, invidunt et amet sit sea. Dolor eirmod sed magna sadipscing sadipscing lorem lorem sed, sit lorem.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-xl-6">
                                            <div class="bg-light rounded h-100 p-4">
                                                <h6 class="mb-4">Flush Accordion</h6>
                                                <div class="accordion accordion-flush" id="accordionFlushExample">
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header" id="flush-headingOne">
                                                            <button class="accordion-button" type="button"
                                                                data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
                                                                aria-expanded="true" aria-controls="flush-collapseOne">
                                                                Accordion Item #1
                                                            </button>
                                                        </h2>
                                                        <div id="flush-collapseOne" class="accordion-collapse collapse show"
                                                            aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                                            <div class="accordion-body">
                                                                Lorem et ea ea consetetur voluptua duo et aliquyam sanctus sit. Et dolore at erat amet et diam labore lorem dolores. Erat amet stet at dolore dolor ea invidunt, justo nonumy justo takimata magna. Stet lorem vero sed eos justo diam dolores, dolor sit takimata et voluptua aliquyam gubergren tempor.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header" id="flush-headingTwo">
                                                            <button class="accordion-button collapsed" type="button"
                                                                data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
                                                                aria-expanded="false" aria-controls="flush-collapseTwo">
                                                                Accordion Item #2
                                                            </button>
                                                        </h2>
                                                        <div id="flush-collapseTwo" class="accordion-collapse collapse"
                                                            aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                                            <div class="accordion-body">
                                                                Sea diam dolore aliquyam aliquyam diam et consetetur et. Accusam amet no invidunt invidunt et consetetur, magna ut nonumy kasd erat tempor dolor et. Diam magna dolor sed amet duo dolores magna vero. Amet sit sadipscing ea diam clita lorem sit. Vero et et et tempor diam. Ipsum eirmod sit.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header" id="flush-headingThree">
                                                            <button class="accordion-button collapsed" type="button"
                                                                data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
                                                                aria-expanded="false" aria-controls="flush-collapseThree">
                                                                Accordion Item #3
                                                            </button>
                                                        </h2>
                                                        <div id="flush-collapseThree" class="accordion-collapse collapse"
                                                            aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                                            <div class="accordion-body">
                                                                Sea sea sit sanctus magna gubergren kasd, magna justo ea lorem lorem. Elitr aliquyam ipsum clita consetetur duo at nonumy invidunt, invidunt eos dolore vero sit amet amet magna tempor clita, takimata diam justo stet erat et vero erat. Sit ipsum eirmod sea ut vero dolores sea clita nonumy, no.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-xl-6">
                                            <div class="bg-light rounded h-100 p-4">
                                                <h6 class="mb-4">Basic Navs & Tabs</h6>
                                                <nav>
                                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                        <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                                            data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home"
                                                            aria-selected="true">Home</button>
                                                        <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
                                                            data-bs-target="#nav-profile" type="button" role="tab"
                                                            aria-controls="nav-profile" aria-selected="false">Profile</button>
                                                        <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
                                                            data-bs-target="#nav-contact" type="button" role="tab"
                                                            aria-controls="nav-contact" aria-selected="false">Contact</button>
                                                    </div>
                                                </nav>
                                                <div class="tab-content pt-3" id="nav-tabContent">
                                                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                                        Diam sea sanctus amet clita lorem sit sanctus ea elitr. Lorem rebum est elitr eos. Dolores aliquyam sadipscing dolor sadipscing accusam voluptua tempor. Sanctus elitr sanctus diam tempor diam aliquyam et labore clita, ipsum takimata amet est erat, accusam takimata gubergren sea sanctus duo nonumy. Ipsum diam ipsum sit kasd.
                                                    </div>
                                                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                                        Sanctus vero sit kasd sea gubergren takimata consetetur elitr elitr, consetetur sadipscing takimata ipsum dolores. Accusam duo accusam et labore ea elitr ipsum tempor sit, dolore aliquyam ipsum sit amet sit. Et dolore ipsum labore invidunt rebum. Sed dolore gubergren sanctus vero diam lorem rebum elitr, erat diam dolor clita.
                                                    </div>
                                                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                                        Sit consetetur eirmod lorem ea magna sadipscing ipsum elitr invidunt, dolores lorem erat ipsum ut aliquyam eos lorem sed. Nonumy aliquyam ea justo eos dolores dolores duo dolores. Aliquyam dolor sea dolores sit takimata no erat vero. At lorem justo tempor lorem duo, stet kasd aliquyam ipsum voluptua labore at.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-xl-6">
                                            <div class="bg-light rounded h-100 p-4">
                                                <h6 class="mb-4">Pills Navs & Tabs</h6>
                                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                                                            data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                                            aria-selected="true">Home</button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                                            data-bs-target="#pills-profile" type="button" role="tab"
                                                            aria-controls="pills-profile" aria-selected="false">Profile</button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill"
                                                            data-bs-target="#pills-contact" type="button" role="tab"
                                                            aria-controls="pills-contact" aria-selected="false">Contact</button>
                                                    </li>
                                                </ul>
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                                        Sit sanctus et stet dolor kasd kasd takimata. Dolor stet dolores nonumy et dolor et eos lorem et, diam ipsum nonumy elitr sanctus dolores voluptua sit dolor, at et et amet nonumy elitr ea et ipsum. Elitr lorem et dolore invidunt eirmod voluptua lorem sed. Sed eirmod sadipscing eos tempor.
                                                    </div>
                                                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                                        Invidunt rebum voluptua lorem eirmod dolore. Amet no sed sanctus lorem ea. Nonumy sit stet sit magna. Rebum rebum ipsum clita erat consetetur, sit dolor sit clita et amet. Est et clita dolore takimata, sea dolores tempor erat consetetur lorem. Consetetur sea sadipscing dolor et dolores et stet, tempor elitr.
                                                    </div>
                                                    <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                                                        Et diam et est sed vero ipsum voluptua dolor et, sit eos justo ipsum no ipsum amet sed aliquyam dolore, ut ipsum sanctus et consetetur. Sit ea sit clita lorem ea gubergren. Et dolore vero sanctus voluptua ipsum sadipscing amet at. Et sed dolore voluptua dolor eos tempor, erat amet.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-xl-6">
                                            <div class="bg-light rounded h-100 p-4">
                                                <h6 class="mb-4">Vertical Navs & Tabs</h6>
                                                <div class="d-flex align-items-start">
                                                    <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist"
                                                        aria-orientation="vertical">
                                                        <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill"
                                                            data-bs-target="#v-pills-home" type="button" role="tab"
                                                            aria-controls="v-pills-home" aria-selected="true">Home</button>
                                                        <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill"
                                                            data-bs-target="#v-pills-profile" type="button" role="tab"
                                                            aria-controls="v-pills-profile" aria-selected="false">Profile</button>
                                                        <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill"
                                                            data-bs-target="#v-pills-messages" type="button" role="tab"
                                                            aria-controls="v-pills-messages" aria-selected="false">Messages</button>
                                                        <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill"
                                                            data-bs-target="#v-pills-settings" type="button" role="tab"
                                                            aria-controls="v-pills-settings" aria-selected="false">Settings</button>
                                                    </div>
                                                    <div class="tab-content" id="v-pills-tabContent">
                                                        <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                                            Consetetur at sit est sit ut ipsum clita at. Sit elitr sit sea dolor tempor eos sit, erat diam ea rebum clita no ea. Et amet sed nonumy sadipscing dolor et ut sed et. Stet eirmod est nonumy clita invidunt rebum. Nonumy dolor ut diam invidunt eirmod nonumy sed gubergren,.
                                                        </div>
                                                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                                            Tempor et kasd accusam duo et dolor no accusam dolore, dolor sed voluptua duo no, sit et stet lorem dolor ipsum tempor consetetur vero, consetetur est eos sit eirmod erat diam accusam sadipscing sit. Takimata erat ea eirmod tempor elitr dolore sadipscing kasd justo, elitr tempor sed eos sadipscing magna.
                                                        </div>
                                                        <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                                            Sed kasd kasd ea clita sed lorem amet tempor est voluptua, labore stet dolores gubergren clita lorem sed nonumy at. Dolores et ut erat voluptua. Est voluptua stet accusam rebum, elitr amet sit takimata sea eirmod. Sanctus elitr amet sit dolore sea stet et ut. Dolor et sanctus elitr ut.
                                                        </div>
                                                        <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                                            Sit et vero kasd sea et at, aliquyam takimata et et est, labore et takimata sed ut stet sanctus, nonumy dolor invidunt sit labore et, amet et dolor sit dolor tempor et dolor ipsum nonumy, accusam clita sadipscing ut et labore labore est, dolore accusam vero at est sit. Invidunt.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-xl-6">
                                            <div class="bg-light rounded h-100 p-4">
                                                <h6 class="mb-4">Progress Bar</h6>
                                                <div class="pg-bar mb-3">
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                                <div class="pg-bar mb-3">
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-striped bg-success" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                                <div class="pg-bar mb-3">
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-striped bg-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                                <div class="pg-bar mb-3">
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-striped bg-warning" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                                <div class="pg-bar mb-0">
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-striped bg-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                --%>
                                <!-- Other Elements End -->


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
                        </div>
                    </div>
                </div>
            </div>


            <!-- Back to Top -->
        </div>
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

        <!-- Page JS -->

        <!-- Place this tag in your head or just before your close body tag. -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
    </body>

</html>
