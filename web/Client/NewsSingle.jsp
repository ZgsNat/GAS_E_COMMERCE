<%-- 
    Document   : NewsSingle
    Created on : Jun 15, 2023, 12:06:44 PM
    Author     : mp3th
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>${news.getTitle()}</title>
        <!-- Fancybox CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css">

        <!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- Fancybox JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
        <style>
            #content {
                font-family: "Segoe UI", Arial, sans-serif !important;
            }
        </style>
    </head>
    <body>
        <div class="site-wrap">
            <jsp:include page="Header.jsp"></jsp:include>
                <div id="content">
                    <div class="bg-light py-3">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 mb-0"><a href="Home">Home</a> <span class="mx-2 mb-0">/</span><a href="Tin-tuc?id=${news.getCategoryID()}">${news.getCategoryName()}</a><span class="mx-2 mb-0">/</span> <strong class="text-black">${news.getTitle()}</strong></div>
                        </div>
                    </div>
                </div>
                <section class="section wb">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                                <div class="page-wrapper">
                                    <div class="blog-title-area">
                                        <span class="color-green"><a href="Tin-tuc?id=${news.getCategoryID()}" title="">${news.getCategoryName()}</a></span>

                                        <h1 style="color: #ef1120;font-weight: 600"  >${news.getTitle()}</h1>

                                        <div class="blog-meta big-meta">
                                            <small><a href="garden-single.html" title="">${news.getCreateDate()}</a></small>
                                            <small><a href="blog-author.html" title="">by ${news.getCreateBy()}</a></small>

                                        </div><!-- end meta -->

                                        <!--                                    <div class="post-sharing">
                                                                                <ul class="list-inline">
                                                                                    <li><a href="#" class="fb-button btn btn-primary"><i class="fa fa-facebook"></i> <span class="down-mobile">Share on Facebook</span></a></li>
                                                                                    <li><a href="#" class="tw-button btn btn-primary"><i class="fa fa-twitter"></i> <span class="down-mobile">Tweet on Twitter</span></a></li>
                                                                                    <li><a href="#" class="gp-button btn btn-primary"><i class="fa fa-google-plus"></i></a></li>
                                                                                </ul>
                                                                            </div> end post-sharing -->
                                    </div><!-- end title -->

                                    <div class="single-post-media">
                                        <img src="upload/garden_single_01.jpg" alt="" class="img-fluid">
                                    </div><!-- end media -->

                                    <div class="blog-content">  
                                        ${news.getSummary()}
                                        <p>${news.getContent()}</p>
                                    </div><!-- end content -->

                                    <!--                                <div class="blog-title-area">
                                                                        <div class="tag-cloud-single">
                                                                            <span>Tags</span>
                                                                            <small><a href="#" title="">lifestyle</a></small>
                                                                            <small><a href="#" title="">colorful</a></small>
                                                                            <small><a href="#" title="">trending</a></small>
                                                                            <small><a href="#" title="">another tag</a></small>
                                                                        </div> end meta 
                                    
                                                                        <div class="post-sharing">
                                                                            <ul class="list-inline">
                                                                                <li><a href="#" class="fb-button btn btn-primary"><i class="fa fa-facebook"></i> <span class="down-mobile">Share on Facebook</span></a></li>
                                                                                <li><a href="#" class="tw-button btn btn-primary"><i class="fa fa-twitter"></i> <span class="down-mobile">Tweet on Twitter</span></a></li>
                                                                                <li><a href="#" class="gp-button btn btn-primary"><i class="fa fa-google-plus"></i></a></li>
                                                                            </ul>
                                                                        </div> end post-sharing 
                                                                    </div> end title -->












                                </div><!-- end page-wrapper -->
                            </div><!-- end col -->

                            <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                                <div class="sidebar">


                                    <div class="widget">
                                        <h2 class="widget-title">Tin tức</h2>
                                        <div class="blog-list-widget">
                                            <div class="list-group">
                                                <c:forEach items="${Cate}" var="n">
                                                    <a href="Tin-tuc?id=${n.getId()}" class="list-group-item list-group-item-action flex-column align-items-start">${n.getName()}</a>
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

            <script>
                $(document).ready(function () {
                    $('.blog-content').find('img').each(function () {
                        $(this).wrap('<a class="fancybox" data-fancybox="gallery" href="' + $(this).attr('src') + '"></a>');
                    });


                    // Kích hoạt Fancybox
                    $('[data-fancybox="gallery"]').fancybox({
                        buttons: [
                            'zoom',
                            'slideShow',
                            'fullScreen',
                            'close'
                        ],
                        loop: true
                    });
                });
            </script>

    </body>
</html>
