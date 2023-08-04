<%-- 
    Document   : OrderManagement
    Created on : Jun 18, 2023, 11:05:27 PM
    Author     : minhn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.Orders" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html
    lang="en"
    class="light-style customizer-hide"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="assets/"
    data-template="vertical-menu-template-free"
    >
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Fix History</title>

        <meta name="description" content="" />

        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 

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
        <!-- Page -->
        <link rel="stylesheet" href="assets/vendor/css/pages/page-auth.css" />
        <!-- Helpers -->
        <script src="assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="assets/js/config.js"></script>
        <script>
            var currentPage = 1;
            var totalPages = 1;

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
                    url: "saleSearch",
                    type: "get",
                    data: {
                        txt: txtSearch,
                        page: pageNumber,
                        category: category,
                        mode: 1
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
        <c:if test="${not empty accessError}">
            <script>
                window.addEventListener("load", function () {
                alert("${accessError}");
                };
            </script>
        </c:if>
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
                        <li class="menu-item active">
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
                            <a href="coupon_admin" class="menu-link active">
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
                        <!--Navigation-->
                        <li class="menu-item">
                            <a href="HFM" class="menu-link">
                                <i class="menu-icon tf-icons bx bx-list-ul"></i>
                                <div data-i18n="Basic">Navigation Manager</div>
                            </a>
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
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">
                            <div class="col-sm-6 col-xl-3">
                                <a href="saleRedirect?mode=0">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class='bx bxs-bar-chart-square bx-flip-horizontal bx-lg' ></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Today Sale</p>
                                            <h6 class="mb-0">${today} VND</h6>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <a href="saleRedirect?mode=1">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class='bx bx-line-chart bx-lg'></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Monthly Sale</p>
                                            <h6 class="mb-0">${month} VND</h6>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <a href="saleRedirect?mode=2">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class='bx bxs-chart bx-lg'></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Last year sale</p>
                                            <h6 class="mb-0">${lastYear} VND</h6>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <a href="saleRedirect?mode=3">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class='bx bxs-pie-chart-alt-2 bx-lg'></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Yearly Sale</p>
                                            <h6 class="mb-0">${year} VND</h6>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- Sale & Revenue End -->

                    <!-- Recent Sales Start -->
                    <!--Truy van top 5 cac thong tin lien quan den Order -->

                    <div class="container-fluid pt-4 px-4">
                        <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark" href="general"><i
                                class="fas fa-money-bill text-primary"></i> Recent Sales</a>
                        <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark" href="saleRedirect?mode=8" style="color: #8789FF;"><i
                                class="fas fa-money-bill text-primary"></i> Order Management</a>
                        <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark" href="saleRedirect?mode=7"><i
                                class="fas fa-money-bill text-primary"></i> Fix History List</a>
                        <!--                        <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark" href="saleRedirect?mode=10"><i
                                                        class="fas fa-money-bill text-primary"></i> Create Order</a>-->
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Order Management</h6>
                            </div>
                            <!--Search-->
<!--                            <form action="saleSearch" method="get" style="margin-left: 20px; margin-right: 20px">
                                <input type="hidden" name="mode" value="1">
                                <div class="mb-2 col-sm row" >
                                    <label for="category" class="form-label">Filter by: </label>
                                    <div class="col-sm-6">
                                        <select class="form-select" id="categorySelect" aria-label="Default select example" name="category" id="category"> 
                                            <option value="0">All</option>
                                            <option value="1">Customer Name</option>
                                            <option value="2">Order Id</option>
                                            <option value="3">Phone</option>   
                                        </select> 
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="input-group input-group-merge">
                                            <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
                                            <input type="text" class="form-control" name="txtSearch" placeholder="Search Orders....." id="txtSearch"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-2">
                                    <input type="submit" name="submitSearch" value="Search">
                                </div>
                            </form>-->
                            <!--Search-->
                            <div id="tableContent">
                                <div class="table-responsive">
                                    <form action="saleRedirect" method="post">
                                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                                            <thead>
                                                <tr class="text-dark">
                                                    <th scope="col">No. </th>
                                                    <th scope="col">Invoice ID</th>
                                                    <th scope="col">Customer Name</th>
                                                    <th scope="col">Purchase Date</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Submit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set value="1" var="index"/>
                                                <c:forEach items="${requestScope.orders}" var="item">
                                                    <tr>
                                                        <td>${index}</td>
                                                        <td>${item.getOrderID()}</td>
                                                        <td>${item.getCustomerName()}</td>
                                                        <td>${item.getPurchaseDate()}</td>
                                                        <td>
                                                            <input type="radio" value="0" name="status_${item.getOrderID()}"
                                                                   <c:if test="${item.getStatus() eq 'Order has been delivered & paid'}">
                                                                       checked="checked"
                                                                   </c:if>
                                                                   /> Order has been delivered & paid<br/>

                                                            <input type="radio" value="1" name="status_${item.getOrderID()}"
                                                                   <c:if test="${item.getStatus() eq 'Order has been placed'}">
                                                                       checked="checked"
                                                                   </c:if>
                                                                   /> Order has been placed<br/>

                                                            <input type="radio" value="2" name="status_${item.getOrderID()}"
                                                                   <c:if test="${item.getStatus() eq 'Order has been received'}">
                                                                       checked="checked"
                                                                   </c:if>
                                                                   /> Order has been received<br/>

                                                            <input type="radio" value="3" name="status_${item.getOrderID()}"
                                                                   <c:if test="${item.getStatus() eq 'Order has been shipped'}">
                                                                       checked="checked"
                                                                   </c:if>
                                                                   /> Order has been shipped<br/>

                                                            <input type="radio" value="4" name="status_${item.getOrderID()}"
                                                                   <c:if test="${item.getStatus() eq 'Order cancellation requested'}">
                                                                       checked="checked"
                                                                   </c:if>
                                                                   /> Order cancellation requested<br/>

                                                            <input type="radio" value="5" name="status_${item.getOrderID()}"
                                                                   <c:if test="${item.getStatus() eq 'Order cancelled'}">
                                                                       checked="checked"
                                                                   </c:if>
                                                                   /> Order cancelled
                                                        </td>
                                                        <td><input type="submit" value="Update" name="submit"></td>
                                                    </tr>
                                                    <c:set value="${index+1}" var="index"/>
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
                    <!-- Recent Sales End -->


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


                <!-- Back to Top -->
            </div>
        </div>
    </div>

    <!-- JavaScript Libraries -->
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

