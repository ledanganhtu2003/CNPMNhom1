<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <div class="page-content home-page">

            <c:if test="${not empty messageResponse}">
                <div class="alert alert-warning">
                        ${messageResponse}
                </div>
            </c:if>

            <div class="ace-settings-container" id="ace-settings-container">
                <a href='<c:url value="/admin-category?type=edit&categoryId=0"/>'>
                    <div style="margin-right: 1rem; border-radius: 5px;"
                         class="btn btn-app btn-xs btn-warning ace-settings-btn" id="add-user">
                        <i class="ace-icon fas fa-plus bigger-130"></i>
                    </div>
                </a>
            </div>
            <div style="font-family: Arial, Helvetica, sans-serif; font-size :2rem" class="page-header">
                CATEGORY
            </div>

            <div class="container__right-customer ">
                <div class="container__right-content">
                    <table style="font-family: Arial, Helvetica, sans-serif;" class="table">
                        <thead>
                        <th style="width: 5%">ID</th>
                        <th style="width: 20%">Name</th>
                        <th style="width: 10%">Action</th>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${model}">
                            <tr>
                                <td>${item.categoryId}</td>
                                <td>${item.categoryName}</td>
                                <td>
                                    <a href='<c:url value="/admin-category?type=edit&categoryId=${item.categoryId}"/>'><i
                                            id="edit-user" style="color: #438eb9;" class=" icon fas fa-edit"></i></a>
                                    <a id="btnDelete" data-id="${item.categoryId}" type="button"
                                       style="pointer-events: all;"> <i style="color: red;"
                                                                        class=" icon fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>