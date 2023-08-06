<%-- 
    Document   : Header
    Created on : Jun 2, 2023, 2:19:32 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
        <style>
            .dropdown:hover>.dropdown-menu {
                display: block;
            }

            .dropdown>.dropdown-toggle:active {
                /*Without this, clicking will make it sticky*/
                pointer-events: none;
            }
        </style>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script type="text/javascript" src="https://web.cmbliss.com/webtools/hotline/js/hotline.js"></script><script type="text/javascript">$("body").hotline({phone: "${phone}", themes: "hero", p_bottom: true, bottom: 0, p_left: true, left: 0, bg_color: "#e60808", abg_color: "rgba(230, 8, 8, 0.7)", show_bar: true, position: "fixed", });</script>
    </head>
    <body>
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
                                <a href="Home" class="js-logo-clone">GAS VIETNAM</a>
                            </div>
                        </div>

                        <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                            <div class="site-top-icons">
                                <ul>
                                    <c:if test="${sessionScope.Customer==null}">
                                        <li>
                                            <a href="logincookie"><span>Login</span></a> | 
                                            <a href="register"><span></span>Register</a>
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
                                                <span style="font-size: 20px">${sessionScope.Customer.getCustomerName()}</span>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="info">Information</a>
                                                    <a class="dropdown-item" href="updatenewpassword">Change Password</a>                                                     
                                                    <a class="dropdown-item" href="login">Logout</a>
                                                </ul>
                                            </div>
                                        </li>
                                    </c:if>
                                    <!--                                    <li><a href="#"><span class="icon icon-heart-o"></span></a></li>-->
                                    <li>
                                        <a href="showcart" class="site-cart">
                                            <span class="icon icon-shopping_cart"></span>
                                            <!--<span class="count">2</span>-->
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
                    <ul class="site-menu js-clone-nav d-none d-md-block">
                        <c:forEach items="${sessionScope.H}" var="f"> 
                            <li>
                                <a href="${f.getContent()}">${f.title}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </nav>
        </header>
    </body>
    <script>

    </script>
</html>
