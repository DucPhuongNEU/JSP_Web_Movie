<%@page import="model.entity.Account"%>
<%@page import="model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Account Editor</title>
</head>
<body>
	<%
		AccountModel aModel = new AccountModel();
		String Username = request.getParameter("Username");
		Account acc = aModel.getAccountByUsername(Username);
	%>
	<h3 style="color: #FF8D1B;">Update Personal Information</h3>
	<form action="./UpdateAccountAction?id=<%=acc.getId()%>&Username=<%=acc.getUsername()%>" method="post" enctype="multipart/form-data">
		<table style="width: 100%;">
			<tr>
				<td>ID: </td>
				<td><%out.print(acc.getId()); %></td>
			</tr>
			<tr>
				<td>Username: </td>
				<td><%out.print(acc.getUsername()); %></td>
			</tr>
			<tr>
				<td>Password: </td>
				<td><input type="password" name="Password" value="<%=acc.getPass()%>" class=" form-control  form-control-add-css"></td>
			</tr>
			<tr>
				<td>Email: </td>
				<td><input type="text" name="Email" value="<%=acc.getEmail()%>" class=" form-control  form-control-add-css"></td>
			</tr>
			<tr>
				<td>Current Avatar: </td>
				<td><%out.print(acc.getAvatar()); %></td>
			</tr>
			<tr>
				<td>New Avatar: </td>
				<td><input type="file" name="Avatar" value="<%=acc.getAvatar()%>" class=" form-control  form-control-add-css"></td>
			</tr>
			<tr>
				<td><a href="./admin.jsp?f=account"><input type="button" value="Return" class="btn btn-success btn-xs mybutton"></a></td>
				<td><input type="submit" name="submit" value="Update" class="btn btn-success btn-xs mybutton"></td>
			</tr>
		</table>
	</form>
</body>
</html>