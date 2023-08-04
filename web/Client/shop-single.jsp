<%-- 
    Document   : shop-single
    Created on : May 31, 2023, 1:18:40 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            /* CSS cho phần comment */
            .comment-section {
                margin-bottom: 20px;
                margin-left: 200px;
                margin-right: 200px;
            }

            .comment-section label {
                font-weight: bold;
            }

            .comment-section textarea {
                width: 100%;
                height: 100px;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .rating {
                margin-top: 10px;
            }

            .rating span {
                font-weight: bold;
            }

            .rating input[type="radio"] {
                display: none;
            }

            .rating label {
                display: inline-block;
                padding: 3px 8px;
                background-color: #f2f2f2;
                border-radius: 4px;
                cursor: pointer;
            }

            .rating input[type="radio"]:checked + label {
                background-color: #ffc107;
                color: #fff;
            }

            .btn-primary {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
            }

            /* CSS cho bảng comment */
            .table {
                width: 100%;
                border-collapse: collapse;
            }

            .table thead th,
            .table tbody td {
                padding: 10px;
                border: 1px solid #ccc;
            }

            .table thead th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            .table tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .table tbody tr:hover {
                background-color: #e9e9e9;
            }

            /* CSS cho comment của khách hàng */
            .customer-comment {
                padding: 10px;
                border: 1px solid #ccc;
                margin-bottom: 10px;
                margin-left: 200px;
                margin-right: 200px;
                background-color: #f2f2f2;
            }

            .customer-comment .customer-name {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .customer-comment .comment-content {
                margin-bottom: 5px;
            }

            .customer-comment .comment-rating {
                font-weight: bold;
            }

            .customer-comment .comment-date {
                font-style: italic;
                color: #888;
            }
            .checked {
                color: orange;
            }
            .rate {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate:not(:checked) > input {
                display: none;
            }
            .rate:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:30px;
                color:#ccc;
            }
            .rate:not(:checked) > label:before {
                content: '★ ';
            }
            .rate > input:checked ~ label {
                color: #ffc700;
            }
            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }
            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }

            /* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */
        </style>

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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="Client/css/aos.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="Client/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="site-wrap">
            <jsp:include page="Header.jsp"></jsp:include>

                <div class="bg-light py-3">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 mb-0"><a href="Home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black"> ${data2.getProductName()}</strong></div>
                    </div>
                </div>
            </div>  

            <div class="site-section">
                <div class="container">
                    <form action="processcart" method="post">
                        <div class="row">
                            <div class="col-md-3">
                                <div id="carouselExample" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
                                    <div class="carousel-inner">
                                        <c:forEach items="${multiImg}" var="item" varStatus="loop">
                                            <c:if test="${loop.last}">
                                                <div class="carousel-item active" style="text-align: center; background-color:white ">
                                                    <img class="img-fluid" src="MultiImgProduct/${item.getMultiImg()}" alt="First slide" style='height: 100%; width:100% '/>
                                                </div>
                                            </c:if>
                                            <c:if test="${not loop.last}">
                                                <div class="carousel-item" style="text-align: center; background-color:white ">
                                                    <img class="img-fluid" src="MultiImgProduct/${item.getMultiImg()}" alt="First slide" style='height: 100%; width:100% '/>
                                                </div>
                                            </c:if>

                                        </c:forEach>

                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <h2 class="text-black">${data2.getProductName()}</h2>
                                <p>${data2.getDetail()}</p>
                                <p><strong class="text-primary h4">${data2.getMoney()} VND</strong></p>
                                <div class="mb-5">
                                    <div class="input-group mb-3" style="max-width: 120px;">
                                        <!--                                    <div class="input-group-prepend">
                                                                                <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                                                                            </div>
                                                                            <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                                            <div class="input-group-append">
                                                                                <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                                                                            </div>-->
                                    </div>

                                </div>
                                <!--<p><a href="processcart?id=${data2.getProductID()}&num=${1}" class="buy-now btn btn-sm btn-primary">Add To Cart</a></p>-->
                                <input name="id" value="${data2.getProductID()}" hidden>
                                <input name="num" value="1" hidden>
                                <c:if test="${sessionScope.Customer!=null}">
                                    <button class="buy-now btn btn-sm btn-primary" type="submit" onclick="addToCartAjax()">Add To Cart</button>
                                </c:if>
                                <c:if test="${sessionScope.Customer==null}">
                                    <button class="buy-now btn btn-sm btn-primary" type="submit" onclick="document.location.href='http://localhost:9999/SWP391_1/'">Add To Cart</button>
                                </c:if>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            <form action="commentController?pID=${data2.getProductID()}&cID=${data2.getCategoryID()}" method="post">
                <div class="comment-section">
                    <label for="comment">Comment:</label><br>
                    <textarea name="commentClient" id="comment"></textarea><br>
                    ${commentError}<br>
                    ${commentErrorLogin}<br>
                    <label for="comment">Rate: </label><br>
                    <div class="rate">
                        <input type="radio" id="star5" name="rating" value="5" />
                        <label for="star5" title="text">5 stars</label>
                        <input type="radio" id="star4" name="rating" value="4" />
                        <label for="star4" title="text">4 stars</label>
                        <input type="radio" id="star3" name="rating" value="3" />
                        <label for="star3" title="text">3 stars</label>
                        <input type="radio" id="star2" name="rating" value="2" />
                        <label for="star2" title="text">2 stars</label>
                        <input type="radio" id="star1" name="rating" value="1" />
                        <label for="star1" title="text">1 star</label>
                    </div>
                    <input  type="submit" name="postComment" value="Post" class="btn btn-primary">

                </div>
            </form>
            <c:forEach items="${data3}" var="item">
                <div class="customer-comment">
                    <div style="display: flex ; ">
                        <img src="https://icon-library.com/images/anonymous-avatar-icon/anonymous-avatar-icon-25.jpg" style="border-radius: 50%; width: 50px; height: 50%; margin-right: 15px" alt="alt"/>
                        <div style="">
                            <div class="customer-name" style="margin: 0;">${item.getCreatedByName()}</div>
                            <c:if test="${item.getRating()==1}">
                                <span class="fa fa-star checked"></span>
                            </c:if>
                            <c:if test="${item.getRating()==2}">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                            </c:if>
                            <c:if test="${item.getRating()==3}">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                            </c:if>
                            <c:if test="${item.getRating()==4}">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                            </c:if>
                            <c:if test="${item.getRating()==5}">
                                <span  class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                            </c:if>
                        </div>
                    </div>
                    <div class="comment-date" style="font-size: 11px">Created Date: ${item.getCreatedDate()}</div>
                    <div class="comment-content">${item.getContent()}</div>
                </div>
            </c:forEach>
            <div class="position-fixed top-0 start-0 p-3" style="z-index: 2000">
                <div id="oneToast" class="bs-toast toast fade hide bg-success text-white" role="alert" aria-live="assertive" aria-atomic="true" >
                    <div class="d-flex">
                        <div class="toast-body">
                            Add to cart successfully!
                        </div>
                        <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>

            <div class="site-section block-3 site-blocks-2 bg-light">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-7 site-section-heading text-center pt-4">
                            <h2>Related Products</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="nonloop-block-3 owl-carousel">
                                <c:forEach items="${data}" var="item">
                                    <div class="item" style="text-align: center">
                                        <div class="block-4 text-center" style='height: 500px'>
                                            <figure class="block-4-image">
                                                <a href="productDetail?pID=${item.getProductID()}&cID=${item.getCategoryID()}"><img src="uploads/${item.getSmallImg()}" alt="Image placeholder" class="img-fluid" style="height: 300px; border: 0px; text-align: center"></a>
                                            </figure>
                                            <div class="block-4-text p-4">
                                                <h3><a href="productDetail?pID=${item.getProductID()}&cID=${item.getCategoryID()}">${item.getProductName()}</a></h3>
                                                <p class="mb-0">${item.getProductName()}</p>
                                                <p class="text-primary font-weight-bold">${item.getMoney()} VND</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="Footer.jsp"></jsp:include>                
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                                        function addToCartAjax() {
                                            event.preventDefault();
//                                            alert('hi');
                                            var id = `${data2.getProductID()}`;
                                            var num = 1;
                                            $.ajax({
                                                url: "processcart",
                                                data: {id: id, num: num},
                                                type: "POST",
                                                success: function (data) {
//                                                    alert('yay');
                                                    var toastElement = document.getElementById('oneToast');
                                                    // Create a new Toast instance from Bootstrap
                                                    var toast = new bootstrap.Toast(toastElement);
                                                    // Show the toast
                                                    toast.show();
                                                }
                                            });
                                        }
        </script>
        <script src="Client/js/jquery-3.3.1.min.js"></script>
        <script src="Client/js/jquery-ui.js"></script>
        <script src="Client/js/popper.min.js"></script>
        <script src="Client/js/bootstrap.min.js"></script>
        <script src="Client/js/owl.carousel.min.js"></script>
        <script src="Client/js/jquery.magnific-popup.min.js"></script>
        <script src="Client/js/aos.js"></script>

        <script src="Client/js/main.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    </body>
</html>
