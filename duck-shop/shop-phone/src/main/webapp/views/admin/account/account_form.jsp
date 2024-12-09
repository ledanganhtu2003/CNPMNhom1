<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIAdminUser" value="/api-admin-user"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <title>Account</title>
</head>
<body>
<div class="main-content">
	<div class="main-content-inner">
        <div class="page-content">

            <div style="font-family: Arial, Helvetica, sans-serif; font-size :2rem" class="page-header">         
                Account
            </div>

            <div class="form__wapper form__wapper-user-add">
                <c:if test="${not empty messageResponse}">
                    <div class="alert alert-${alert}">
                           ${messageResponse}
                    </div>
                </c:if>

                <form class="form" id="form-user" action="/admin-account" method="post">
                    <div class="form-group">
                        <div class="form-item">
                            <label for="fullName">Full Name</label>
                            <input type="text" name="fullName" id="fullName" value='${USER.fullName}'>
                        </div>
                        <p style="color: red">${fullNameError}</p>
                    </div>
                    <div class="form-group">
                        <div class="form-item">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" value='${USER.email}'>
                        </div>
                        <p style="color: red">${emailError}</p>
                    </div>
                    <c:if test="${USER.userId == 0}">
                    <div class="form-group">
                        <div class="form-item">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" value="">
                        </div>
                        <p style="color: red">${passwordError}</p>
                    </div>
                    </c:if>
                    <div class="form-group">
                        <div class="form-item">
                            <label for="phone">Phone</label>
                            <input type="text" name="phone" id="phone" value='${USER.phone}'>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-item">
                            <label for="address">Address</label>
                            <textarea name="address" id="address" style="width: 60%; height: 150px">${USER.address}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-item">
                            <label for="roleId">Role</label>
                            <select class="form-control" id="roleId" name="roleId">
                                <option value="0">Choose one</option>
                                <c:forEach var="item" items="${role}">
                                    <option value="${item.roleId}" ${item.roleId == USER.role.roleId ? 'selected="selected"' : ''}>${item.roleName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <p style="color: red">${roleError}</p>
                    </div>
                    <div class="form-group">
                        <div class="form-item">
                            <button class="form-btn" type="submit" value="Save">Save</button>
                        </div>
                        <input type="hidden" value="${USER.userId}" id="userId" name="userId"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>