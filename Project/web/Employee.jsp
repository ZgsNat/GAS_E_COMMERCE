<%-- 
    Document   : Employee
    Created on : May 25, 2023, 12:54:00 AM
    Author     : minhn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.Orders" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="assets/css/demo.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            var currentPage = 1;
            var totalPages = 1;

            $('#frm').on('click', 'button[name="submit"]', function (e) {
                e.preventDefault(); // Prevent the default form submission

                var form = $(this).closest('form'); // Get the closest form element
                var formData = form.serialize(); // Serialize the form data

                // Make an AJAX POST request to the servlet endpoint
                $.ajax({
                    type: 'POST',
                    url: form.attr('action'),
                    data: formData,
                    success: function (response) {
                        // Handle the response here
                        // Update the page content or perform any necessary actions

                        // Example: update the form container with the new content
                        $('#frm').html(response);
                    },
                    error: function () {
                        // Handle the error case
                        console.error('There was an error processing the form submission.');
                    }
                });
            });

            $(document).ready(function () {
                $("#txtSearch").on("keyup", function () {
                    var txtSearch = $(this).val();
                    currentPage = 1;
                    performSearch(txtSearch, currentPage);
                });

                $("#categorySelect").change(function () {
                    var txtSearch = $("#txtSearch").val();
                    var category = $(this).val();
                    currentPage = 1;
                    performSearch(txtSearch, currentPage, category);
                });
            });

            function goToPage(pageNumber) {
                var txtSearch = $("#txtSearch").val();
                currentPage = pageNumber;
                performSearch(txtSearch, currentPage);
            }

            function performSearch(txtSearch, pageNumber, category) {
                $.ajax({
                    url: "searchAdmin",
                    type: "get",
                    data: {
                        txt: txtSearch,
                        page: pageNumber,
                        category: category
                    },
                    success: function (data) {
                        var response = data; // No need for JSON.parse()
                        var row = document.getElementById("tableContent");
                        row.innerHTML = response.tableRows;

                        var totalPages = response.totalPages;

                    },
                    error: function (xhr) {
                        console.log(xhr);
                    }
                });
            }
        </script>
    </head>

    <body>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->
                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                    <div class="app-brand demo">
                        <a href="general" class="app-brand-link">
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
                        <li class="menu-item">
                            <a href="coupon_admin" class="menu-link">
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
                        <li class="menu-item active">
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
                            <div class="bg-light text-center rounded p-4">
                                <!-- Employee list Start -->
                                <!--Hien thi thong tin cua tat ca cac nhan vien va cho phep thay doi role cua ho -->

                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Employee List</h6>
                                </div>
                                <!--Search-->
                                <form action="searchAdmin" method="post" style="margin-left: 20px; margin-right: 20px">
                                    <input type="hidden" name="mode" value="2">
                                    <div class="mb-2 col-sm row" >
                                        <label for="category" class="form-label">Filter by: </label>
                                        <div class="col-sm-6">
                                            <select class="form-select" id="categorySelect" aria-label="Default select example" name="category" id="category">
                                                <option value="0">All</option>
                                                <option value="1">Employee ID</option>
                                                <option value="2">Name</option>
                                                <option value="3">Phone</option>
                                                <option value="4">Email</option>   
                                            </select>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="input-group input-group-merge">
                                                <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
                                                <input type="text" class="form-control" name="txtSearch" placeholder="Search Employee" id="txtSearch"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-2">
                                        <input type="submit" name="submitSearch" value="Search">
                                    </div>
                                </form>
                                <!--Search-->

                                <a type="button" class="btn btn-primary" href="CRUD_Employee?mod=create">
                                    <span class="tf-icons bx bx-plus"></span> Add new Employee
                                </a>
                                <div class="divider">
                                    <div class="divider-text">Employee list</div>
                                </div>

                                <div id="tableContent">
                                    <div class="table-responsive">
                                        <form action="employee" method="post" id="frm">
                                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                                <thead>
                                                    <tr class="text-dark">
                                                        <th scope="col">Employee ID</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Phone</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Address</th>
                                                        <th scope="col">Access</th>
                                                        <th scope="col">Submit</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.admin}" var="item">
                                                        <tr>
                                                            <td>${item.getId()}</td>
                                                            <td>${item.getName()}</td>
                                                            <td>${item.getPhone()}</td>
                                                            <td>${item.getEmail()}</td>
                                                            <td>${item.getAddress()}</td>
                                                            <td>
                                                                <input type="checkbox" value="true" name="${item.getId()}_General_Page"
                                                                       <c:forEach items="${item.getRoles()}" var="role">
                                                                           <c:if test="${role eq 'General Page'}">
                                                                               checked="checked"
                                                                           </c:if>
                                                                       </c:forEach>
                                                                       /> General Page<br/>
                                                                <!-- Add similar code for other checkboxes -->
                                                                <input type="checkbox" value="true" name ="${item.getId()}_ProductInfo_Page"
                                                                       <c:forEach items="${item.getRoles()}" var="role">
                                                                           <c:if test = "${role eq 'ProductInfo Page'}">
                                                                               checked="checked" 
                                                                           </c:if>
                                                                       </c:forEach>
                                                                       /> ProductInfo Page<br/>

                                                                <input type="checkbox" value="true" name ="${item.getId()}_CustomerList_Page"
                                                                       <c:forEach items="${item.getRoles()}" var="role">
                                                                           <c:if test = "${role eq 'CustomerList Page'}">
                                                                               checked="checked" 
                                                                           </c:if>
                                                                       </c:forEach>
                                                                       /> CustomerList Page<br/>

                                                                <input type="checkbox" value="true" name ="${item.getId()}_Coupon_Page"
                                                                       <c:forEach items="${item.getRoles()}" var="role">
                                                                           <c:if test = "${role eq 'Coupon Page'}">
                                                                               checked="checked" 
                                                                           </c:if>
                                                                       </c:forEach>
                                                                       />  Coupon Page<br/>

                                                                <input type="checkbox" value="true" name ="${item.getId()}_News_Page"
                                                                       <c:forEach items="${item.getRoles()}" var="role">
                                                                           <c:if test = "${role eq 'News Page'}">
                                                                               checked="checked" 
                                                                           </c:if>
                                                                       </c:forEach>
                                                                       /> News Page<br/>

                                                                <input type="checkbox" value="true" name ="${item.getId()}_Employees_Page"
                                                                       <c:forEach items="${item.getRoles()}" var="role">
                                                                           <c:if test = "${role eq 'Employees Page'}">
                                                                               checked="checked" 
                                                                           </c:if>
                                                                       </c:forEach>
                                                                       /> Employees Page
                                                            </td>
                                                            <td>
                                                                <input type="submit" class="btn btn-sm btn-primary" value="Update" name="submit"><br><br>
                                                                <a class="btn btn-sm btn-primary" href="employee?id=${item.getId()}" name="delete">Delete</a>
                                                                <!--                                                                <button name="delete" value="">Delete</button>-->
                                                                <!--                                                                <input type="submit" value=Delete" name="delete">-->
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </form>                              
                                    </div>
                                    <div id="pagingContainer"></div>
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination justify-content-center">
                                            <c:forEach begin="1" end="${endPage}" var="i">
                                                <li class="page-item ${page==i?"active":""}">
                                                    <a class="page-link "  onclick="goToPage(${i})"
                                                       >${i}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>   
                                    </nav>
                                </div>
                            </div>
                        </div>

                        <!-- Employee list End -->


                        <!-- Footer Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-light rounded-top p-4">
                                <div class="row">
                                    <div class="col-12 col-sm-6 text-center text-sm-start">
                                        Address: #Insert Address <br>
                                        &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
                                    </div>
                                    <div class="col-12 col-sm-6 text-center text-sm-end">
                                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                        Contact Info: #Insert phone number
                                        </br>
                                        Email: electro@gmail.com
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
        <!-- Template Javascript -->
        <script src="js/main.js"></script>

    </body>

</html>

