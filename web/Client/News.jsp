<%-- 
    Document   : news
    Created on : Jun 8, 2023, 12:24:42 PM
    Author     : mp3th
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.text.Normalizer"%>  
<!DOCTYPE html>
<html>
    <head>
        <base href="http://localhost:9999/SWP391_1/">
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
        <style>
            #content {
                font-family: "Segoe UI", Arial, sans-serif !important;
            }
        </style>
        <title>News</title>
        <script>
            window.addEventListener('DOMContentLoaded', function () {
                // Lấy URL tùy chỉnh mới từ người dùng hoặc bất kỳ nguồn nào bạn muốn
                const newCustomURL = "http://localhost:9999/SWP391_1/${url}";

                // Thay đổi URL hiển thị bằng cách sử dụng History API
                history.replaceState({}, '', newCustomURL);
            });
   
            

            function convertToSlug(text) {
                return text
                        .toLowerCase()
                        .replace(/[^\w\s-]/g, '') // Loại bỏ ký tự không phải chữ cái, số, khoảng trắng và dấu gạch ngang
                        .replace(/\s+/g, '-') // Thay thế khoảng trắng bằng dấu gạch ngang
                        .replace(/--+/g, '-') // Loại bỏ các dấu gạch ngang trùng liên tiếp
                        .trim(); // Loại bỏ khoảng trắng dư thừa ở đầu và cuối chuỗi
            }
        </script>
    </head>
    <body>


        <div class="site-wrap">
            <jsp:include page="Header.jsp"></jsp:include>
                <div id="content">
                    <div class="bg-light py-3">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 mb-0"><a href="Home">Home</a> <span class="mx-2 mb-0">/</span>
                                <c:choose>
                                    <c:when test="${not empty cid}">
                                        <a href="Tin-tuc?id=${cid.getId()}" title="">${cid.getName()}</a>

                                    </c:when>
                                    <c:otherwise>
                                        <strong class="text-black">Tin tức</strong>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>
                </div>
                <section class="section wb">
                    <div class="container">
                        <div class="row">

                            <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                                <div class="page-wrapper">
                                    <div class="blog-list clearfix">
                                        <c:forEach items="${data}" var="n" >
                                            <div class="blog-box row">
                                                <div class="col-md-4">
                                                    <div class="post-media">
                                                        <a href="Tin-tuc/${n.slugify()}-${n.getId()}.html"" title="">
                                                            <img style=" height:250px;width: 315px;object-fit: fill; " src="uploads/${n.getImage()}" alt="" class="img-fluid">
                                                            <div class="hovereffect"></div>
                                                        </a>
                                                    </div><!-- end media -->
                                                </div><!-- end col -->

                                                <div class="blog-meta big-meta col-md-8">
                                                    <span class="bg-aqua"><a href="Tin-tuc?cid=${n.getCategoryID()}" title="">${n.getCategoryName()}</a></span>

                                                    <h4><a href="Tin-tuc/${n.slugify()}-${n.getId()}.html"" title="">${n.getTitle()}</a></h4>
                                                        ${n.getSummary()}

                                                    <small><a href="garden-single.html" title="">${n.getCreateDate()}</a></small>
                                                    <small><a href="#" title="">by ${n.getCreateBy()}</a></small>
                                                </div><!-- end meta -->
                                            </div><!-- end blog-box -->
                                            <br>
                                        </c:forEach>

                                    </div><!-- end blog-list -->
                                </div><!-- end page-wrapper -->

                                <hr class="invis">

                                <div class="row">
                                    <div class="col-md-12">
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination justify-content-start">
                                                <c:forEach begin="1" end="${endPage}" var="i" >
                                                    <li class="page-item "><a class="page-link" href="Tin-tuc?page=${i}&cid=${cID}">${i}</a></li>
                                                    </c:forEach>

                                            </ul>
                                        </nav>
                                    </div><!-- end col -->
                                </div><!-- end row -->
                            </div><!-- end col -->


                            <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                                <div class="sidebar">


                                    <div class="widget">
                                        <h2 class="widget-title">Tin tức</h2>
                                        <div class="blog-list-widget">
                                            <div class="list-group">
                                                <c:forEach items="${Cate}" var="n">
                                                    <a href="Tin-tuc?cid=${n.getId()}" class="list-group-item list-group-item-action flex-column align-items-start">${n.getName()}</a>
                                                </c:forEach>
                                            </div>
                                        </div><!-- end blog-list -->
                                    </div><!-- end widget -->   
                                </div><!-- end sidebar -->
                            </div><!-- end col -->
                        </div><!-- end row -->
                    </div><!-- end container -->
                </section>
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>


    </body>
</html>
