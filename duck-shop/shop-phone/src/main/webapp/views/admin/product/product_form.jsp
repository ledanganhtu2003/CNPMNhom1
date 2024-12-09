<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="container">
            <form action="/admin-product" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col">
                        <div class="page-content">
                            <div class="ace-settings-container" id="ace-settings-container">
                            </div>

                            <div style="font-family: Arial, Helvetica, sans-serif; font-size :2rem" class="page-header">
                                PRODUCT
                            </div><!-- /.page-header -->
                            <div class="form__wapper form__wapper-product-add">
                                <c:if test="${not empty messageResponse}">
                                    <div class="alert alert-${alert}">
                                            ${messageResponse}
                                    </div>
                                </c:if>
                                <div class="form form-add" id="form-product" enctype="multipart/form-data">
                                    <div class="form-item">
                                        <h4 class="title">INFORMATION PRODUCT</h4>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-item">
                                            <label for="productName">Product Name</label>
                                            <input type="text" name="productName" id="productName"
                                                   value="${PRODUCT.productName}">
                                        </div>
                                        <p style="color: red">${productNameError}</p>
                                    </div>
                                    <div class="form-group select">
                                        <div class="form-item">
                                            <label>Category</label>
                                            <select id="categoryId" name="categoryId" style="width: 60%">
                                                <option value="0">Select one</option>
                                                <c:forEach var="item" items="${category}">
                                                    <option value="${item.categoryId}" ${item.categoryId == PRODUCT.category.categoryId ? 'selected="selected"' : ''}>${item.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <p style="color: red">${categoryError}</p>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-item">
                                            <label for="price">Price</label>
                                            <input type="text" name="price" id="price" value="${PRODUCT.price}">
                                        </div>
                                        <p style="color: red">${priceError}</p>
                                    </div>

                                    <div class="form-group">
                                        <div class="form-item">
                                            <label for="description">Description</label>
                                            <textarea name="description" id="description"
                                                      style="width: 60%; height: 250px">${PRODUCT.description}</textarea>
                                        </div>
                                        <p style="color: red">${priceError}</p>
                                    </div>

                                    <br>

                                    <div class="form-item">
                                        <h4 class="title">INFORMATION DETAILS</h4>
                                    </div>
                                    <div class="form-item">
                                        <label for="camera">Camera</label>
                                        <input type="text" id="camera" name="camera" value="${PRODUCT.infoId.camera}">
                                    </div>
                                    <div class="form-item">
                                        <label for="cameraSelfie">Camera selfie</label>
                                        <input type="text" id="cameraSelfie" name="cameraSelfie"
                                               value="${PRODUCT.infoId.cameraSelfie}">
                                    </div>
                                    <div class="form-item">
                                        <label for="cell">Cell</label>
                                        <input type="text" id="cell" name="cell" value="${PRODUCT.infoId.cell}">
                                    </div>
                                    <div class="form-item">
                                        <label for="cpu">CPU</label>
                                        <input type="text" id="cpu" name="cpu" value="${PRODUCT.infoId.cpu}">
                                    </div>
                                    <div class="form-item">
                                        <label for="gpu">GPU</label>
                                        <input type="text" id="gpu" name="gpu" value="${PRODUCT.infoId.gpu}">
                                    </div>
                                    <div class="form-item">
                                        <label for="memory">Memory</label>
                                        <input type="text" id="memory" name="memory" value="${PRODUCT.infoId.memory}">
                                    </div>
                                    <div class="form-item">
                                        <label for="os">OS</label>
                                        <input type="text" id="os" name="os" value="${PRODUCT.infoId.os}">
                                    </div>
                                    <div class="form-item">
                                        <label for="ram">Ram</label>
                                        <input type="text" id="ram" name="ram" value="${PRODUCT.infoId.ram}">
                                    </div>
                                    <div class="form-item">
                                        <label for="screen">Screen</label>
                                        <input type="text" id="screen" name="screen" value="${PRODUCT.infoId.screen}">
                                    </div>
                                    <div class="form-item">
                                        <label for="sim">Sim</label>
                                        <input type="text" id="sim" name="sim" value="${PRODUCT.infoId.sim}">
                                    </div>
                                    <br>
                                    <div class="form-item">
                                        <button class="form-btn" type="submit" value="Save">Save</button>
                                    </div>
                                    <input type="hidden" value="${PRODUCT.productId}" id="productId" name="productId"/>
                                    <input type="hidden" value="${PRODUCT.infoId.infoId}" id="infoId" name="infoId"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="image" style="margin-left: 20px">
                            <div class="img_small">
                                <p>Small Image</p>
                                <input type="file" name="imageSmall" id="imageSmall">
                                <img src='${pageContext.request.contextPath}/show-image?fileName=${PRODUCT.imageSmall}' alt="${PRODUCT.imageSmall}">
                            </div>
                            <div class="img_big">
                                <p>Big Image</p>
                                <input type="file" name="imageBig" id="imageBig">
                                <img src='${pageContext.request.contextPath}/show-image?fileName=${PRODUCT.imageBig}' alt="${PRODUCT.imageBig}">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

</body>
</html>