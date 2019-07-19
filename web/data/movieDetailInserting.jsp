<%@page import="model.MovieModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Movie Manage</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		MovieModel mModel = new MovieModel();
	%>
	<h3 style="color: #FF8D1B;">Insert Movie Detail</h3>
	<h4 style="text-align: center;"><%=mModel.getMovieById(id).getTitle() %></h4>
		<form action="./InsertMovieDetailAction?id=<%=id%>" method="post" enctype="multipart/form-data">
			<table style="width: 100%;">
				<tr>
					<td>ID Movie: </td>
					<td><%out.print(id); %></td>
				</tr>
				<tr>
					<td>Episode: </td>
					<td><input type="text" name="Episode" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Episode Name: </td>
					<td><input type="text" name="Episodename" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Episode Link: </td>
					<td><input type="file" name="Episodelink" class="form-control form-control-add-css"></td>
				</tr>
			</table>
			<input type="submit" value="Confirm" class="btn btn-success btn-xs mybutton">
		</form>
		<a href="./admin.jsp?id=<%=id%>&f=movieDetailManage"><input type="button" value="Return" class="btn btn-success btn-xs mybutton"></a>
</body>
</html>