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
        <style>
            .form-gap {
                padding-top: 70px;
            }
        </style>

    </head>
    <body class="img js-fullheight" style="background-image: url(Client/Login/images/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4" style="">
                        <div class="login-wrap p-0">

                            <form action="resetpassword" method="post" class="signin-form">
                                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
                                <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
                                <div class="form-gap"></div>

                                <h3 style="text-align: center"><i class="fa fa-lock fa-4x" ></i></h3>
                                <h2 class="text-center" style="">Forgot Password?</h2>
                                <div style="text-align: center">
                                    <p>To receive a link to reset your password, please enter your email or Phone number!</p>  
                                </div>

                                <div class="panel-body">



                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                            <input id="email" name="email" placeholder="email address" class="form-control"  type="email">
                                        </div>
                                        <p>OR</p>
                                        <input id="email" name="phone" placeholder="phone number" class="form-control"  type="email">
                                    </div>
                                    <div class="form-group">
                                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                    </div>

                                    <input type="hidden" class="hide" name="token" id="token" value=""> 


                                </div>
                            </form>
                            <div>
                                <p class="w-100 text-center">&mdash; <a href="logincookie" style="color: white">Back to Login</a> &mdash;</p>
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
