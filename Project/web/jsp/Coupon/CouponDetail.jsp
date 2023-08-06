<%-- 
    Document   : CouponCreate
    Created on : Jun 3, 2023, 10:33:52 AM
    Author     : CAT PHUONG
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Coupon" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row">
            <div class="col-xxl">
                <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">Coupon Detail</h5>
                        <c:choose>
                            <c:when test="${status == 'Created'}">
                                <a  data-bs-toggle="collapse"
                                    role="button"
                                    aria-expanded="false"
                                    href="#multiCollapseExample1"
                                    aria-controls="multiCollapseExample1"
                                    ><small class="text-muted float-end">${status} by ${admin.getName()} 
                                        <br> on ${data.getCreatedDate()}</small></a>
                                    </c:when>
                                    <c:otherwise>
                                <a  data-bs-toggle="collapse"
                                    role="button"
                                    aria-expanded="false"
                                    href="#multiCollapseExample1"
                                    aria-controls="multiCollapseExample1"
                                    ><small class="text-muted float-end">${status} by ${admin.getName()} 
                                        <br> on ${data.getModifiedDate()}</small></a
                                >

                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-start align-items-sm-center gap-4">
                            <img
                                src="VoucherImg/${data.getAvatar()}" data-original-title
                                alt="user-avatar"
                                class="d-block rounded"
                                height="100"
                                width="100"
                                id="preview"
                                />
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row justify-content-end">
                            <div class="col-6"></div>
                            <div class="collapse multi-collapse col-6 row" id="multiCollapseExample1">
                                <div class="d-grid d-sm-flex p-3 border">
                                    <img
                                        src="avatars/${admin.getAvatar()}"
                                        alt="collapse-image"
                                        height="100"
                                        class="me-4 mb-sm-0 mb-2"
                                        />
                                    <span>Name: ${admin.getName()} <br> Phone: ${admin.getPhone()} <br> Email: ${admin.getEmail()}</span>
                                </div>
                            </div>
                        </div>
                        <form class="row" action="CRUD_Coupon?mod=${mode}&id=${id}" method="post" id="submit"> 
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-name">Code</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" id="basic-default-name" placeholder="Code" name="name" value="${data.getName()}"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-message">Message</label>
                                <div class="col-sm-10">
                                    <input
                                        id="basic-default-message"
                                        class="form-control-plaintext" readonly=""
                                        placeholder="Message"
                                        aria-describedby="basic-icon-default-message2"
                                        name="message" value="${data.getMessage()}"
                                        />
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="html5-date-start" class="col-md-2 col-form-label">Start Date</label>
                                <div class="col-md-4">
                                    <input readonly class="form-control-plaintext" type="date" id="html5-date-start" name="startDate" id="startDate" value="<fmt:formatDate value="${data.getValid_from()}" pattern="yyyy-MM-dd" />"/>
                                </div>

                                <label for="html5-date-end" class="col-md-2 col-form-label">End Date</label>
                                <div class="col-md-4">
                                    <input readonly class="form-control-plaintext" type="date" id="html5-date-end" name="endDate" id="endDate" value="<fmt:formatDate value="${data.getValid_to()}" pattern="yyyy-MM-dd" />"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-value">Value</label>
                                <div class="col-sm-4">
                                    <input
                                        type="text" readonly=""
                                        class="form-control-plaintext"
                                        id="basic-default-value"
                                        placeholder="Value"
                                        name="value" value="${data.getValue()}"
                                        />
                                </div>
                                <label class="col-sm-2 col-form-label" for="basic-default-max-value">Max Value</label>
                                <div class="col-sm-4 ">
                                    <div class="input-group input-group-merge">
                                        <input
                                            type="text"
                                            readonly
                                            class="form-control-plaintext"
                                            id="basic-default-max-value"
                                            placeholder="Max Value"
                                            name="max_value" value="${data.getMax_value()} VND"
                                            />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-bill">Bill Amount Require: </label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                                        <input type="text" readonly class="form-control-plaintext" id="basic-default-bill" placeholder="0" name="bill_condition" value="${data.getBill_condition()} VND"/>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 row">

                                <label for="free_check" class="col-form-label col-sm-2 ">Free available customers: </label>
                                <div class="col-sm-6">
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="basic-default-value"
                                        name="quantity" required value="${data.isFree_check()}" readonly=""
                                        />

                                </div>


                                <label for="free_check" class="col-form-label col-sm-2 ">Quantity: </label>
                                <div class="col-sm-2">
                                    <input
                                        type="number"
                                        class="form-control"
                                        id="basic-default-value"
                                        placeholder="Quantity"
                                        name="quantity" required min="1" value="${data.getQuantity()}" readonly=""
                                        />

                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="form-group col-sm-6" id="product_table">
                                    <label class="control-label">Discount products: </label>
                                    <div class="table-responsive">
                                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                                            <thead>
                                                <tr class="text-dark">
                                                    <th scope="col">Category</th>
                                                    <th scope="col">ProductID</th>
                                                    <th scope="col">Product Name</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${dataDis}" var="item">
                                                    <tr>
                                                        <td>${item.getCategoryName()}</td>
                                                        <td>${item.getProductID()}</td>
                                                        <td>${item.getProductName()}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="form-group col-sm-6" id="product_table">
                                    <label class="control-label">Required products: </label>
                                    <div class="table-responsive">
                                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                                            <thead>
                                                <tr class="text-dark">
                                                    <th scope="col">Category</th>
                                                    <th scope="col">ProductID</th>
                                                    <th scope="col">Product Name</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${dataReq}" var="item">
                                                    <tr>
                                                        <td>${item.getCategoryName()}</td>
                                                        <td>${item.getProductID()}</td>
                                                        <td>${item.getProductName()}</td>
                                                    </tr>
                                                </c:forEach> 
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="text-center">
                                <a href="coupon_admin" class="d-flex align-items-center justify-content-center">
                                    <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
                                    Back to Coupon
                                </a>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h6 class="mb-0">Promoted Customers</h6>
                    </div>
                    <div class="card-body">
                        <c:catch var="datacustomer">
                            <c:if test="${datacustomer == null}">
                                <div>
                                    <p>
                                        No Customer found!
                                    </p>
                                </div>
                            </c:if>
                            <c:if test="${datacustomer != null}">
                                <div class="table-responsive">
                                    <table class="table text-end-center">
                                        <thead class="table-light">
                                            <tr class="text-dark">
                                                <!--<th>CustomerID</th>-->
                                                <th>CustomerName</th>
                                                <!--<th>PhoneNumber</th>-->
                                                <th style="min-width: 250px">Email</th>
                                                <!--<th style="word-break: break-all">Adress</th>-->
                                                <th>Registration Date</th>
                                                <th>DOB</th>
                                                <th>Usage status</th>
                                                <!--<th>Status</th>-->
                                            </tr>
                                        </thead>
                                        <tbody id="content" class="table-border-bottom-0">
                                            <c:forEach items="${datacustomer}" var="item">
                                                <tr>
                                                    <%--<td class="col-md-2">${item.getCustomerID()}</td>--%>
                                                    <td>${item.getCustomer().getCustomerName()}</td>
                                                    <%--<td>${item.getPhoneNumber()}</td>--%>
                                                    <td class="col-md-3" style="word-break: break-all">${item.getCustomer().getEmail()}</td>
                                                    <%--<td class="col-md-3" style="word-break: normal">${item.getAddress()}</td>--%>
                                                    <td>${item.getCustomer().getRegistrationDate()}</td>
                                                    <td class="col-md-4" style="word-break: keep-all">${item.getCustomer().getDOB()}</td>
                                                    <td>${item.getStatus() == 1 ? 'Used':'Not yet'}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </c:catch>


                    </div>
                </div>
            </div>
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
