<%-- 
    Document   : checkout
    Created on : May 31, 2023, 1:16:40 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Product" %>
<%@page import="Model.Coupon" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <base href="http://localhost:9999/SWP391_1/">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
        <link rel="stylesheet" href="Client/fonts/icomoon/style.css">

        <link rel="stylesheet" href="Client/css/bootstrap.min.css">
        <link rel="stylesheet" href="Client/css/magnific-popup.css">
        <link rel="stylesheet" href="Client/css/jquery-ui.css">
        <link rel="stylesheet" href="Client/css/owl.carousel.min.css">
        <link rel="stylesheet" href="Client/css/owl.theme.default.min.css">


        <link rel="stylesheet" href="Client/css/aos.css">
        <link rel="stylesheet" href="Client/css/style.css">
        <!--<link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>-->
        <!-- Custom styles for this template -->
        <link href="Client/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">
        <script src="Client/vnpay_jsp/assests/jquery-1.11.3.min.js"></script>
        <style>
            #closebutton:hover{
                cursor: pointer;
            }
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
                top: 0;
            }
            .modal {
                z-index: 3000; /* Adjust the z-index value as needed */
            }

            .coupon-unavailable {
                background-color: rgba(255, 0, 0, 0.2);
                padding: 10px;
                color: red;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 11px;
                margin-top: 0px;
            }

            .coupon-unavailable i {
                margin-right: 5px;
            }
        </style>

    </head>
    <body>
        <form id="frmCreateOrder" action="vnpayajax" method="post">
            <input type="radio" class="btn-check" name="payment" id="payment1" autocomplete="off" hidden onchange="toggle()" value="cash" />
            <input type="radio" class="btn-check" name="payment" id="payment2" autocomplete="off" hidden onchange="toggle()" value="bank" checked />
            <button type="submit" id="button2" hidden></button>
            <input type="number" id="discount" name="discount" value="0" hidden />
            <input type="number" id="discountId" name="discountId" value="0" hidden />
            <input type="text" hidden name="info" id="info" value="" />
            <input type="number" name="total" id="total" value="${total}" hidden />
        </form>
        <div class="site-wrap">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="bg-light py-3">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 mb-0"><a href="Home">Home</a> <span class="mx-2 mb-0">/</span> <a href="showcart">Cart</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Checkout</strong></div>
                        </div>
                    </div>
                </div>

                <div class="site-section">
                    <div class="container">
                        <!-- Modal3 -->
                        <div class="modal fade" id="model3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modal3" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Voucher</h5>
                                        <i class="icon icon-close2" data-bs-dismiss="modal" aria-label="Close" id="closebutton"></i>
                                    </div>
                                    <div class="input-group mt-3 mb-4">
                                        <button class="btn btn-light text-primary border" id="applybutton" onclick="searchCoupon()">Apply</button>
                                        <input type="text" class="form-control border " name="basic-default-code" id="basic-default-code" placeholder="Enter your promotion code here" value=""/>
                                        <div id="feedback" class=""></div>

                                    </div>
                                <c:forEach var="item" items="${voucher}" varStatus="loop">
                                    <c:if test="${item.getStatus()==2 and item.isFree_check() }">
                                        <fmt:parseNumber var="bill" type="number" value="${item.getBill_condition()}" />
                                        <c:choose>
                                            <c:when test="${bill > total}">
                                                <div class="mb-4" data-aos="fade-up" style="filter: blur(0.2px); margin:0 10px;">
                                                    <div class="block-16 text-left border row" style="display: flex; margin: 10px; height:150px">
                                                        <div class="col-md-4" style="padding-left: 0">
                                                            <img src="VoucherImg/${item.getAvatar()}" data-original-title alt="voucher logo"
                                                                 class="d-block rounded" height="150" width="150" id="preview" />
                                                        </div>
                                                        <div class="col-md-8 block-4-text p-4" style="height:100px">
                                                            <h3>Giảm ${item.getValue()}</h3>
                                                            <c:if test="${item.getBill_condition() ne '0'}">
                                                                <span>Min Bill: ${item.getBill_condition()} VND</span>
                                                            </c:if>
                                                            <c:if test="${item.getMax_value() ne '0'}">
                                                                <span>Max: ${item.getMax_value()} VND</span>
                                                            </c:if>
                                                            <p class="mb-0">End: ${item.getValid_to()}</p>
                                                            <div class="progress" style="height:3px;">
                                                                <div class="progress-bar" role="progressbar" style="width: ${item.getProgress()}%;"
                                                                     aria-valuenow="${item.getProgress()}" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <a class="linkdetail" onclick="voucherinfo('${item.getId()}', '${item.getMessage()}')"
                                                               target="_blank"><i class="bx bx-info-square"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="coupon-unavailable">
                                                        <i class="icon icon-info-circle"></i>
                                                        <span class="message">This coupon is not available</span>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${item.getDiscount_value() == 0}">
                                                <div class="mb-4" data-aos="fade-up" style="filter: blur(0.2px); margin:0 10px;">
                                                    <div class="block-16 text-left border row" style="display: flex; margin: 10px; height:150px">
                                                        <div class="col-md-4" style="padding-left: 0">
                                                            <img src="VoucherImg/${item.getAvatar()}" data-original-title alt="voucher logo"
                                                                 class="d-block rounded" height="150" width="150" id="preview" />
                                                        </div>
                                                        <div class="col-md-8 block-4-text p-4" style="height:100px">
                                                            <h3>Giảm ${item.getValue()}</h3>
                                                            <c:if test="${item.getBill_condition() ne '0'}">
                                                                <span>Min Bill: ${item.getBill_condition()} VND</span>
                                                            </c:if>
                                                            <c:if test="${item.getMax_value() ne '0'}">
                                                                <span>Max: ${item.getMax_value()} VND</span>
                                                            </c:if>
                                                            <p class="mb-0">End: ${item.getValid_to()}</p>
                                                            <div class="progress" style="height:3px;">
                                                                <div class="progress-bar" role="progressbar" style="width: ${item.getProgress()}%;"
                                                                     aria-valuenow="${item.getProgress()}" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <a class="linkdetail" onclick="voucherinfo('${item.getId()}', '${item.getMessage()}')"
                                                               target="_blank"><i class="bx bx-info-square"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="coupon-unavailable">
                                                        <i class="icon icon-info-circle"></i>
                                                        <span class="message">This coupon is not available</span>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="mb-4" data-aos="fade-up" style="filter: blur(0.2px); margin:0 10px;">
                                                    <div class="block-16 text-left border row" style="display: flex; margin: 10px; height:150px">
                                                        <div class="col-md-4" style="padding-left: 0">
                                                            <img src="VoucherImg/${item.getAvatar()}" data-original-title alt="voucher logo"
                                                                 class="d-block rounded" height="150" width="150" id="preview" />
                                                        </div>
                                                        <div class="col-md-8 block-4-text p-4" style="height:100px">
                                                            <h3>Giảm ${item.getValue()}</h3>
                                                            <p class="mb-0">
                                                                <c:if test="${item.getBill_condition() ne '0'}">
                                                                    <span>Min Bill: ${item.getBill_condition()} VND</span>
                                                                </c:if>
                                                            </p>
                                                            <p class="mb-0">
                                                                <c:if test="${item.getMax_value() ne '0'}">
                                                                    <span>Max: ${item.getMax_value()} VND</span>
                                                                </c:if>
                                                            </p>
                                                            <p class="mb-0">End: ${item.getValid_to()}</p>
                                                            <div class="progress" style="height:3px;">
                                                                <div class="progress-bar" role="progressbar" style="width: ${item.getProgress()}%;"
                                                                     aria-valuenow="${item.getProgress()}" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                            <a class="linkdetail" onclick="voucherinfo('${item.getId()}', '${item.getMessage()}')"
                                                               target="_blank"><i class="bx bx-info-square"></i></a>
                                                        </div>
                                                        <input style="position: absolute; right: 20px;bottom:50%" type="radio" class="btn-check"
                                                               name="voucher" id="voucher" value="${item.getDiscount_value()};${item.getId()}" />
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </c:forEach>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="cancel()">Cancel</button>
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="discount()">Confirm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="bg-light py-5">
                    <div class="container">

                        <div class="row">
                            <div class="col-xl-8 col-lg-8 mb-4">
                                <div class="card mb-4 border shadow-0">
                                    <div class="p-4 d-flex justify-content-between">
                                        <div class="">
                                            <span class="icon icon-edit_location"></span>Address
                                            <p class="mb-0 text-wrap "></p>
                                        </div>
                                        <!--                                            <div class="d-flex align-items-center justify-content-center flex-column flex-md-row">
                                                                                        <a href="#" class="btn btn-outline-primary me-0 me-md-2 mb-2 mb-md-0 w-100">Register</a>
                                                                                        <a href="#" class="btn btn-primary shadow-0 text-nowrap w-100">Sign in</a>
                                                                                    </div>-->
                                    </div>
                                </div>

                                <!-- Checkout -->
                                <div class="card shadow-0 border">
                                    <form class="needs-validation" id="form_test">
                                        <div class="p-4">

                                            <h5 class="card-title mb-3">Info</h5>
                                            <div class="row">
                                                <div class="col-6 mb-3">
                                                    <p class="mb-0">Name</p>
                                                    <div class="form-outline" style="border: 1px solid #ced4da;">
                                                        <input type="text" id="typeName" value="${cusName}" placeholder="Name" class="form-control" required/>
                                                    </div>
                                                </div>

                                                <div class="col-6 mb-3">
                                                    <p class="mb-0">Phone</p>
                                                    <div class="form-outline" style="border: 1px solid #ced4da;">
                                                        <input type="tel" id="typePhone" value="${cusPhone}" class="form-control" pattern="0\d{9}" required title="Please enter a valid phone number starting with 0"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 mb-3">
                                                    <p class="mb-0">Address</p>
                                                    <div class="form-outline" style="border: 1px solid #ced4da;">
                                                        <input type="text" id="typeAddress" value="${cusAddress}" placeholder="Address" class="form-control" required />
                                                    </div>
                                                </div>
                                            </div>

                                            <hr class="my-4" />

                                            <h5 class="card-title mb-3">Payment</h5>

                                            <div class="row mb-3">
                                                <div class="col-lg-4 mb-3">
                                                    <!-- Default checked radio -->
                                                    <div class="form-check h-100 border rounded-3">
                                                        <div class="p-3">
                                                            <input class="form-check-input" type="radio" id="btnradio2" name="test" checked onchange="toggle()"/>
                                                            <label class="form-check-label" for="flexRadioDefault1">
                                                                VNPay <br />
                                                                <small class="text-muted">Fast and secure</small>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 mb-3">
                                                    <!-- Default radio -->
                                                    <div class="form-check h-100 border rounded-3">
                                                        <div class="p-3">
                                                            <input class="form-check-input" type="radio" id="btnradio1" name="test" onchange="toggle()"/>
                                                            <label class="form-check-label" for="flexRadioDefault2">
                                                                On delivery <br />
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="float-end">
                                                <button class="btn btn-light border">Cancel</button>
                                                <button type="submit" class="btn btn-success shadow-0 border" id="button1">Order</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <!-- Checkout -->
                            </div>
                            <div class="col-xl-4 col-lg-4 d-flex justify-content-center justify-content-lg-end">
                                <div class="ms-lg-4 mt-4 mt-lg-0" style="max-width: 320px;">
                                    <h6 class="mb-3">Summary</h6>
                                    <div class="d-flex justify-content-between">
                                        <p class="mb-2">Total price:</p>
                                        <p class="mb-2"><fmt:formatNumber value="${total}" pattern="#,##0" /> VNÐ</p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p class="mb-2">Discount:</p>
                                        <p class="mb-2 text-danger" id="txtDis">- 0.0</p>
                                    </div>
                                    <hr />
                                    <div class="d-flex justify-content-between">
                                        <p class="mb-2">Total price (VAT inc):</p>
                                        <p class="mb-2 fw-bold" id="lasttotal"><fmt:formatNumber value="${total/100*110}" pattern="#,##0" /> VNÐ</p>
                                    </div>
                                    <div class="input-group mt-3 mb-4">
                                        <input type="text" class="form-control border" name="" placeholder="Promo code" readonly/>
                                        <button class="btn btn-light text-primary border" data-bs-toggle="modal" data-bs-target="#model3">Choose</button>
                                    </div>

                                    <hr />
                                    <h6 class="text-dark my-4">Items in cart</h6>
                                    <c:forEach items="${product}" var="i">

                                        <div class="d-flex align-items-center mb-4">

                                            <div class="me-3 position-relative">
                                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill badge-secondary">
                                                    ${i.getQuantity()}
                                                </span>
                                                <img src="uploads/${i.getProduct().getSmallImg()}" style="height: 96px; width: 96x;" class="img-sm rounded border" />
                                            </div>
                                            <div class="">
                                                <a href="#" class="nav-link">
                                                    ${i.getProduct().getProductName()}
                                                </a>
                                                <div class="price text-muted">Total: <fmt:formatNumber value="${i.getProduct().getProductPrice() * i.getQuantity()}" pattern="#,##0" /> VNÐ</div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
            </div>
            <!--</form>-->



            <jsp:include page="Footer.jsp"></jsp:include>
            </div>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

            <!-- Function for model 3-->
            <script>

                                                                function searchCoupon() {
                                                                    event.preventDefault();
//                                                        alert('hi');
                                                                    var selectElement = document.getElementById("basic-default-code").value;
                                                                    var coupon = `${voucherjson}`;
                                                                    var promote = `${promotejson}`;
                                                                    var c = JSON.parse(coupon);
                                                                    var p = JSON.parse(promote);
                                                                    var total = `${total}`
//                                                        alert(c);
//                                                        console.log(c);
                                                                    $.ajax({
                                                                        url: "ApplyCouponClient",
                                                                        data: {code: selectElement, 'coupon[]': coupon, 'promote[]': promote, total: total},
                                                                        type: "POST",
                                                                        success: function (data) {
//                                                                alert('yay');
                                                                            var response = data;
                                                                            var target = document.getElementById('basic-default-code');
//                                                                alert(response.code + ';' + response.message);
                                                                            if (response.code == '00') {
                                                                                target.classList.add("is-invalid");
                                                                                target.classList.remove("is-valid");
                                                                                document.getElementById("feedback").classList.remove("valid-feedback");
                                                                                document.getElementById("feedback").classList.add("invalid-feedback");
                                                                                document.getElementById("feedback").innerHTML = response.message;

                                                                            } else if (response.code == '01') {
                                                                                var discount = response.discount;
                                                                                var parts = discount.split(";");
//                                                                    alert(discount);
                                                                                document.getElementById("discount").value = parts[0];
                                                                                document.getElementById("discountId").value = parts[1];
                                                                                document.getElementById("txtDis").innerHTML = '-' + parts[0] + " VNÐ";

                                                                                document.getElementById("lasttotal").innerHTML = ((document.getElementById("total").value - parseFloat(parts[0])) / 100 * 110) + ' VNÐ';

                                                                                target.classList.add("is-valid");
                                                                                target.classList.remove("is-invalid");
                                                                                document.getElementById("feedback").classList.add("valid-feedback");
                                                                                document.getElementById("feedback").classList.remove("invalid-feedback");
                                                                                document.getElementById("feedback").innerHTML = response.message;
                                                                            }
                                                                        }
                                                                    });
                                                                }
                                                                function discount() {
                                                                    event.preventDefault();
                                                                    var target = document.getElementById('basic-default-code');
                                                                    target.classList.remove("is-invalid");
                                                                    target.classList.remove("is-valid");
                                                                    document.getElementById("feedback").classList.remove("valid-feedback");
                                                                    document.getElementById("feedback").classList.remove("invalid-feedback");
                                                                    document.getElementById("feedback").innerHTML = "";
                                                                    var discount = document.querySelector('input[name="voucher"]:checked').value;
                                                                    var parts = discount.split(";");
                                                                    //                document.getElementById("txtDiscount").innerHTML = "<span style=\"text-align: left;\">Discount:</span><span style=\"text-align: right;\" >-" + parts[0] + "</span>";
                                                                    document.getElementById("discount").value = parts[0];
                                                                    document.getElementById("discountId").value = parts[1];
                                                                    document.getElementById("txtDis").innerHTML = '-' + parts[0] + " VNÐ";

                                                                    document.getElementById("lasttotal").innerHTML = ((document.getElementById("total").value - parseFloat(parts[0])) / 100 * 110) + ' VNÐ';
                                                                }

                                                                function cancel() {
                                                                    event.preventDefault();
                                                                    //                alert('hi');
                                                                    var target = document.getElementById('basic-default-code');
                                                                    target.classList.remove("is-invalid");
                                                                    target.classList.remove("is-valid");
                                                                    document.getElementById("feedback").classList.remove("valid-feedback");
                                                                    document.getElementById("feedback").classList.remove("invalid-feedback");
                                                                    document.getElementById("feedback").innerHTML = "";
                                                                    var discount = document.querySelector('input[name="voucher"]:checked');
                                                                    if (discount != null) {
                                                                        discount.checked = false;
                                                                    }
                                                                    document.getElementById("discount").value = 0;
                                                                    document.getElementById("discountId").value = 0;
                                                                    document.getElementById("txtDis").innerHTML = '-0.0' + " VNÐ";
                                                                    document.getElementById("lasttotal").innerHTML = ((document.getElementById("total").value) / 100 * 110) + ' VNÐ';
                                                                }
                                                                $(document).ready(function () {
                                                                    document.getElementById("form_test").addEventListener('submit', function () {
                                                                        // Prevent the default form submission behavior
                                                                        event.preventDefault();

                                                                        // Perform any additional processing here, e.g., data validation, AJAX requests, etc.
                                                                        var name = document.getElementById("typeName").value;
                                                                        var phone = document.getElementById("typePhone").value;
                                                                        var address = document.getElementById("typeAddress").value;
                                                                        document.getElementById("info").value = name + ';' + phone + ';' + address;
                                                                        if (!(name == "" || phone == "" || address == "")) {
                                                                            document.getElementById('button2').click();
                                                                        }
                                                                    });
                                                                });
        </script>
        <!-- /Modal3 -->
        <script>
            function voucherinfo(id, name)
            {
                event.preventDefault();
                var parts = name.split(" ");
                var newName = "";
                for (var i = 0; i < parts.length; i++) {
                    if (parts[i].includes("%")) {
                        continue;
                    }
                    newName += parts[i] + "-";
                }
                newName += id;
                window.open('voucher/detail/' + newName, "_blank");
            }
            function toggle()
            {
                event.preventDefault();
                var element1 = document.getElementById('payment1');
                var element2 = document.getElementById('payment2');
                if (document.getElementById("btnradio1").checked) {
                    element1.checked = true;
                } else {
                    element2.checked = true;
                }
            }
        </script>
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                //                alert("hi");
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>
        <script>
            (() => {
                'use strict';
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                const forms = document.querySelectorAll('.needs-validation');
                // Loop over them and prevent submission
                Array.prototype.slice.call(forms).forEach((form) => {
                    form.addEventListener('submit', (event) => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            })();
            window.addEventListener('DOMContentLoaded', function () {
                // Lấy URL tùy chỉnh mới từ người dùng hoặc bất kỳ nguồn nào bạn muốn
                const newCustomURL = "http://localhost:9999/SWP391_1/checkout";

                // Thay đổi URL hiển thị bằng cách sử dụng History API
                history.replaceState({}, '', newCustomURL);
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
