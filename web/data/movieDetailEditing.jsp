<%@page import="model.MovieModel"%>
<%@page import="model.entity.MovieDetail"%>
<%@page import="model.MovieDetailModel"%>
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
		int idmoviedetail = Integer.parseInt(request.getParameter("idmoviedetail"));
		MovieModel mModel = new MovieModel();
		MovieDetailModel mdModel = new MovieDetailModel();
		MovieDetail md = mdModel.getMovieDetailByIdmoviedetail(idmoviedetail);
	%>
	<h3 style="color: #FF8D1B;">Movie Editing</h3>
	<h4 style="text-align: center;"><%=mModel.getMovieById(md.getId()).getTitle() %></h4>
		<form action="./UpdateMovieDetailAction?idmoviedetail=<%=md.getIdmoviedetail()%>&id=<%=md.getId() %>" method="post" enctype="multipart/form-data">
			<table style="width: 100%;">
				<tr>
					<td>Id Movie Episode: </td>
					<td><%out.print(md.getIdmoviedetail()); %></td>
				</tr>
				<tr>
					<td>Id Movie: </td>
					<td><%out.print(md.getId()); %></td>
				</tr>
				<tr>
					<td>Episode: </td>
					<td><input type="text" name="Episode" value="<%=md.getEpisode()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Episode Name: </td>
					<td><input type="text" name="Episodename" value="<%=md.getEpisodename()%>" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Current Episode Link: </td>
					<td><%out.print(md.getEpisodelink()); %></td>
				</tr>
				<tr>
					<td>Episode Link: </td>
					<td><input type="file" name="Episodelink" value="<%=md.getEpisodelink()%>" class="form-control form-control-add-css"></td>
				</tr>
			</table>
			<input type="submit" class="btn btn-success btn-xs mybutton" value="Confirm">
		</form>
		<a href="./admin.jsp?id=<%=md.getId() %>&f=movieDetailManage"><input type="button" class="btn btn-success btn-xs mybutton" value="Return"></a>
</body>
</html>