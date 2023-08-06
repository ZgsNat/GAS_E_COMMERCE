<%-- 
    Document   : Footer
    Created on : Jun 2, 2023, 2:23:03 PM
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


        <link rel="stylesheet" href="Client/css/aos.css">

        <link rel="stylesheet" href="Client/css/style.css">

    </head>
    <body>
        <footer class="site-footer border-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="row">
                            <c:forEach items="${sessionScope.footerCate}" var="fc">
                                <div class="col-md-4">
                                    <div class="td-footer">
                                        <h2 class="footer-heading mb-4">${fc.name}</h2>
                                    </div>
                                    <div class="list-lk">
                                        <c:forEach items="${sessionScope.footer}" var="f"> 
                                            <c:if test="${fc.id == f.getCategoryID()}">
                                                <ul class="list-unstyled">
                                                    <li><a href="Tin-tuc/${f.slugify()}-${f.getId()}.html">${f.title}</a></li>
                                                </ul>
                                            </c:if>
                                        </c:forEach>
                                    </div>  
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3 class="footer-heading mb-4">Product</h3>
                        <a href="Home" class="block-6">
                            <img src="images/hero_1.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
                            <c:forEach var="item" items="${sessionScope.c}">
                                <h7>${item.getTitle()}: ${item.getContent()}</h7><br>
                            </c:forEach>
                        </a>
                    </div>

                </div>
            </div>
        </footer>
        <!--Start of Tawk.to Script-->
        <script type="text/javascript">
            var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
            (function () {
                var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                s1.async = true;
                s1.src = 'https://embed.tawk.to/648588d894cf5d49dc5cfb2f/1h2kpt3rh';
                s1.charset = 'UTF-8';
                s1.setAttribute('crossorigin', '*');
                s0.parentNode.insertBefore(s1, s0);
            })();
        </script>
        <!--End of Tawk.to Script-->
    </body>
</html>
