<%-- 
    Document   : cart
    Created on : May 31, 2023, 1:15:23 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <base href="http://localhost:9999/SWP391_1/">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="Client/fonts/icomoon/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!--<link rel="stylesheet" href="Client/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="Client/css/magnific-popup.css">
        <link rel="stylesheet" href="Client/css/jquery-ui.css">
        <link rel="stylesheet" href="Client/css/owl.carousel.min.css">
        <link rel="stylesheet" href="Client/css/owl.theme.default.min.css">


        <link rel="stylesheet" href="Client/css/aos.css">

        <link rel="stylesheet" href="Client/css/style.css">
        <!-- Helpers -->
        <script src="../assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="../assets/js/config.js"></script>
    </head>
    <body>

        <div class="site-wrap">


            <jsp:include page="Header.jsp"></jsp:include>
                <div class="position-fixed top-0 start-0 p-3" style="z-index: 2000">
                    <div id="oneToast" class="bs-toast toast fade hide bg-danger text-white" role="alert" aria-live="assertive" aria-atomic="true" >
                        <div class="d-flex">
                            <div class="toast-body">
                            ${errormessage}
                        </div>
                        <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <div class="bg-light py-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 mb-0"><a href="Home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
                    </div>
                </div>
            </div>

            <div class="site-section">
                <div class="container">
                    <div class="row mb-5">
                        <form id="cart" class="col-md-12" action="checkout" method="get">
                            <div class="site-blocks-table">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" onchange="toggle2(this)" />
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-total">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!--                                            <tr>
                                                                                        <td class="product-thumbnail">
                                                                                            <img src="images/cloth_1.jpg" alt="Image" class="img-fluid">
                                                                                        </td>
                                                                                        <td class="product-name">
                                                                                            <h2 class="h5 text-black">Top Up T-Shirt</h2>
                                                                                        </td>
                                                                                        <td>$49.00</td>
                                                                                        <td>
                                                                                            <div class="input-group mb-3" style="max-width: 120px;">
                                                                                                <div class="input-group-prepend">
                                                                                                    <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                                                                                                </div>
                                                                                                <input type="text" class="form-control text-center" value="3" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                                                                <div class="input-group-append">
                                                                                                    <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                                                                                                </div>
                                                                                            </div>
                                        
                                                                                        </td>
                                                                                        <td>$49.00</td>
                                                                                        <td><a href="#" class="btn btn-primary btn-sm">X</a></td>
                                                                                    </tr>-->
                                        <c:set var="o" value="${requestScope.cart}"></c:set>
                                        <c:forEach items="${o.getItems()}" var="i">

                                            <tr>
                                                <td><input type="checkbox" name="checkoutitem" value="${i.getProduct().getProductID()}; ${i.getQuantity()}"/></td>
                                                <td class="product-thumbnail">
                                                    <img src="uploads/${i.getProduct().getSmallImg()}" alt="Image" class="img-fluid">
                                                </td>
                                                <td class="product-name">
                                                    <h2 class="h5 text-black">${i.getProduct().getProductName()}</h2>
                                                </td>
                                                <td><fmt:formatNumber value="${i.getPrice()}" pattern="#,##0" /> VNÐ</td>
                                                <td>
                                                    <a class="btn btn-outline-primary" onclick="updateCart(-1, '${i.getProduct().getProductID()}')">&minus;</a>
                                                    <span id="quantity_${i.getProduct().getProductID()}">${i.getQuantity()}</span>

                                                    <a class="btn btn-outline-primary" onclick="updateCart(1, '${i.getProduct().getProductID()}')">&plus;</a>
                                                    <!--                                                <div class="input-group mb-3" style="max-width: 120px;">
                                                                                                        <div class="input-group-prepend">
                                                                                                            <a href="processcart?id=${i.getProduct().getProductID()}&num=-1" class="btn btn-outline-primary js-btn-minus" type="button">&minus;</a>
                                                                                                        </div>
                                                                                                        <input type="text" class="form-control text-center" value="${i.getQuantity()}" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                                                                        <div class="input-group-append">
                                                                                                            <a href="processcart?id=${i.getProduct().getProductID()}&num=1" class="btn btn-outline-primary js-btn-plus" type="button">&plus;</a>
                                                                                                        </div>
                                                                                                    </div>-->

                                                </td>
                                                <td><span id="total_${i.getProduct().getProductID()}"><fmt:formatNumber value="${i.getPrice() * i.getQuantity()}" pattern="#,##0" /> VNÐ</span></td>
                                                <td><a href="processcart2?id=${i.getProduct().getProductID()}" class="btn btn-primary btn-sm">X</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${overproduct!=null}">
                                    <p>Cart cannot be added because there are too many items available</p>
                                </c:if>
                            </div>
                        </form>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-5">
<!--                                <div class="col-md-6 mb-3 mb-md-0">
                                    <button class="btn btn-primary btn-sm btn-block">Update Cart</button>
                                </div>-->
                                <div class="col-md-6">
                                    <form action="shop" method="get">
                                        <button class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</button> 
                                    </form> 
                                </div>
                            </div>
