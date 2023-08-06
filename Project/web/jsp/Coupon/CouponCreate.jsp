<%-- Document : CouponCreate Created on : Jun 3, 2023, 10:33:52 AM Author : CAT PHUONG --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Coupon" %>
<jsp:useBean id="now" class="java.util.Date" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>

    <body>
        <div class="row">
            <div class="col-xxl">
                <div class="card mb-4" style="height: 150vh;">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">Create Coupon</h5>
                        <small class="text-muted float-end"></small>
                    </div>
                    <div class="card-body">
                        <form class="row needs-validation" action="CRUD_Coupon?mod=${mode}&id=${id}"
                              method="post" id="submit" novalidate enctype="multipart/form-data">
                            <!--<div id="formSlider" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">-->
                            <!--<div class="carousel-inner">-->

                            <!--<div class="carousel-item active">-->
                            <div class="d-flex align-items-start align-items-sm-center gap-4">
                                <img src="VoucherImg/VoucherDefault.jpg" data-original-title
                                     alt="user-avatar" class="d-block rounded" height="100"
                                     width="100" id="preview" />
                                <div class="button-wrapper">
                                    <label for="upload" class="btn btn-primary me-2 mb-4"
                                           tabindex="0">
                                        <span class="d-none d-sm-block"
                                              onclick="document.getElementById('thumbnail').click()">Upload
                                            new photo</span>
                                        <i class="bx bx-upload d-block d-sm-none"></i>
                                        <input type="file" id="thumbnail" name="filename"
                                               onchange="previewImage();" class="account-file-input"
                                               hidden accept="image/png, image/jpeg" />
                                    </label>
                                    <button type="button" class="btn btn-outline-secondary mb-4"
                                            onclick="document.getElementById('preview').src = 'VoucherImg/VoucherDefault.jpg'">
                                        <i class="bx d-block d-sm-none"></i>
                                        <span class="d-none d-sm-block">Reset</span>
                                    </button>

                                    <!--<p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>-->
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label"
                                       for="basic-default-name">Code<span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10 has-validation">
                                    <input type="text" class="form-control " id="basic-default-name" placeholder="Code" name="name" required onchange="checkCode()" />
                                    <div id="feedback" class="">

                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label"
                                       for="basic-default-message">Message<span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-10">
                                    <input id="basic-default-message" class="form-control"
                                           placeholder="Message" aria-label=""
                                           aria-describedby="basic-icon-default-message2"
                                           name="message" required >
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <label for="html5-date-start" class="col-md-2 col-form-label">Start
                                    Date<span class="text-danger">*</span></label>
                                <div class="col-md-4">
                                    <input class="form-control" type="date" id="html5-date-start"
                                           name="startDate" id="startDate" required
                                           min="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />" />
                                </div>

                                <label for="html5-date-end" class="col-md-2 col-form-label">End
                                    Date<span class="text-danger">*</span></label>
                                <div class="col-md-4">
                                    <input class="form-control" type="date" value=""
                                           id="html5-date-end" name="endDate" id="endDate" required
                                           min="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label"
                                       for="basic-default-value">Value<span
                                        class="text-danger">*</span></label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="basic-default-value"
                                           placeholder="Value" name="value" required
                                           value="${data.getValue()}" />
                                </div>
                                <label class="col-sm-2 col-form-label"
                                       for="basic-default-max-value">Max Value</label>
                                <div class="col-sm-4 ">
                                    <div class="input-group input-group-merge">
                                        <input type="text" class="form-control"
                                               id="basic-default-max-value" placeholder="Max Value"
                                               name="max_value" value="${data.getMax_value()}" />
                                        <span class="input-group-text">VND</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-bill">Bill
                                    Amount Require: </label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                                        <input type="text" class="form-control"
                                               id="basic-default-bill" placeholder="0"
                                               name="bill_condition"
                                               value="${data.getBill_condition()}" />
                                        <span class="input-group-text">VND</span>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 row">

                                <label for="free_check" class="col-form-label col-sm-2 ">Free
                                    available customers: </label>
                                <div class="col-sm-6">
                                    <select class="form-select" id="free_check" name="free_check">
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>


                                <label for="free_check" class="col-form-label col-sm-2 ">Quantity:
                                </label>
                                <div class="col-sm-2">
                                    <input type="number" class="form-control"
                                           id="basic-default-value" placeholder="Quantity"
                                           name="quantity" required min="1" />

                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="col-form-label">Discount product(s)</label>
                                <div class="input-group" style="width:98%">
                                    <select id="content1" class="form-select myselect1" multiple
                                            data-create-option="true" readonly="false"
                                            name="productDiscounted">
                                        <c:forEach items="${dataP}" var="item">
                                            <option value="${item.getProductID()}"
                                                    data-text="${item.getProductName()}">${item.getSmallImg()};${item.getProductName()}</option>
                                        </c:forEach>
                                    </select>
                                    <!-- <button id="cate1" class="btn-sm btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Category
                </button>
                <ul class="dropdown-menu dropdown-menu-end" style="">
                    <li><a class="dropdown-item" onclick="searchAjax1('all')">All</a></li>
                                    
                            </ul> -->

                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label class="col-form-label">Required product(s)</label>

                                <div class="input-group">
                                    <select id="content2" class="form-select myselect2" multiple
                                            readonly="false" name="productRequired">
                                        <c:forEach items="${dataP}" var="item">
                                            <option value="${item.getProductID()}"
                                                    data-text="${item.getProductName()}">${item.getSmallImg()};${item.getProductName()}</option>
                                        </c:forEach>
                                    </select>
                                    <!-- <button id="cate2" class="btn-sm btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Category
                </button>
                <ul class="dropdown-menu dropdown-menu-end" style="">
                    <li><a class="dropdown-item" onclick="searchAjax2('all')">All</a></li>
                                    
                            </ul> -->
                                </div>
                            </div>
                            <div class="row">
                                <a class="col-sm-6 d-flex align-items-center justify-content-center"
                                   href="coupon_admin">
                                    <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
                                    Back to Coupon
                                </a>
                                <a class="col-sm-6 d-flex align-items-center justify-content-center"
                                   data-bs-toggle="modal" data-bs-target="#basicModal">
                                    Submit
                                    <i class="bx bx-chevron-right scaleX-n1-rtl bx-sm"></i>
                                </a>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="mt-3">
                                    <!-- Modal -->
                                    <div class="modal fade" id="basicModal" tabindex="-1"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel1">
                                                        Confirmation</h5>
                                                    <button type="button" class="btn-close"
                                                            data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col mb-3">
                                                            Do you want to make changes?
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button id="closemodal" type="button"
                                                            class="btn btn-outline-secondary"
                                                            data-bs-dismiss="modal">
                                                        Close
                                                    </button>
                                                    <button type="submit" class="btn btn-primary"
                                                            name="check" value="true">Save
                                                        changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
                                        $(document).ready(function () {
                                            $(".myselect1").select2({
                                                allowClear: true,
                                                no_results_text: "Không tìm thấy kết quả :",
                                                scrollAfterSelect: true,
                                                dropdownAutoWidth: false,
                                                templateResult: function (data) {
                                                    var parts = data.text.split(';');
                                                    // You can use jQuery to create custom elements
                                                    var $result = $('<img style="width: 100px;height: 100px;object-fit: fill;" src="uploads/' + parts[0] + '" alt="Image"><span>' + parts[1] + '</span>');
                                                    return $result;
                                                },
                                                templateSelection: function (data) {
                                                    return data.element.getAttribute('data-text');
                                                }

                                            });
                                            $(".myselect2").select2({
                                                allowClear: true,
                                                no_results_text: "Không tìm thấy kết quả :",
                                                scrollAfterSelect: true,
                                                dropdownAutoWidth: false,
                                                templateResult: function (data) {
                                                    var parts = data.text.split(';');
                                                    // You can use jQuery to create custom elements
                                                    var $result = $('<img style="width: 100px;height: 100px;object-fit: fill;" src="uploads/' + parts[0] + '" alt="Image"><span>' + parts[1] + '</span>');
                                                    return $result;
                                                }
                                            });
                                            $("#html5-date-start").on("input", function () {
                                                var minDate = document.getElementById("html5-date-start").value;
                                                document.getElementById("html5-date-end").setAttribute('min', minDate);
                                            });
                                            function checkCode() {
                                                event.preventDefault();
//                                                       alert('hi');
                                                var selectElement = document.getElementById("basic-default-name").value;

                                                $.ajax({
                                                    url: "CheckCodeCoupon",
                                                    data: {code: selectElement},
                                                    type: "POST",
                                                    success: function (data) {
                                                        var response = data;
                                                        var target = document.getElementById('basic-default-name');
//                                                               alert(response.code);
                                                        if (response.code == '00') {
                                                            target.classList.add("is-invalid");
                                                            target.classList.remove("is-valid");
                                                            document.getElementById("feedback").classList.remove("valid-feedback");
                                                            document.getElementById("feedback").classList.add("invalid-feedback");
                                                            document.getElementById("feedback").innerHTML = response.message;
                                                        } else {
                                                            target.classList.add("is-valid");
                                                            target.classList.remove("is-invalid");
                                                            document.getElementById("feedback").classList.add("valid-feedback");
                                                            document.getElementById("feedback").classList.remove("invalid-feedback");
                                                            document.getElementById("feedback").innerHTML = response.message;
                                                        }
                                                    }
                                                });
                                            }
                                            $("#basic-default-name").change(function () {
                                                checkCode();
                                            });
                                        });
        </script>
        <script>
            function searchAjax1(cate) {
                event.preventDefault();
                var selectElement = document.getElementById("myselect1");
                var selectedOptions = Array.from(selectElement.selectedOptions).map(option => option.value);
                $.ajax({
                    url: "SearchCouponCreate",
                    data: {category: cate},
                    type: "POST",
                    success: function (data) {
                        alert("1");
                        var searchList = document.getElementById('content1');
                        searchList.innerHTML = data;
                        var category = document.getElementById('cate1');
                        $('#mySelect1').select2().val(selectedOptions).trigger('change');
                    }
                });
            }
            function searchAjax2(cate) {
                event.preventDefault();
                var selectElement = document.getElementById("myselect2");
                var selectedOptions = Array.from(selectElement.selectedOptions).map(option => option.value);
                $.ajax({
                    url: "SearchCouponCreate",
                    data: {category: cate},
                    type: "POST",
                    success: function (data) {
                        var searchList = document.getElementById('content2');
                        searchList.innerHTML = data;
                        var category = document.getElementById('cate2');
                        $('#mySelect2').select2().val(selectedOptions).trigger('change');
                    }
                });
            }

        </script>
        <script>
            (() => {
                'use strict';
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                const forms = document.querySelectorAll('.needs-validation');
                var modal = document.getElementById("closemodal");
                // Loop over them and prevent submission
                Array.prototype.slice.call(forms).forEach((form) => {
                    form.addEventListener('submit', (event) => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                            modal.click();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            })();
        </script>
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