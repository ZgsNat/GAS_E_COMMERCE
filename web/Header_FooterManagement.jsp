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

        <title>Navigation Management</title>

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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="Client/fonts/icomoon/style.css">

        <link rel="stylesheet" href="Client/css/bootstrap.min.css">
        <link rel="stylesheet" href="Client/css/magnific-popup.css">
        <link rel="stylesheet" href="Client/css/jquery-ui.css">
        <link rel="stylesheet" href="Client/css/owl.carousel.min.css">
        <link rel="stylesheet" href="Client/css/owl.theme.default.min.css">
        <!-- // -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="Client/css/aos.css">

        <link rel="stylesheet" href="Client/css/style.css">


        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
        <style>
            .drag-list li {
                cursor: move;
            }

        </style>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var dragItems = document.querySelectorAll('.drag-list li');

                // Add draggable attribute to list items
                for (var i = 0; i < dragItems.length; i++) {
                    dragItems[i].setAttribute('draggable', 'true');
                    dragItems[i].addEventListener('dragstart', handleDragStart, false);
                    dragItems[i].addEventListener('dragover', handleDragOver, false);
                    dragItems[i].addEventListener('drop', handleDrop, false);
                }

                var dragSrcEl = null;

                function handleDragStart(e) {
                    dragSrcEl = this;
                    e.dataTransfer.effectAllowed = 'move';
                    e.dataTransfer.setData('text/html', this.innerHTML);
                }

                function handleDragOver(e) {
                    if (e.preventDefault) {
                        e.preventDefault(); // Allows dropping
                    }
                    e.dataTransfer.dropEffect = 'move';
                    return false;
                }

                function handleDrop(e) {
                    if (e.stopPropagation) {
                        e.stopPropagation(); // Stops the browser from redirecting
                    }
                    if (dragSrcEl !== this) {
                        dragSrcEl.innerHTML = this.innerHTML;
                        this.innerHTML = e.dataTransfer.getData('text/html');
                    }
                    return false;
                }
            });
            function getOrder() {
                // Get all the list items
                var listItems = document.querySelectorAll('ul#myList li');

                // Create an array to store the ordered content and title
                var orderedList = [];

                // Iterate over each list item and extract content and title
                listItems.forEach(function (item) {
                    var content = item.querySelector('a:first-child').getAttribute('id');
                    var title = item.querySelector('a:first-child').innerHTML;

                    // Create an object with content and title
                    var orderedItem = {
                        content: content,
                        title: title
                    };

                    // Push the ordered item to the array
                    orderedList.push(orderedItem);
                });

                $.ajax({
                    url: 'HFM?mod=ChangeHeader', // Replace with your servlet URL
                    type: 'POST',
                    data: JSON.stringify(orderedList),
                    contentType: 'application/json',
                    success: function (response) {
                        console.log('Data sent successfully');
                        // Handle the response from the servlet if needed
                    },
                    error: function (xhr, status, error) {
                        console.error('Error sending data:', error);
                    }
                });
            }
        </script>
        <style>
            .delete-button {
                display: none;
            }

            li:hover .delete-button {
                display: inline-block;
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
                        <li class="menu-item ">
                            <a href="coupon_admin" class="menu-link ">
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
                        <li class="menu-item active">
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

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="container-sm flex-grow-1 container-p-y">
                            <!-- Bootstrap Table with Header - Light -->
                            <div class="card" >
                                <a type="button" class="btn btn-primary" href="HFM?mod=Header">
                                    <span class="tf-icons bx bx-plus"></span> Add Header
                                </a><!-- comment -->
                                <header class="site-navbar" role="banner">
                                    <div class="site-navbar-top" style="background-color: #fff">
                                        <div class="container">
                                            <div class="row align-items-center">

                                                <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                                                    <!--                            <form action="" class="site-block-top-search">
                                                                                    <span class="icon icon-search2"></span>
                                                                                    <input type="text" class="form-control border-0" placeholder="Search">
                                                                                </form>-->
                                                </div>

                                                <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                                                    <div class="site-logo">
                                                        <a href="Client/index.jsp" class="js-logo-clone">GAS VIETNAM</a>
                                                    </div>
                                                </div>

                                                <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                                                    <div class="site-top-icons">
                                                        <ul>
                                                            <c:if test="${sessionScope.Customer==null}">
                                                                <li>
                                                                    <a href="logincookie"><span>Login</span></a> | 
                                                                    <a href="Client/Register.jsp"><span></span>Register</a>
                                                                </li>
                                                            </c:if>
                                                            <c:if test="${sessionScope.Customer!=null}">
                                                                <li>
                                                                    <div class="dropdown" style="margin: 10px">
                                                                        <span
                                                                            class="icon icon-person"
                                                                            type="button"
                                                                            id="dropdownMenuButton"
                                                                            data-mdb-toggle="dropdown"
                                                                            aria-expanded="false"
                                                                            >
                                                                        </span>
                                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                                            <a class="dropdown-item" href="customerinfo">Information</a>
                                                                            <a class="dropdown-item" href="Login">Logout</a>
                                                                        </ul>
                                                                    </div>
                                                                </li>
                                                            </c:if>
                                                            <!--                                    <li><a href="#"><span class="icon icon-heart-o"></span></a></li>-->
                                                            <li>
                                                                <a href="shopcart" class="site-cart">
                                                                    <span class="icon icon-shopping_cart"></span>
                                                                    <span class="count">2</span>
                                                                </a>
                                                            </li> 
                                                            <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                                                        </ul>
                                                    </div> 
                                                </div>

                                            </div>
                                        </div>
                                    </div> 
                                    <nav class="site-navigation text-right text-md-center" role="navigation" style="background-color: #239e34">
                                        <div class="container">
                                            <ul id="myList" class="drag-list site-menu js-clone-nav d-none d-md-block">
                                                <c:forEach items="${headerHA}" var="f"> 


                                                    <li>
                                                        <a id="${f.getContent()}" href="HFM?mod=Edit&section=Header&id=${f.id}">${f.title}</a>
                                                        <a href="HFM?mod=Delete&id=${f.getId()}" onclick="return confirm('Are you sure you want to delete this item')" class="delete-button">x</a>
                                                    </li>


                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </nav>
                                </header>
                                <footer class="site-footer border-top">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <c:forEach items="${footerCate}" var="fc">
                                                        <div class="col-md-4">
                                                            <div class="td-footer">
                                                                <h2 class="footer-heading mb-4">${fc.name}</h2>
                                                            </div>
                                                            <div class="list-lk">
                                                                <ul id="footer"  class="list-unstyled">
                                                                    <c:forEach items="${footer}" var="f"> 
                                                                        <c:if test="${fc.id == f.getCategoryID()}">
                                                                            <li>
                                                                                <a href="HFM?mod=Edit&section=Footer&id=${f.id}">${f.title}</a>
                                                                                <a href="HFM?mod=Delete&id=${f.getId()}" onclick="return confirm('Are you sure you want to delete this item')" class="delete-button">x</a>
                                                                            </li>

                                                                        </c:if>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>  
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <h3 class="footer-heading mb-4">Product</h3>
                                                <a href="Home" class="block-6">
                                                    <img src="images/hero_1.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
                                                    <c:forEach var="item" items="${c}">
                                                        <h7>${item.getTitle()}: ${item.getContent()}</h7><br>
                                                        </c:forEach>
                                                </a>
                                            </div> 

                                        </div>
                                    </div>
                                </footer>
                                <a type="button" class="btn btn-primary" href="HFM?mod=Footer">
                                    <span class="tf-icons bx bx-plus"></span> Add Footer
                                </a>
                                <button onclick="getOrder()">Get Order</button>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </body>
</html>
