<%@page import="model.entity.Movie"%>
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
		Movie m = mModel.getMovieById(id);
	%>
	<center>
		<h3 style="color: #FF8D1B;"><%=m.getTitle() %></h3>
		<form action="./UpdateMovieAction?id=<%=id %>" method="post" enctype="multipart/form-data">
			<table style="width: 100%;">
				
				<tr>
					<td>ID: </td>
					<td><%=m.getId() %></td>
				</tr>
				<tr>
					<td>Title: </td>
					<td><input type="text" name="Title" value="<%=m.getTitle()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Author: </td>
					<td><input type="text" name="Author" value="<%=m.getAuthor()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Country: </td>
					<td><input type="text" name="Country" value="<%=m.getCountry()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Movie Type: </td>
					<td><input type="text" name="MovieType" value="<%=m.getMovieType()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Genre: </td>
					<td><input type="text" name="Genre" value="<%=m.getGenre()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Release Date: </td>
					<td><input type="text" name="Releasedate" value="<%=m.getReleaseDate()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Episode: </td>
					<td><input type="text" name="Episode" value="<%=m.getEpisode()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Status: </td>
					<td><input type="text" name="Status" value="<%=m.getStatus()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Description: </td>
					<td><input type="text" name="Description" value="<%=m.getDescription()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Current Episode Link: </td>
					<td><%out.print(m.getImageLink()); %></td>
				</tr>
				<tr>
					<td>Episode Link: </td>
					<td><input type="file" name="ImageLink" value="<%=m.getImageLink()%>" class="form-control form-control-add-css"></td>
				</tr>
			</table>
			<a href="./admin.jsp?id=<%=m.getId() %>&f=movieManage"><input type="button" value="Return" class="btn btn-success btn-xs mybutton"></a>
			<input type = "submit" value = "Update" class="btn btn-success btn-xs mybutton">
		</form>
	</center>
</body>
</html>