<!--                            <div class="row">
                                <div class="col-md-12">
                                    <label class="text-black h4" for="coupon">Coupon</label>
                                    <p>Enter your coupon code if you have one.</p>
                                </div>
                                <div class="col-md-8 mb-3 mb-md-0">
                                    <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-primary btn-sm">Apply Coupon</button>
                                </div>
                            </div>-->
                        </div>
                        <div class="col-md-6 pl-5">
                            <div class="row justify-content-end">
                                <div class="col-md-7">
                                    <div class="row">
                                        <div class="col-md-12 text-right border-bottom mb-5">
                                            <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <!--                                        <div class="col-md-6">
                                                                                    <span class="text-black">Subtotal</span>
                                                                                </div>
                                                                                <div class="col-md-6 text-right">
                                                                                    <strong class="text-black">$230.00</strong>
                                                                                </div>-->
                                    </div>
                                    <div class="row mb-5">
                                        <div class="col-md-6">
                                            <span class="text-black">Total</span>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black" id="totalmoney"><fmt:formatNumber value="${o.getTotalMoney()}" pattern="#,##0" /> VNÐ</strong>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <button class="btn btn-primary btn-lg py-3 btn-block" onclick="checkout()">Proceed To Checkout</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="Footer.jsp"></jsp:include>
            </div>

            <script>
                function showToast() {
                    alert('hi');

                }
            </script>
            <script>
                function updateCart(num, id) {
                    //                    alert("fuck");
                    var productId = id;
                    var num = num;
                    //                var money = document.getElementById("totalmoney").innerHTML;
                    var check = convertToUnformattedNumber(document.getElementById("totalmoney").innerHTML);
                    var total = parseInt(check);
                    $.ajax({
                        type: "GET",
                        url: "processcart",
                        data: {id: productId, num: num},
                        dataType: 'JSON',
                        success: function (x) {
                            // Cập nhật số lượng sản phẩm trên giao diện
                            document.getElementById("quantity_" + x.id).innerHTML = x.quantity;
                            //convert number
                            const formattedNumber = document.getElementById("total_" + x.id).innerHTML;
                            const unformattedNumber = convertToUnformattedNumber(formattedNumber);
                            //
                            document.getElementById("total_" + x.id).innerHTML = formatPriceWithCurrency(x.total);
                            total += parseInt(x.moneychange);
                            document.getElementById("totalmoney").innerHTML = formatPriceWithCurrency(total);
                            if (x.alertMess != null) {
                                alert(x.alertMess);
                            }
                        },
                        error: function (xhr, status, error) {
                            // Xử lý lỗi nếu có
                            alert('fail');
                        }
                    });
                }
                //            });
            </script>
            <script>
                function convertToUnformattedNumber(formattedNumber) {
                    // Remove commas from the string
                    const unformattedNumber = formattedNumber.replace(/,/g, '');
                    // Remove the " VNĐ" text from the string
                    const unformattedNumberWithoutCurrency = unformattedNumber.replace(' VNĐ', '');
                    // Convert the resulting string to a number
                    return parseInt(unformattedNumberWithoutCurrency);
                }
            </script>
            <script>
                function formatPriceWithCurrency(price) {
                    // Convert price to a number if it's a string
                    const numericPrice = typeof price === 'string' ? parseInt(price) : price;

                    // Check if the numericPrice is a valid number
                    if (!isNaN(numericPrice)) {
                        // Convert numericPrice to comma-delimited string with currency symbol
                        const formattedPrice = numericPrice.toLocaleString() + ' VNĐ';
                        return formattedPrice;
                    } else {
                        // Return the original value if it's not a valid number
                        return price;
                    }
                }
            </script>
            <script>

                function checkout() {
                    document.getElementById("cart").submit();
                }
            </script>

            <script language="JavaScript">
                function toggle2(source) {
                    var checkboxes = document.getElementsByName("checkoutitem");
                    for (var i = 0, n = checkboxes.length; i < n; i++) {
                        checkboxes[i].checked = source.checked;
                    }
                }

            </script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                $(document).ready(function () {
                    //                alert("hi");
                    var message = `${errormessage}`;
                    if (message.length != 0) {
//                                                        document.getElementById("liveToast").classList.remove("hide");
//                                                        document.getElementById("liveToast").classList.add("show");
                        var toastElement = document.getElementById('oneToast');

                        // Create a new Toast instance from Bootstrap
                        var toast = new bootstrap.Toast(toastElement);

                        // Show the toast
                        toast.show();
                    }
                });
                window.addEventListener('DOMContentLoaded', function () {
                    // Lấy URL tùy chỉnh mới từ người dùng hoặc bất kỳ nguồn nào bạn muốn
                    const newCustomURL = "http://localhost:9999/SWP391_1/showcart";

                    // Thay đổi URL hiển thị bằng cách sử dụng History API
                    history.replaceState({}, '', newCustomURL);
                });
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