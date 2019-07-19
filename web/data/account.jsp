<%@page import="model.entity.Account"%>
<%@page import="model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>One Movies Account Manager</title>
<link rel="icon" href="../images/1.jpg">
</head>
<body>
	<h3  style="color: #FF8D1B;">Account</h3>
	<table class="table table-responsive table-hover table-striped table-condensed">
		<tr style="color: #FF8D1B;">
			<th>ID</th>
			<th>Avatar</th>
			<th>Username</th>
			<th>Email</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<%
			AccountModel aModel = new AccountModel();
			for (Account acc : aModel.getAllAccount()) {
		%>
		<tr>
			<td><%out.print(acc.getId()); %></td>
			<td><img src="./images/avatar/<%=acc.getAvatar()%>" width="25" height="25"></td>
			<td><%out.print(acc.getUsername()); %></td>
			<td><%out.print(acc.getEmail()); %></td>
			<td><a href="./admin.jsp?Username=<%=acc.getUsername()%>&f=accountEditing"><img src="./images/icon/edit.png" width="25" height="25"></a></td>
			<td><a href="./DeleteAccountAction?id=<%=acc.getId()%>" onclick="return confirmDelete()"><img src="./images/icon/delete.png" width="25" height="25"></a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>