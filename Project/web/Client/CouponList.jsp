<%-- 
    Document   : CouponList
    Created on : Jun 19, 2023, 3:03:02 AM
    Author     : CAT PHUONG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shoppers Voucher</title>
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
            .linkdetail {
                display: block;
                text-decoration: none;
                width: 30px;
                height: 30px;
                background-color: #D8DDE0;
                color: #fff;
                text-align: center;
                line-height: 30px;
                border-radius: 2px;
                position: absolute;
                right: 0px;
                top: 0px
            }
        </style>
    </head>
    <body>
        <div class="site-wrap">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="bg-light py-3">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 mb-0"><a href="#">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Voucher</strong></div>
                        </div>
                    </div>
                </div>

                <div class="site-section">
                    <div class="container">
                        <h1>Voucher</h1>
                        <div class="row mb-5">
                        <c:forEach var="item" items="${voucher}" varStatus="loop">
                            <c:if test="${item.getStatus()==2 and item.isFree_check() }">
                                <%--<c:if test="${loop.index<=12&&loop.index>=0}">--%>
                                <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up" >
                                    <div class="block-16 text-left border row" style="display: flex; margin: 10px; height:110px">
                                        <div class="col-md-4" style="padding-left: 0"><img
                                                src="VoucherImg/${item.getAvatar()}" data-original-title
                                                alt="voucher logo"
                                                class="d-block rounded"
                                                height="110"
                                                width="110"
                                                id="preview"
                                                /></div>
                                        <div class="col-md-8 block-4-text p-4" style="height:100px">
                                            <h3>Giảm ${item.getValue()}</h3>
                                            <p class="mb-0">
                                                <c:if test="${item.getMax_value() ne '0'}">
                                                    Max: ${item.getMax_value()}VND
                                                </c:if>
                                                &nbsp;
                                            </p>
                                            <div class="progress" style="height:3px;">
                                                <div class="progress-bar" role="progressbar" style="width: ${item.getProgress()}%;" aria-valuenow="${item.getProgress()}" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <a class="linkdetail" onclick="voucherinfo('${item.getId()}', '${item.getMessage()}')" target="_blank"></a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <%--</c:if>--%>
                        </c:forEach>


                    </div>
                    <h1>Upcoming Voucher</h1>
                    <div class="row mb-5">
                        <c:forEach var="item" items="${voucher}" varStatus="loop">
                            <c:if test="${item.getStatus()==1 and item.isFree_check() }">
                                <%--<c:if test="${loop.index<=12&&loop.index>=0}">--%>
                                <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up" style="border: none">
                                    <div class="block-16 text-left border row" style="display: flex; margin: 10px; height:110px">
                                        <div class="col-md-4" style="padding-left: 0"><img
                                                src="VoucherImg/${item.getAvatar()}" data-original-title
                                                alt="voucher logo"
                                                class="d-block rounded"
                                                height="110"
                                                width="110"
                                                id="preview"
                                                /></div>
                                        <div class="col-md-8 block-4-text p-4" style="height:100px">
                                            <h3>Giảm ${item.getValue()}</h3>
                                            <p class="mb-0">Start: ${item.getValid_fromString()}</p>

                                            <a class="linkdetail" onclick="voucherinfo('${item.getId()}', '${item.getMessage()}')" target="_blank"><i class="bx bx-info-square"></i></a>
                                        </div>
                                    </div> 


                                </div>

                            </c:if>
                            <%--</c:if>--%>
                        </c:forEach>


                    </div>

                </div>
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        <script>
            function voucherinfo(id, name)
            {
                var parts = name.split(" ");
                var newName = "";
                for (var i = 0; i < parts.length; i++) {
                    newName += parts[i] + "-";
                }
                newName = removeVietnameseAccents(newName);
                newName = convertToSlug(newName);
                newName += id;
                //                window.location = 'voucher/detail/' + newName;
                window.open('voucher/detail/' + newName, "_blank");
            }
            function convertToSlug(text) {
                return text
                        .toLowerCase()
                        .replace(/[^\w\s-]/g, '') // Loại bỏ ký tự không phải chữ cái, số, khoảng trắng và dấu gạch ngang
                        .replace(/\s+/g, '-') // Thay thế khoảng trắng bằng dấu gạch ngang
                        .replace(/--+/g, '-') // Loại bỏ các dấu gạch ngang trùng liên tiếp
                        .trim(); // Loại bỏ khoảng trắng dư thừa ở đầu và cuối chuỗi
            }
            function removeVietnameseAccents(str) {
                return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
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
