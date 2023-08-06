
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
        <base href="http://localhost:8080/SWP391_1/" />
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
            />

        <title>Invoice - Export/Print</title>

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
        <% List<Orders> order = new ArrayList<Orders>();
           Orders o = new Orders();
           String customerName = "";
           String invoiceId = "";
           String purchaseDate = "";
           String phone = "";
           String email = "";
           String address = "";
           String totalConfig = "";
           String note = "";
           if(request.getAttribute("orders") != null){
                order = (List<Orders>)request.getAttribute("orders");
                o = order.get(0);
                customerName= o.getCustomerName();
                invoiceId = o.getOrderID()+"";
                purchaseDate = o.getPurchaseDate();
                phone = o.getPhone();
                email = o.getGmail();
                address = o.getAddress();
                totalConfig = o.getTotalPriceConfig();
                note = o.getNote();
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

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!--Truy van top 5 cac thong tin lien quan den Order -->


                        <div class="container-fluid pt-4 px-4">
                            <!--<button onclick="printDiv('invoice')" value="Print">-->
<!--                            <a class="btn btn-light text-capitalize border-0" onclick="printDiv('invoice')" value="Print" data-mdb-ripple-color="dark"><i
                                    class="fas fa-print text-primary"></i> Print</a>-->
                            <div class="card" id="card">
                                <div class="card-body" id="invoice">
                                    <div class="container mb-5 mt-3">
                                        <div class="row d-flex align-items-baseline">
                                            <div class="col-xl-11">
                                                <h1 style="color: #7e8d9f;font-size: 20px;">INVOICE</h1>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="container">
                                            <div class="col-md-12">
                                                <div class="text-center">
                                                    <h1 class="fab fa-mdb fa-4x ms-0" style="color:#8789FF ;">SNEAT</h1>
                                                </div>
                                            </div>
                                            <br><br>

                                            <div class="row">
                                                <div class="col-xl-8">
                                                    <ul class="list-unstyled">
                                                        <li class="text-muted">Customer Name: <span style="color:#8789FF ;"><%=customerName%></span></li>
                                                        <li class="text-muted">Address: <span style="color:#8789FF ;"><%=address%></span></li>
                                                        <li class="text-muted">Email: <span style="color:#8789FF ;"><%=email%></span></li>

                                                    </ul>
                                                </div>
                                                <div class="col-xl-4">
                                                    <ul class="list-unstyled">
                                                        <li class="text-muted"><i class="fas fa-circle" style="color:#8789FF ;"></i> <span
                                                                class="fw-bold">Invoice ID:</span> <%=invoiceId%></li>
                                                        <li class="text-muted"><i class="fas fa-circle" style="color:#8789FF ;"></i> <span
                                                                class="fw-bold">Purchase Date: </span><%=purchaseDate%></li>
                                                        <li class="text-muted"><i class="fas fa-phone" style="color:#8789FF ;"></i> <%=phone%></li>    
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="row my-2 mx-1 justify-content-center">
                                                <table class="table table-striped table-borderless">
                                                    <thead style="background-color:#8789FF ;" class="text-white">
                                                        <tr>
                                                            <th scope="col" style="color: whitesmoke">NO.</th>
                                                            <th scope="col" style="color: whitesmoke">Product Name</th>
                                                            <th scope="col" style="color: whitesmoke">Singular Price</th>
                                                            <th scope="col" style="color: whitesmoke">Quantity</th>
                                                            <th scope="col" style="color: whitesmoke">Product(s) Price</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:set value="1" var="index"/>
                                                        <c:forEach items="${requestScope.orders}" var="item">
                                                            <tr>
                                                                <td>${index}</td>
                                                                <td>${item.getProductName()}</td>
                                                                <td>${item.getSingularPriceConfig()} VND</td>
                                                                <td>${item.getQuantity()}</td>
                                                                <td>${item.getPriceConfig()} VND</td>                                                                
                                                            </tr>
                                                            <c:set value="${index+1}" var="index"/>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-xl-8">
                                                    <h4 style="color:#8789FF ;">Note:</h4>
                                                    <p><%=note%></p>
                                                    <%--<p style="font-style: italic; font-weight: bold">Phiếu này có giá trị như phiếu báo giá và phiếu thanh toán</p> --%>
                                                </div>
                                                <div class="col-xl-4">
                                                    <ul class="list-unstyled">
                                                        <li class="text-muted ms-3"><span class="text-black me-4">SubTotal</span><%=totalConfig%> VND</li>
                                                        <li class="text-muted ms-3 mt-2"><span class="text-black me-4">Discount</span>N/A</li>
                                                        <li class="text-muted ms-3 mt-2"><span class="text-black me-4">VAT(10%)</span>N/A</li>
                                                    </ul>
                                                    <p class="text-black float-start"><span class="text-black me-3"> Total Amount</span><span
                                                            style="font-size: 25px;"><%=totalConfig%> VND</span></p>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-xl-10">
                                                    <p>Thank you for your purchase</p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Recent Sales End -->

                    </div>
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



