<%-- 
    Document   : CouponTicket
    Created on : Jun 15, 2023, 2:29:03 AM
    Author     : CAT PHUONG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voucher</title>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Oswald');
            * {
                margin: 0;
                padding: 0;
                border: 0;
                box-sizing: border-box
            }

            body {
                background-color: #dadde6;
                font-family: arial
            }

            .fl-left {
                float: left
            }

            .fl-right {
                float: right
            }

            h1 {
                text-transform: uppercase;
                font-weight: 900;
                border-left: 10px solid #fec500;
                padding-left: 10px;
                margin-bottom: 30px
            }

            .row {
                overflow: hidden
            }

            .card {
                display: table-row;
                width: 100%;
                background-color: #fff;
                color: #989898;
                margin-bottom: 10px;
                font-family: 'Oswald', sans-serif;
                text-transform: uppercase;
                border-radius: 4px;
                position: relative
            }

            .card+.card {
                margin-left: 2%
            }

            .date {
                display: table-cell;
                width: 25%;
                position: relative;
                text-align: center;
                border-right: 2px dashed #dadde6
            }

            .date:before,
            .date:after {
                content: "";
                display: block;
                width: 30px;
                height: 30px;
                background-color: #DADDE6;
                position: absolute;
                top: -15px;
                right: -15px;
                z-index: 1;
                border-radius: 50%
            }

            .date:after {
                top: auto;
                bottom: -15px
            }

            .date time {
                display: block;
                position: absolute;
                top: 50%;
                left: 50%;
                -webkit-transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%)
            }

            .date time span {
                display: block
            }

            .date time span:first-child {
                color: #2b2b2b;
                font-weight: 600;
                font-size: 250%
            }

            .date time span:last-child {
                text-transform: uppercase;
                font-weight: 600;
                margin-top: -10px
            }

            .card-cont {
                display: table-cell;
                width: 75%;
                font-size: 85%;
                padding: 10px 10px 30px 50px
            }

            .card-cont h3 {
                color: #3C3C3C;
                font-size: 130%
            }

            .row:last-child .card:last-of-type .card-cont h3 {
                text-decoration: blink;
            }

            .card-cont>div {
                display: table-row
            }

            .card-cont .even-date i,
            .card-cont .even-info i,
            .card-cont .even-date time,
            .card-cont .even-info p {
                display: table-cell
            }

            .card-cont .even-date i,
            .card-cont .even-info i {
                padding: 5% 5% 0 0
            }

            .card-cont .even-info p {
                padding: 30px 50px 0 0
            }

            .card-cont .even-date time span {
                display: block
            }

            .card-cont a {
                display: block;
                text-decoration: none;
                width: 80px;
                height: 30px;
                background-color: #D8DDE0;
                color: #fff;
                text-align: center;
                line-height: 30px;
                border-radius: 2px;
                position: absolute;
                right: 10px;
                bottom: 10px
            }

            .row:last-child .card:first-child .card-cont a {
                background-color: #037FDD
            }

            .row:last-child .card:last-child .card-cont a {
                background-color: #F8504C
            }

            @media screen and (max-width: 860px) {
                .card {
                    display: block;
                    float: none;
                    width: 100%;
                    margin-bottom: 10px
                }
                .card+.card {
                    margin-left: 0
                }
                .card-cont .even-date,
                .card-cont .even-info {
                    font-size: 75%
                }
            }
        </style>
    </head>
    <body>
        <%--<main class="ticket-system">
            <div class="top">
                <div class="printer" />
            </div>
            <div class="receipts-wrapper">
                <div class="receipts">
                    <div class="receipt">

                        <div class="route">
                            <h2>NYC</h2>
                        </div>
                        <div class="details">
                            <div class="item">
                                <h3>Message</h3>
                                <span>${data.getMessage()}</span>
                            </div>
                            <div class="item">
                                <h3>Valid date</h3>
                                <span>${data.getValid_fromString()} - ${data.getValid_toString()}</span>
                            </div>
                            <div class="item">
                            </div>

                            <div class="item">
                                <h3>Apply product</h3>
                                <c:if test="${empty dataDis}">Products that are restricted from running promotions according to government regulations will not be displayed if they are included in the selected product list.
                                </c:if>
                                <c:if test="${not empty dataDis}">
                                    <c:forEach items="${dataDis}" var="item">
                                        <span>${item.getProductName()}</span><br>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="receipt qr-code">
                        <div class="description">
                            <h2>Thank you!</h2>
                            <p onclick="closeTab()">Close</p>
                        </div>
                    </div>
                </div>
            </div>
        </main>--%>
        <section class="container">
            <h1>Voucher</h1>
            <div class="row">
                <article class="card fl-left">
                    <section class="date">
                        <time>
                            <span>LOGO</span><span>Company name</span>
                        </time>
                    </section>
                    <section class="card-cont">
                        <small>Company name</small>
                        <h3>${data.getName()}</h3>

                        <div class="even-info">
                            <h4>Apply product</h4>
                            <c:if test="${empty dataDis}">
                                <p>Products that are restricted from running promotions according to government regulations will not be displayed if they are included in the selected product list.</p>

                            </c:if>

                            <c:if test="${not empty dataDis}">
                                <p>
                                    <c:forEach items="${dataDis}" var="item">
                                        <span>${item.getProductName()}</span><br>
                                    </c:forEach>
                                </p>
                            </c:if>
                        </div>

                        <div class="even-info">
                            <h4>Apply Date</h4>
                            <p>${data.getValid_fromString()} - ${data.getValid_toString()}</p>
                        </div>
                        <div class="even-info">
                            <p>
                                ${data.getMessage()}
                            </p>

                        </div>
                        <a onclick="closeTab()">Close</a>
                    </section>
                </article>


            </div>
        </section>
        <script>
            function closeTab() {
                window.close(); // Close the current tab/window
            }
        </script>
    </body>
</html>
