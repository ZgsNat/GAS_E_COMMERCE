<%-- 
    Document   : index
    Created on : May 31, 2023, 1:17:51 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <style>
            .slideshow-container {

                position: relative;
                width: 1400px;
                height: 490px;
                margin: 0 auto; /* Center the slideshow horizontally */
                overflow: hidden;
            }

            .mySlides {
                display: none;
                position: absolute;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
        </style>
        <script>
            let slideIndex = 0;
            showSlides();

            function showSlides() {
                let slides = document.getElementsByClassName("mySlides");
                for (let i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1;
                }
                if (slides.length > 0) {
                    slides[slideIndex - 1].style.display = "block";
                }
                setTimeout(showSlides, 2000); // Change slide every 2 seconds
            }
        </script>
    </head>
    <body>

        <div class="site-wrap">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="slideshow-container">
                    <c:forEach var="b" items="${banner}">
                    <img class="mySlides" src="./banner/${b.getImage()}" alt="${b.title}">
                </c:forEach>
            </div>

            <div class="site-section site-section-sm site-blocks-1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
                            <div class="icon mr-4 align-self-start">
                                <span class="icon-truck"></span>
                            </div>
                            <div class="text">
                                <h2 class="text-uppercase">Free Shipping</h2>
                                <!--                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>-->
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
                            <div class="icon mr-4 align-self-start">
                                <span class="icon-refresh2"></span>
                            </div>
                            <div class="text">
                                <h2 class="text-uppercase">Free Returns</h2>
                                <!--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>-->
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="icon mr-4 align-self-start">
                                <span class="icon-help"></span>
                            </div>
                            <div class="text">
                                <h2 class="text-uppercase">Customer Support</h2>
                                <!--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site-section site-blocks-2">
                <div class="container">
                    <!--                                                <div class="row">
                                                                        <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                                                                            <a class="block-2-item" href="#">
                                                                                <figure class="image">
                                                                                    <img src="images/women.jpg" alt="" class="img-fluid">
                                                                                </figure>
                                                                                <div class="text">
                                                                                    <span class="text-uppercase">Collections</span>
                                                                                    <h3>Women</h3>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                                                                            <a class="block-2-item" href="#">
                                                                                <figure class="image">
                                                                                    <img src="images/children.jpg" alt="" class="img-fluid">
                                                                                </figure>
                                                                                <div class="text">
                                                                                    <span class="text-uppercase">Collections</span>
                                                                                    <h3>Children</h3>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                                                                            <a class="block-2-item" href="#">
                                                                                <figure class="image">
                                                                                    <img src="images/men.jpg" alt="" class="img-fluid">
                                                                                </figure>
                                                                                <div class="text">
                                                                                    <span class="text-uppercase">Collections</span>
                                                                                    <h3>Men</h3>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                    </div>-->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="site-section site-blocks-2">
                                <div class="row justify-content-center text-center mb-5">
                                    <div class="col-md-7 site-section-heading text-center pt-4">
                                        <h2>Categories</h2>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                                        <a class="block-2-item" href="categoryFilter?cID=1">
                                            <figure class="image">
                                                <img src="Client/binh-ga.jpg" alt="" class="img-fluid">
                                            </figure>
                                            <div class="text">
                                                <h3>Bình Ga</h3>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                                        <a class="block-2-item" href="categoryFilter?cID=2">
                                            <figure class="image">
                                                <img src="Client/bep-ga.png.webp" alt="" class="img-fluid">
                                            </figure>
                                            <div class="text">
                                                <h3>Bếp Ga</h3>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                                        <a class="block-2-item" href="categoryFilter?cID=3">
                                            <figure class="image">
                                                <img style="width: 500px;height: 350px;" src="Client/phu-kien-bep.webp" alt="" class="img-fluid">
                                            </figure>
                                            <div class="text">
                                                <h3>Linh kiện bếp</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!--                <div class="site-section block-3 site-blocks-2 bg-light">
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-md-7 site-section-heading text-center pt-4">
                                            <h2>Featured Products</h2>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="nonloop-block-3 owl-carousel">
                                                <div class="item">
                                                    <div class="block-4 text-center">
                                                        <figure class="block-4-image">
                                                            <img src="images/cloth_1.jpg" alt="Image placeholder" class="img-fluid">
                                                        </figure>
                                                        <div class="block-4-text p-4">
                                                            <h3><a href="#">Tank Top</a></h3>
                                                            <p class="mb-0">Finding perfect t-shirt</p>
                                                            <p class="text-primary font-weight-bold">$50</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="block-4 text-center">
                                                        <figure class="block-4-image">
                                                            <img src="images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                                                        </figure>
                                                        <div class="block-4-text p-4">
                                                            <h3><a href="#">Corater</a></h3>
                                                            <p class="mb-0">Finding perfect products</p>
                                                            <p class="text-primary font-weight-bold">$50</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="block-4 text-center">
                                                        <figure class="block-4-image">
                                                            <img src="images/cloth_2.jpg" alt="Image placeholder" class="img-fluid">
                                                        </figure>
                                                        <div class="block-4-text p-4">
                                                            <h3><a href="#">Polo Shirt</a></h3>
                                                            <p class="mb-0">Finding perfect products</p>
                                                            <p class="text-primary font-weight-bold">$50</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="block-4 text-center">
                                                        <figure class="block-4-image">
                                                            <img src="images/cloth_3.jpg" alt="Image placeholder" class="img-fluid">
                                                        </figure>
                                                        <div class="block-4-text p-4">
                                                            <h3><a href="#">T-Shirt Mockup</a></h3>
                                                            <p class="mb-0">Finding perfect products</p>
                                                            <p class="text-primary font-weight-bold">$50</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="block-4 text-center">
                                                        <figure class="block-4-image">
                                                            <img src="images/shoe_1.jpg" alt="Image placeholder" class="img-fluid">
                                                        </figure>
                                                        <div class="block-4-text p-4">
                                                            <h3><a href="#">Corater</a></h3>
                                                            <p class="mb-0">Finding perfect products</p>
                                                            <p class="text-primary font-weight-bold">$50</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>-->

            <!--                <div class="site-section block-8">
                                <div class="container">
                                    <div class="row justify-content-center  mb-5">
                                        <div class="col-md-7 site-section-heading text-center pt-4">
                                            <h2>Big Sale!</h2>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-md-12 col-lg-7 mb-5">
                                            <a href="#"><img src="images/blog_1.jpg" alt="Image placeholder" class="img-fluid rounded"></a>
                                        </div>
                                        <div class="col-md-12 col-lg-5 text-center pl-md-5">
                                            <h2><a href="#">50% less in all items</a></h2>
                                            <p class="post-meta mb-4">By <a href="#">Carl Smith</a> <span class="block-8-sep">&bullet;</span> September 3, 2018</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam iste dolor accusantium facere corporis ipsum animi deleniti fugiat. Ex, veniam?</p>
                                            <p><a href="#" class="btn btn-primary btn-sm">Shop Now</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>-->

            <!--            <footer class="site-footer border-top">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6 mb-5 mb-lg-0">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3 class="footer-heading mb-4">Navigations</h3>
                                            </div>
                                            <div class="col-md-6 col-lg-4">
                                                <ul class="list-unstyled">
                                                    <li><a href="#">Sell online</a></li>
                                                    <li><a href="#">Features</a></li>
                                                    <li><a href="#">Shopping cart</a></li>
                                                    <li><a href="#">Store builder</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6 col-lg-4">
                                                <ul class="list-unstyled">
                                                    <li><a href="#">Mobile commerce</a></li>
                                                    <li><a href="#">Dropshipping</a></li>
                                                    <li><a href="#">Website development</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6 col-lg-4">
                                                <ul class="list-unstyled">
                                                    <li><a href="#">Point of sale</a></li>
                                                    <li><a href="#">Hardware</a></li>
                                                    <li><a href="#">Software</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
                                        <h3 class="footer-heading mb-4">Promo</h3>
                                        <a href="#" class="block-6">
                                            <img src="images/hero_1.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
                                            <h3 class="font-weight-light  mb-0">Finding Your Perfect Shoes</h3>
                                            <p>Promo from  nuary 15 &mdash; 25, 2019</p>
                                        </a>
                                    </div>
                                    <div class="col-md-6 col-lg-3">
                                        <div class="block-5 mb-5">
                                            <h3 class="footer-heading mb-4">Contact Info</h3>
                                            <ul class="list-unstyled">
                                                <li class="address">203 Fake St. Mountain View, San Francisco, California, USA</li>
                                                <li class="phone"><a href="tel://23923929210">+2 392 3929 210</a></li>
                                                <li class="email">emailaddress@domain.com</li>
                                            </ul>
                                        </div>
            
                                        <div class="block-7">
                                            <form action="#" method="post">
                                                <label for="email_subscribe" class="footer-heading">Subscribe</label>
                                                <div class="form-group">
                                                    <input type="text" class="form-control py-4" id="email_subscribe" placeholder="Email">
                                                    <input type="submit" class="btn btn-sm btn-primary" value="Send">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="row pt-5 mt-5 text-center">
                                    <div class="col-md-12">
                                        <p>
                                             Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. 
                                            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" class="text-primary">Colorlib</a>
                                             Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. 
                                        </p>
                                    </div>
            
                                </div>
                            </div>
                        </footer>-->
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
