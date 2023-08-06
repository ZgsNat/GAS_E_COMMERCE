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
        <title>Shoppers &mdash; Product</title>
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
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

            .wrapper header h2 {
                font-size: 24px;
                font-weight: 600;
            }

            .wrapper header p {
                font-size: 15px;
                margin-top: 5px;
            }

            .wrapper .price-input {
                display: flex;
                width: 100%;
                margin: 30px 0 35px;
            }

            .wrapper .price-input .field {
                display: flex;
                width: 100%;
                height: 45px;
                align-items: center;
            }
            .price-input input {
                width: 100%;
                height: 100%;
                outline: none;
                border: 1px solid #999;
                border-radius: 5px;
                text-align: center;
                font-size: 18px;
                margin-left: 12px;
            }

            .price-input input::-webkit-outer-spin-button,
            .price-input input::-webkit-inner-spin-button {
                display: none;
            }

            .wrapper .seperator {
                width: 130px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 19px;
            }

            .wrapper .slider {
                height: 5px;
                position: relative;
                background-color: #ddd;
                border-radius: 5px;
            }

            .wrapper .progress {
                position: absolute;
                height: 100%;
                left: 5%;
                right: 65%;
                background-color: #4070f4;
                border-radius: 5px;
            }

            .wrapper .range-input {
                position: relative;
            }

            .wrapper .range-input input {
                position: absolute;
                width: 100%;
                height: 5px;
                top: -5px;
                pointer-events: none;
                background: none;
                appearance: none;
                accent-color: #4070f4;
            }

            .wrapper .range-input input::-webkit-slider-thumb {
                height: 15px;
                width: 15px;
                background-color: #4070f4;
                border-radius: 50%;
                pointer-events: auto;
                box-shadow: 0 0 6px rgba(0, 0, 0, 0.05);
            }
        </style>

        <div class="site-wrap">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="bg-light py-3">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 mb-0"><a href="Home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
                        </div>
                    </div>
                </div>

                <div class="site-section">
                    <div class="container">

                        <div class="row mb-5">
                            <div class="col-md-9 order-2">

                                <div class="row">
                                    <div class="col-md-12 mb-5">
                                        <div class="d-flex">
                                            <div class="input-group input-group-merge">
                                                <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
                                                <input type="text" class="form-control" name="search" placeholder="Search Product" value="" id="txtSearch"/>
                                            </div>
                                            <div class="dropdown mr-1 ml-md-auto">
                                                <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Categories
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                                                    <a class="dropdown-item" href="shop">Show All</a>
                                                    <a class="dropdown-item" href="shop?cID=1&page=${page}">Bình ga</a>
                                                <a class="dropdown-item" href="shop?cID=2&page=${page}">Bếp ga</a>
                                                <a class="dropdown-item" href="shop?cID=3&page=${page}">Linh kiện bếp</a>
                                            </div>
                                        </div>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuReference" data-toggle="dropdown">Sort</button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                                                <a class="dropdown-item" href="sortProductClient?page=${page}&cID=${cID}&mod=asc">Price, low to high</a>
                                                <a class="dropdown-item" href="sortProductClient?page=${page}&cID=${cID}&mod=desc">Price, high to low</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div name="pages">
                                <div id="tableContent">
                                    <div class="row mb-5">
                                        <c:forEach items="${data2}" var="item">
                                            <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                                                <div class="block-4 text-center border" style="height: 500px">
                                                    <figure class="block-4-image avatar">
                                                        <a href="productDetail?pID=${item.getProductID()}&cID=${item.getCategoryID()}"><img src="uploads/${item.getSmallImg()}" alt="Image placeholder" class="img-fluid" style="width: 300px; height: 300px"></a>
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
                                <div class="row" data-aos="fade-up">
                                    <div class="col-md-12 text-center">
                                        <div class="site-block-27">
                                            <ul>
                                                <c:forEach begin="1" end="${total}" var="i">
                                                    <li><a href="shop?page=${i}&cID=${cID}&mod=${mode}">${i}</a></li>
                                                    </c:forEach>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 order-1 mb-5 mb-md-0">
                            <div class="border p-4 rounded mb-4">
                                <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-1"><a href="shop?cID=1&page=${page}" class="d-flex"><span>Bình Ga</span> <span class="text-black ml-auto">${totalQuantity1} items left</span></a></li>
                                    <li class="mb-1"><a href="shop?cID=2&page=${page}" class="d-flex"><span>Bếp Ga</span> <span class="text-black ml-auto">${totalQuantity2} items left</span></a></li>
                                    <li class="mb-1"><a href="shop?cID=3&page=${page}" class="d-flex"><span>Linh kiện bếp</span> <span class="text-black ml-auto">${totalQuantity3} items left</span></a></li>
                                </ul>
