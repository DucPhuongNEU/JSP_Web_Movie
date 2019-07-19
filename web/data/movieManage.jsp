<%@page import="model.MovieDetailModel"%>
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
	<h3 style="color: #FF8D1B;">Movie List</h3>
	<a href="./admin.jsp?f=movieInserting"><button type="button" class="btn btn-success btn-xs mybutton">Upload a movie</button></a>
	<table class="table table-responsive table-hover table-striped table-condensed">
		<tr style="color: #FF8D1B;">
			<th>ID</th>
<!-- 			<th>Im</th> -->
			<th>Title</th>
			<th>Author</th>
			<th>Country</th>
			<th>Movie Type</th>
			<th>Episode</th>
			<th>View</th>
			<th>Rating</th>
		</tr>
		<%
			MovieModel mModel = new MovieModel();
			MovieDetailModel mdModel = new MovieDetailModel();
			for(Movie m : mModel.getAllMovie()) {
		%>
		<tr>
			<td><%out.print(m.getId());%></td>
			<td><%out.print(m.getTitle());%></td>
			<td><%out.print(m.getAuthor());%></td>
			<td><%out.print(m.getCountry());%></td>
			<td><%out.print(m.getMovieType());%></td>
			<td><%out.print(mdModel.getNumberExistingEpisode(m.getId())); %>/<%out.print(m.getEpisode());%></td>
			<td><%out.print(m.getView());%></td>
			<td><%out.print(m.getRating());%></td>
			<td><a href="./admin.jsp?id=<%=m.getId()%>&f=movieDetailManage">Detail</a></td>
			<td><a href="./admin.jsp?id=<%=m.getId()%>&f=movieEditing"><img src="./images/icon/edit.png" width="32" height="32"></a></td>
			<td><a href="./DeleteMovieAction?id=<%=m.getId()%>" onclick="return confirmDelete()"><img src="./images/icon/delete.png" width="32" height="32"></a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>