<%-- 
    Document   : TEst
    Created on : Jun 2, 2023, 2:25:03 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gas Vietnam - Info</title>
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

            .inf-content{
                border:1px solid #DDDDDD;
                -webkit-border-radius:10px;
                -moz-border-radius:10px;
                border-radius:10px;
                box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
            }
            .circle-image {
                width: 100%;
                height: 0;
                padding-bottom: 100%;
                position: relative;
                border-radius: 50%;
                overflow: hidden;
            }
            .circle-image img {

                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

        </style>
    </head>
    <body>
        <div class="site-wrap">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="bg-light py-3">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 mb-0"><a href="Home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Information</strong></div>
                        </div>
                    </div>
                </div>
                <form action="info" method="post" enctype="multipart/form-data">
                    <div class="container bootstrap snippets bootdey">
                        <div class="panel-body inf-content">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="circle-image">
                                    <%--<c:if test="${isGG == true}">
                                        <img id="preview" alt="" style="height: 100%" class="rounded-circle img-thumbnail" src="${sessionScope.Customer.getAvatar()}" data-original-title>  
                                    </c:if>
                                    <c:if test="${isGG == false || isGG == null}">
                                        <img id="preview" alt="" style="height: 100%"  class="rounded-circle img-thumbnail" src="avatars/${sessionScope.Customer.getAvatar()}" data-original-title>  
                                    </c:if>--%>
                                    <c:if test="${not fn:contains(sessionScope.Customer.getAvatar(), 'jpg')}">
                                        <img id="preview" alt="" style="height: 100%" class="img-circle img-thumbnail" src="${sessionScope.Customer.getAvatar()}" data-original-title>  
                                    </c:if>
                                    <c:if test="${fn:contains(sessionScope.Customer.getAvatar(), 'jpg')}">
                                        <img id="preview" alt="" style="height: 100%"  class="img-circle img-thumbnail" src="avatars/${sessionScope.Customer.getAvatar()}" data-original-title>  
                                    </c:if>
                                </div>
                                <input type="file" id="thumbnail" name="filename" onchange="previewImage();">
                            </div>
                            <div class="col-md-8">
                                <strong>Information</strong><br>
                                <div class="table-responsive">
                                    <table class="table table-user-information">
                                        <tbody>
                                            <tr>        
                                                <td>
                                                    <strong>
                                                        <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                                        Full name                                             
                                                    </strong>
                                                </td>
                                                <td class="text-primary">
                                                    <input name="fullname" class="text-primary" style="width: 100%" type="text" value="${sessionScope.Customer.getCustomerName()}">      
                                                </td>
                                            </tr>
                                            <tr>    
                                                <td>
                                                    <strong>
                                                        <span class="glyphicon glyphicon-user  text-primary"></span>    
                                                        Phone number                                               
                                                    </strong>
                                                </td>
                                                <td class="text-primary">
                                                    <input name="phonenumber" class="text-primary" style="width: 100%" type="text" value="${sessionScope.Customer.getPhoneNumber()}">      

                                                </td>
                                            </tr>
                                            <tr>        
                                                <td>
                                                    <strong>
                                                        <span class="glyphicon glyphicon-cloud text-primary"></span>  
                                                        Email                                                
                                                    </strong>
                                                </td>
                                                <td class="text-primary">
                                                    <input name="email" class="text-primary" style="width: 100%" type="text" value="${sessionScope.Customer.getEmail()}" readonly>       
                                                </td>
                                            </tr>

                                            <tr>        
                                                <td>
                                                    <strong>
                                                        <span class="glyphicon glyphicon-bookmark text-primary"></span> 
                                                        Address                                                
                                                    </strong>
                                                </td>
                                                <td class="text-primary">
                                                    <input name="adress" class="text-primary" style="width: 100%" type="text" value="${sessionScope.Customer.getAddress()}">       

                                                </td>
                                            </tr>
                                            <tr>        
                                                <td>
                                                    <strong>
                                                        <span class="glyphicon glyphicon-eye-open text-primary"></span> 
                                                        Date of birth                                               
                                                    </strong>
                                                </td>
                                                <td class="text-primary">
                                                    <input name="dob" class="text-primary" style="width: 100%" type="text" value="${sessionScope.Customer.getDOB()}">       
                                                </td>
                                            </tr>
                                            <tr>        
                                                <td>
                                                    <strong>
                                                        <span class="glyphicon glyphicon-envelope text-primary"></span> 
                                                        Registration Date                                                
                                                    </strong>
                                                </td>
                                                <td class="text-primary">
                                                    <input name="date" class="text-primary" style="width: 100%" type="datetime" value="${sessionScope.Customer.getRegistrationDate()}" readonly>       

                                                </td>
                                            </tr>                                  
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="col-md-12 text-center">
                        <button type="submit" class="btn btn-primary">Update</button>
                        <a href="Home" class="btn btn-warning button">Back</a>
                        <!--<button type="button" class="btn btn-warning">Cancel</button>-->
                    </div>                
                    <br>
                </div>
            </form>

            <jsp:include page="Footer.jsp"></jsp:include>
            </div>
            <script>
                
                function previewImage() {
                    var preview = document.getElementById('preview');
                    var file = document.getElementById('thumbnail').files[0];
                    if (file.size > 2 * 1024 * 1024) {
                        alert("Dung lượng ảnh vượt quá giới hạn cho phép!");
                        document.getElementById('thumbnail').value = "";
                    } else {
                        var reader = new FileReader();

                        reader.onloadend = function () {
                            preview.src = reader.result;
                        };

                        if (file) {
                            reader.readAsDataURL(file);
                        } else {
                            preview.src = "";
                        }
                    }
                }

                tinymce.init({
                    selector: 'textarea',
                    plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
                    toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
                    images_upload_url: '/WebApplication1/UploadImageServlet',
                    images_upload_handler: function (blobInfo, success, failure) {
                        var xhr, formData;
                        xhr = new XMLHttpRequest();
                        xhr.withCredentials = false;
                        xhr.open('POST', '/SWP391_1/UploadImageTinyMCE');
                        xhr.onload = function () {
                            var json;

                            if (xhr.status != 200) {
                                failure('HTTP Error: ' + xhr.status);
                                return;
                            }

                            json = JSON.parse(xhr.responseText);

                            if (!json || typeof json.location != 'string') {
                                failure('Invalid JSON: ' + xhr.responseText);
                                return;
                            }

                            success(json.location);
                        };
                        formData = new FormData();
                        formData.append('file', blobInfo.blob(), blobInfo.filename());
                        xhr.send(formData);
                    }
                });
        </script>

    </body>
</html>
