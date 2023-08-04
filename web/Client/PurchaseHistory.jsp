<%-- 
    Document   : shop
    Created on : May 31, 2023, 1:20:14 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Purchase History</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="Client/fonts/icomoon/style.css">

        <link rel="stylesheet" href="Client/css/bootstrap.min.css">
        <link rel="stylesheet" href="Client/css/magnific-popup.css">
        <link rel="stylesheet" href="Client/css/jquery-ui.css">
        <link rel="stylesheet" href="Client/css/owl.carousel.min.css">
        <link rel="stylesheet" href="Client/css/owl.theme.default.min.css">


        <link rel="stylesheet" href="Client/css/aos.css">

        <link rel="stylesheet" href="Client/css/style.css">

    </head>
    <body>

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
                    <div class="container">

                        <table class="table text-lg-center text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col">Order ID</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Purchase Date</th>
                                    <th scope="col">Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.orders}" var="item">
                                <tr>
                                    <td>${item.getOrderID()}</td>
                                    <td>${item.getCustomerName()}</td>
                                    <td>${item.getPurchaseDate()}</td>
                                    <td>VND ${item.getTotalPriceConfig()}</td>
                                    <td><a class="btn btn-sm btn-primary" href="invoice?id=${item.getOrderID()}">Details</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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