<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIAdminAccount" value="/api-admin-account"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <title>Account</title>
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
            	<a href='<c:url value="/admin-account?type=edit&userId=0"/>'>
                <div style="margin-right: 1rem; border-radius: 5px;" class="btn btn-app btn-xs btn-warning ace-settings-btn" id="add-user" >
                    <i class="ace-icon fas fa-plus bigger-130"></i>
                </div>
                </a>
            </div>
            <div style="font-family: Arial, Helvetica, sans-serif; font-size :2rem" class="page-header">         
                    ACCOUNT
            </div>
          
            
            <div class="container__right-customer " >
                <div class="container__right-content">
                 <table style="font-family: Arial, Helvetica, sans-serif;" class="table">
                     <thead>
                         <th style="width: 5%" >ID</th>
                         <th style="width: 20%" >Email</th>
                         <th style="width: 15%" >Full Name</th>
                         <th style="width: 10%" >Phone</th>
                         <th style="width: 20%" >Address</th>
                         <th style="width: 10%" >Role</th>
                         <th style="width: 10%" >Action</th>
                     </thead>
                     <tbody>
                     	<c:forEach var="item" items="${model}">
                         <tr>
                             <td>${item.userId}</td>
                             <td>${item.email}</td>
                             <td>${item.fullName}</td>
                             <td>${item.phone}</td>
                             <td>${item.address}</td>
                             <td>${item.role.roleName}</td>
                             <td>
                             	<a href='<c:url value="/admin-account?type=edit&userId=${item.userId}"/>'><i id="edit-user" style="color: #438eb9;" class=" icon fas fa-edit"></i></a>
                                <a id="btnDelete" data-id="${item.userId}" type="button" style="pointer-events: all;"> <i style="color: red;" class=" icon fas fa-trash-alt"></i></a>                        	                               
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
<script>
	const btnDelete = document.querySelectorAll(`#btnDelete`);
	btnDelete.forEach((item) => item.addEventListener("click", function(e) {
		e.preventDefault();
		const userId = item.dataset.id;
	    var data = {};
		data['userId'] = userId;
		deleteUser(data);
	}))
	function deleteUser(data) {
        $.ajax({
            url: '${APIAdminAccount}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	window.location.href = "/admin-account?type=list&message=delete_success";
            },
            error: function (error) {
            	window.location.href = "/admin-account?type=list&message=error_system";
            }
        });
    }
</script>
</body>
</html>