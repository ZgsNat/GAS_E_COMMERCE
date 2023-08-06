<%-- 
    Document   : shop
    Created on : May 31, 2023, 1:20:14 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.Orders" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Purchase History</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="Client/fonts/icomoon/style.css">
        
        <!-- Favicon -->
<!--        <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />-->
        
        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        
        <link rel="stylesheet" href="Client/css/bootstrap.min.css">
        <link rel="stylesheet" href="Client/css/magnific-popup.css">
        <link rel="stylesheet" href="Client/css/jquery-ui.css">
        <link rel="stylesheet" href="Client/css/owl.carousel.min.css">
        <link rel="stylesheet" href="Client/css/owl.theme.default.min.css">


        <link rel="stylesheet" href="Client/css/aos.css">

        <link rel="stylesheet" href="Client/css/style.css">

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
           String subtotal="";
           String tax="";
           String discount="";
           if(request.getAttribute("orders") != null){
                order = (List<Orders>)request.getAttribute("orders");
                o = order.get(order.size()-1);
                customerName= o.getCustomerName();
                invoiceId = o.getOrderID()+"";
                purchaseDate = o.getPurchaseDate();
                phone = o.getPhone();
                email = o.getGmail();
                address = o.getAddress();
                totalConfig = o.getTotalPriceConfig();
                note = o.getNote();
                subtotal=o.getSubtotalConfig();
                tax=o.getTaxConfig();
                discount=o.getDiscountConfig();
            }
        %>
        <div class="site-wrap">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="bg-light py-3">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 mb-0"><a href="Home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Purchase History</strong></div>
                        </div>
                    </div>
                </div>

                <div class="site-section">
                    <div class="container-fluid pt-4 px-4">
                            <!--<button onclick="printDiv('invoice')" value="Print">-->
                            <a class="btn btn-light text-capitalize border-0" onclick="printDiv('invoice')" value="Print" data-mdb-ripple-color="dark"><i
                                    class="fas fa-print text-primary"></i> Print</a>
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
                                                    <h1 class="fab fa-mdb fa-4x ms-0" style="color:#239e34 ;"><span class="app-brand-text menu-text fw-bolder" style="border-width:2px; border-style:solid; border-color:#233446; padding: 5px; font-family: 'Mukta';color: #333; font-weight: 50; font-size: 30px"> GAS VIETNAM </span>
</h1>
                                                </div>
                                            </div>
                                            <br><br>

                                            <div class="row">
                                                <div class="col-xl-8">
                                                    <ul class="list-unstyled">
                                                        <li class="text-muted">Customer Name: <span style="color:#239e34 ;"><%=customerName%></span></li>
                                                        <li class="text-muted">Address: <span style="color:#239e34 ;"><%=address%></span></li>
                                                        <li class="text-muted">Email: <span style="color:#239e34 ;"><%=email%></span></li>

                                                    </ul>
                                                </div>
                                                <div class="col-xl-4">
                                                    <ul class="list-unstyled">
                                                        <li class="text-muted"><i class="fas fa-circle" style="color:#239e34;"></i> <span
                                                                class="fw-bold">Invoice ID:</span> <%=invoiceId%></li>
                                                        <li class="text-muted"><i class="fas fa-circle" style="color:#239e34 ;"></i> <span
                                                                class="fw-bold">Purchase Date: </span><%=purchaseDate%></li>
                                                        <li class="text-muted"><i class="fas fa-phone" style="color:#239e34;"></i> <%=phone%></li>    
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="row my-2 mx-1 justify-content-center">
                                                <table class="table table-striped table-borderless">
                                                    <thead style="background-color:#239e34 ;" class="text-white">
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
                                                    <h4 style="color:#239e34 ;">Note:</h4>
                                                    <p><%=note%></p>
                                                    <%--<p style="font-style: italic; font-weight: bold">Phiếu này có giá trị như phiếu báo giá và phiếu thanh toán</p> --%>
                                                </div>
                                                <div class="col-xl-4">
                                                    <ul class="list-unstyled">
                                                        <li class="text-muted ms-3"><span class="text-black me-4">SubTotal: </span><%=subtotal%> VND</li>
                                                        <li class="text-muted ms-3 mt-2"><span class="text-black me-4">Discount: </span><%=discount%></li>
                                                        <li class="text-muted ms-3 mt-2"><span class="text-black me-4">VAT(10%): </span><%=tax%> VND</li>
                                                    </ul>
                                                    <p class="text-black float-start"><span class="text-black me-3"> Total Amount: </span><span
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
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>

        <script src="Client/js/jquery-3.3.1.min.js"></script>
        <script src="Client/js/jquery-ui.js"></script>
        <script src="Client/js/popper.min.js"></script>
        <script src="Client/js/bootstrap.min.js"></script>
        <script src="Client/js/owl.carousel.min.js"></script>
        <script src="Client/js/jquery.magnific-popup.min.js"></script>
        <script src="Client/js/aos.js"></script>

        <script src="Client/js/main.js"></script>

    </body>
</html>