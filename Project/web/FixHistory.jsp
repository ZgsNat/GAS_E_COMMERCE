<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.Orders" %>
<%@page import = "Model.Warranty" %>
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
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>

        <script>
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;
            }

            window.jsPDF = window.jspdf.jsPDF;
        </script>

    </head>
    <body>
        <% List<Warranty> warranty = new ArrayList<Warranty>();
           Warranty w = new Warranty();
           String customerName = "";
           String invoiceId = "";
           String purchaseDate = "";
           String phone = "";
           String address = "";
           if(request.getAttribute("order") != null){
                warranty = (List<Warranty>)request.getAttribute("order");
                w = warranty.get(0);
                customerName= w.getCustomerName();
                invoiceId = w.getOrderId()+"";
                purchaseDate = w.getPurchaseDate();
                phone = w.getPhone();
                address = w.getAddress();
            }
        %>
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
                            <span class="app-brand-text menu-text fw-bolder" style="border-width:1px; border-style:solid; border-color:#696cff; padding: 5px; font-family: 'Mukta';color: #696cff; font-weight: 50; font-size: 25px"> GAS VIETNAM </span>                        </a>

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

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Sale & Revenue Start -->
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
                        <br>

                        <div class="container-fluid pt-4 px-4">
                            <a class="btn btn-light text-capitalize border-0" onclick="printDiv('invoice')" value="Print" data-mdb-ripple-color="dark"><i
                                    class="fas fa-print text-primary"></i> Print</a> 
                            <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark" href="saleRedirect?mode=9&id=<%=invoiceId%>"><i
                                    class="fas fa-money-bill text-primary"></i> Invoice</a></button> 
                            <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark" href="saleRedirect?mode=5&orderId=<%=invoiceId%>"><i
                                    class="fas fa-scroll text-primary"></i> Warranty</a></button> 
                            <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark" href="saleRedirect?mode=6&orderId=<%=invoiceId%>" style="color:#8789FF;"><i
                                    class="fas fa-clock text-primary"></i> Fix History</a>
                            <div class="card" id="card">
                                <div class="card-body" id="invoice">
                                    <div class="container mb-5 mt-3">
                                        <div class="row d-flex align-items-baseline">
                                            <div class="col-xl-11">
                                                <h1 style="color: #7e8d9f;font-size: 20px;">WARRANTY HISTORY</h1>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="container">
                                            <div class="col-md-12">
                                                <div class="text-center">
                                                    <h1 class="fab fa-mdb fa-4x ms-0" style="color:#8789FF;"><span class="app-brand-text menu-text fw-bolder" style="border-width:2px; border-style:solid; border-color:#233446; padding: 5px; font-family: 'Mukta';color: #333; font-weight: 50; font-size: 30px"> GAS VIETNAM </span>
</h1>
                                                </div>
                                            </div>
                                            <br><br>

                                            <div class="row">
                                                <div class="col-xl-8">
                                                    <ul class="list-unstyled">
                                                        <li class="text-muted">Customer Name: <span style="color:#8789FF ;"><%=customerName%></span></li>
                                                        <li class="text-muted">Address: <span style="color:#8789FF ;"><%=address%></span></li>
                                                        <li style="color:#8789FF ;"><i class="fas fa-phone" style="color:#8789FF ;"></i> <%=phone%></li>   
                                                    </ul>
                                                </div>
                                                <div class="col-xl-4">
                                                    <ul class="list-unstyled">
                                                        <li class="text-muted"><i class="fas fa-circle" style="color:#8789FF ;"></i> <span
                                                                class="fw-bold">Invoice ID:</span> <%=invoiceId%></li>
                                                        <li class="text-muted"><i class="fas fa-circle" style="color:#8789FF ;"></i> <span
                                                                class="fw-bold">Purchase Date: </span><%=purchaseDate%></li> 
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="row my-2 mx-1 justify-content-center">
                                                <table class="table table-striped table-borderless">
                                                    <thead style="background-color:#8789FF ;" class="text-white">
                                                        <tr>
                                                            <th scope="col" style="color: whitesmoke">NO.</th>
                                                            <th scope="col" style="color: whitesmoke">Product Name</th>
                                                            <th scope="col" style="color: whitesmoke">Quantity</th>
                                                            <th scope="col" style="color: whitesmoke">Malfunction Description</th>
                                                            <th scope="col" style="color: whitesmoke">Price</th>
                                                            <th scope="col" style="color: whitesmoke">Location</th>
                                                            <th scope="col" style="color: whitesmoke">Fix Date</th>
                                                            <th scope="col" style="color: whitesmoke">Warranty Expire Date</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:set value="1" var="index"/>
                                                        <c:forEach items="${requestScope.warranty}" var="item">
                                                            <tr>
                                                                <td>${index}</td>
                                                                <td>${item.getProductName()}</td>
                                                                <td>${item.getQuantity()}</td>
                                                                <td>${item.getMalfunctionDesc()}</td>
                                                                <td>${item.getPriceConfig()}</td>
                                                                <td>${item.getLocation()}</td>
                                                                <td>${item.getModifiedDate()}</td>
                                                                <td>${item.getExpireDate()}</td>
                                                            </tr>
                                                            <c:set value="${index+1}" var="index"/>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-xl-10">
                                                <p>Thank you for the purchase</p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
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
            </div>
        </div>



        <!-- Back to Top -->


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


