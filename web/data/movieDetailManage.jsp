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
		int id = Integer.parseInt(request.getParameter("id"));
		MovieModel mModel = new MovieModel();
	%>
	<h3 style="color: #FF8D1B;">Movie Detail</h3>
	<h4 style="text-align: center;"><%=mModel.getMovieById(id).getTitle() %></h4>
		<a href="./admin.jsp?id=<%=id%>&f=movieDetailInserting" style="float: right; margin-right: 140px;"><button type="button" class="btn btn-success btn-xs mybutton">Insert movie detail</button></a>
		<table class="table table-responsive table-hover table-striped table-condensed">
			<tr style="color: #FF8D1B;">
				<th>ID</th>
				<th>Episode</th>
				<th>Episode Name</th>
				<th>Episode Link</th>
			</tr>
			<%
				MovieDetailModel mdModel = new MovieDetailModel();
				for (MovieDetail md : mdModel.getAllMovieDetailById(id)) {
			%>
			<tr>
				<td><%out.print(md.getId()); %></td>
				<td><%out.print(md.getEpisode()); %></td>
				<td><%out.print(md.getEpisodename()); %></td>
				<td><%out.print(md.getEpisodelink()); %></td>
				<td><a href="./admin.jsp?idmoviedetail=<%=md.getIdmoviedetail()%>&f=movieDetailEditing"><img src="./images/icon/edit.png" width="32" height="32"></a></td>
				<td><a href="./DeleteMovieDetailAction?idmoviedetail=<%=md.getIdmoviedetail()%>&id=<%=md.getId()%>" onclick="return confirmDelete()"><img src="./images/icon/delete.png" width="32" height="32"></a></td>
			</tr>
			<%
				}
			%>
		</table>
		<a href="./admin.jsp?f=movieManage" style="float: right; margin-right: 140px;"><input type="button" value="Return" class="btn btn-success btn-xs mybutton"></a>
</body>
</html>