<!--                                <form action="priceController" method="post">
                                    <div class="wrapper">
                                        <h2 class="sidebar-title">Price Range</h2>

                                        <div class="slider">
                                            <div class="progress"></div>
                                        </div>
                                        <div class="range-input">
                                            <input type="range" min="0" max="1000000" value="${minPrice != null ? minPrice : 0}" class="min-range" />
                                            <input
                                                type="range"
                                                min="0"
                                                max="1000000"
                                                value="${maxPrice != null ? maxPrice : 1000000}"
                                                class="max-range"
                                                />
                                        </div>
                                        <div class="price-input">
                                            <div class="field">
                                                <span>Min: VND</span>
                                                <input type="number" name="minPrice" value="${minPrice != null ? minPrice : 0}" class="min-input" />
                                            </div>
                                            <div class="seperator">-</div>
                                            <div class="field">
                                                <span>Max: VND</span>
                                                <input type="number" name="maxPrice" value="${maxPrice != null ? maxPrice : 1000000}" class="max-input" />
                                            </div>
                                        </div>
                                        <input type="submit" name="priceSearch" value="Search">
                                    </div>
                                </form>-->

                            </div>

                            <!--                            <div class="border p-4 rounded mb-4">
                                                            <div class="mb-4">
                                                                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3>
                                                                <div id="slider-range" class="border-primary"></div>
                                                                <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
                                                            </div>
                            
                                                            <div class="mb-4">
                                                                <h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
                                                                <label for="s_sm" class="d-flex">
                                                                    <input type="checkbox" id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small (2,319)</span>
                                                                </label>
                                                                <label for="s_md" class="d-flex">
                                                                    <input type="checkbox" id="s_md" class="mr-2 mt-1"> <span class="text-black">Medium (1,282)</span>
                                                                </label>
                                                                <label for="s_lg" class="d-flex">
                                                                    <input type="checkbox" id="s_lg" class="mr-2 mt-1"> <span class="text-black">Large (1,392)</span>
                                                                </label>
                                                            </div>
                            
                                                        </div>-->
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="site-section site-blocks-2">
                                <div class="row justify-content-center text-center mb-5">
                                    <div class="col-md-7 site-section-heading pt-4">
                                        <h2>Categories</h2>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
                                        <a class="block-2-item" href="shop?cID=1&page=${page}">
                                            <figure class="image">
                                                <img src="Client/binh-ga.jpg" alt="" class="img-fluid">
                                            </figure>
                                            <div class="text">
                                                <h3>Bình Ga</h3>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
                                        <a class="block-2-item" href="shop?cID=2&page=${page}">
                                            <figure class="image">
                                                <img src="Client/bep-ga.png.webp" alt="" class="img-fluid">
                                            </figure>
                                            <div class="text">
                                                <h3>Bếp Ga</h3>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
                                        <a class="block-2-item" href="shop?cID=3&page=${page}">
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
        <script>
            var currentPage = 1;
            var totalPages = 1;

            $(document).ready(function () {

                $("#txtSearch").on("keyup", function () {
                    var txtSearch = $(this).val();
                    currentPage = 1;
                    performSearch(txtSearch, currentPage);
                });

                $("#categorySelect").change(function () {
                    var txtSearch = $("#txtSearch").val();
                    var categoryId = $(this).val();
                    currentPage = 1;
                    performSearch(txtSearch, currentPage, categoryId);
                });
            });

            function goToPage(pageNumber) {
                var txtSearch = $("#txtSearch").val();
                currentPage = pageNumber;
                performSearch(txtSearch, currentPage);
            }

            function performSearch(txtSearch, pageNumber, categoryId) {
                $.ajax({
                    url: "searchProductClient",
                    type: "get",
                    data: {
                        txt: txtSearch,
                        page: pageNumber,
                        category: categoryId
                    },
                    success: function (data) {
                        var response = data; // No need for JSON.parse()
                        var row = document.getElementById("tableContent");
                        row.innerHTML = response.search;

                        var totalPages = response.totalPages;

                    },
                    error: function (xhr) {
                        console.log(xhr);
                    }
                });
            }
                        /* Created by Tivotal */

            const priceInputs = document.querySelectorAll(".price-input input");
            const rangeInputs = document.querySelectorAll(".range-input input");
            const range = document.querySelector(".slider .progress");

            let priceGap = 1000;

            priceInputs.forEach((input) => {
                input.addEventListener("input", (e) => {
                    let minPrice = parseInt(priceInputs[0].value);
                    let maxPrice = parseInt(priceInputs[1].value);

                    if (maxPrice - minPrice >= priceGap && maxPrice <= rangeInputs[1].max) {
                        if (e.target.className === "min-input") {
                            rangeInputs[0].value = minPrice;
                            range.style.left = (minPrice / rangeInputs[0].max) * 100 + "%";
                        } else {
                            rangeInputs[1].value = maxPrice;
                            range.style.right = 100 - (maxPrice / rangeInputs[1].max) * 100 + "%";
                        }
                    }
                });
            });

            rangeInputs.forEach((input) => {
                input.addEventListener("input", (e) => {
                    let minVal = parseInt(rangeInputs[0].value);
                    let maxVal = parseInt(rangeInputs[1].value);

                    if (maxVal - minVal < priceGap) {
                        if (e.target.className === "min-range") {
                            rangeInputs[0].value = maxVal - priceGap;
                        } else {
                            rangeInputs[1].value = minVal + priceGap;
                        }
                    } else {
                        priceInputs[0].value = minVal;
                        priceInputs[1].value = maxVal;
                        range.style.left = (minVal / rangeInputs[0].max) * 100 + "%";
                        range.style.right = 100 - (maxVal / rangeInputs[1].max) * 100 + "%";
                    }
                });
            });

        </script>
    </body>
</html>