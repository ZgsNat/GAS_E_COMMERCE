<%-- 
    Document   : Register
    Created on : May 18, 2023, 10:29:03 AM
    Author     : Peanut
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="Client/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="Client/css_register/style.css">
    </head>
    <body style="background-image: url(Client/Login/images/bg.jpg);">

        <div class="main">

            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <form action="register" method="POST" id="signup-form" class="signup-form">
                            <h2 class="form-title">Create account</h2>
                            <div class="form-group">
                                <input type="text" class="form-input" name="name" id="name" placeholder="Your Name" />
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-input" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-input" name="password" id="password" placeholder="Password" pattern="^(?=.*\d)[\s\S]{8,16}$"/>
                                <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-input" name="re_password" id="re_password" placeholder="Repeat your password (8-16 characters)"  />

                                <span>${passwordError}</span>

                            </div>

                            <div class="form-group">
                                <input type="tel" class="form-input" name="phone" id="name" placeholder="Your Phone Number"/>
                            </div>
                            <div class="form-group">
                                <input type="date" class="form-input" name="dob" id="name" pattern="\d{2}/\d{2}/\d{4}" placeholder="dd/mm/yyyy"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-input" name="address" id="name" placeholder="Your Address"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required/>
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submitRegister" id="submit" class="form-submit" value="Sign up" />
                            </div>
                        </form>
                        <p class="loginhere">
                            Have already an account ? <a href="logincookie" class="loginhere-link">Login here</a>
                        </p>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
        <script src="Client/vendor/jquery/jquery.min.js"></script>
        <script src="Client/js_register/main.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
