<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <title>Category</title>
</head>
<body>
<div class="main-content">
	<div class="main-content-inner">
        <div class="page-content">

            <div style="font-family: Arial, Helvetica, sans-serif; font-size :2rem" class="page-header">
                CATEGORY
            </div>

            <div class="form__wapper form__wapper-user-add">
                <c:if test="${not empty messageResponse}">
                    <div class="alert alert-${alert}">
                           ${messageResponse}
                    </div>
                </c:if>

                <form class="form" id="form-user" action="/admin-category" method="post">
                    <div class="form-group">
                        <div class="form-item">
                            <label for="categoryName">Category Name</label>
                            <input type="text" name="categoryName" id="categoryName" value='${CATEGORY.categoryName}'>
                        </div>
                        <p style="color: red">${categoryNameError}</p>
                    </div>
                    <div class="form-group">
                        <div class="form-item">
                            <button class="form-btn" type="submit" value="Save">Save</button>
                        </div>
                        <input type="hidden" value="${CATEGORY.categoryId}" id="categoryId" name="categoryId"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>