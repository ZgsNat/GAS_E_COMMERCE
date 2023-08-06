<%-- 
    Document   : login
    Created on : Jun 2, 2023, 3:31:18 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Login 10</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="Client/Login/css/style.css">


    </head>
    <body class="img js-fullheight" style="background-image: url(Client/Login/images/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4" style="">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Have an account?</h3>

                            <form action="login" method="post" class="signin-form">
                                <div class="form-group">
                                    <input type="text" name="Username" class="form-control" placeholder="Username" required value="${Username}">
                                </div>
                                <div class="form-group">
                                    <input id="password-field" name="Password" type="password" class="form-control" placeholder="Password" value="${Password}" required>
                                    <span toggle="#password-field" class=""></span>

                                    <c:if test="${Wrong!=null}">
                                        <br>
                                        <p class="w-100 text-center" style="color: white">Wrong Password or Username! Please check again!</p>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <label class="checkbox-wrap checkbox-primary">Remember Me
                                            <input type="checkbox" checked name="Mod">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="resetpassword" style="color: #fff">Forgot Password</a>
                                            <c:if test="${status=='resetFailed'}">
                                                <br>
                                                <p style="text-align: center; color: red">Reset Failed</p>
                                            </c:if>
                                                <c:if test="${status=='resetSuccess'}">
                                                    <br>
                                                <p style="text-align: center; color: red">Reset Success</p>
                                            </c:if>
                                    </div>
                                </div>
                            </form>
                            <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                            <div class="social d-flex text-center">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:9999/SWP391_1/LoginGoogle&response_type=code&client_id=920769635690-g524e3tiiijg5prsk110226penehm2jc.apps.googleusercontent.com&approval_prompt=force" class="px-2 py-2 mr-md-1 rounded"><span class="icon-logo-google mr-0"></span> Google</a>
                            </div>
                            <br>
                            <p class="w-100 text-center">&mdash; <a href="register">Don't have an account? Sign up now!</a> &mdash;</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="Client/Login/js/jquery.min.js"></script>
        <script src="Client/Login/js/popper.js"></script>
        <script src="Client/Login/js/bootstrap.min.js"></script>
        <script src="Client/Login/js/main.js"></script>

    </body>
</html>
