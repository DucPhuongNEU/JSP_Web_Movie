<%@page import="model.entity.News"%>
<%@page import="java.util.List"%>
<%@page import="model.NewsModel"%>
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
	<h3 style="color: #FF8D1B;">News</h3>
	<a href="./admin.jsp?f=newsInserting"><button type="button" class="btn btn-success btn-xs mybutton">Add News</button></a>
	<table class="table table-responsive table-hover table-striped table-condensed">
		<tr style="color: #FF8D1B;">
			<th>ID</th>
			<th>Title</th>
			<th>Image</th>
			<th>Content</th>
			<th>Release date</th>
			<th>View</th>
		</tr>
		<%
			NewsModel nModel = new NewsModel();
			List<News> nList = nModel.getAllNews();
			for (int i = 0; i < nList.size(); i++) {
		%>
		<tr>
			<td><%out.print(nList.get(i).getIdnews()); %></td>
			<td><%out.print(nList.get(i).getTitle()); %></td>
			<td><img src="./images/imagesNews/<%=nList.get(i).getImage() %>" width="50" height="50"></td>
			<%
				String contentString = nList.get(i).getContent();
				if (contentString.length() > 65) {
			%>
			<td><%out.print(contentString.substring(0, 65) + "..."); %></td>
			<%
				} else {
			%>
			<td><%out.print(contentString); %></td>
			<%
				}
			%>
			<td><%out.print(nList.get(i).getReleasedate()); %></td>
			<td><%out.print(nList.get(i).getView()); %></td>
			<td><a href="./admin.jsp?idnews=<%=nList.get(i).getIdnews()%>&f=newsEditing"><img src="./images/icon/edit.png" width="25" height="25"></a></td>
			<td><a href="./DeleteNewsAction?idnews=<%=nList.get(i).getIdnews() %>" onclick="return confirmDelete()"><img src="./images/icon/delete.png" width="25" height="25"></a></td>
		</tr>
		
		<%
			}
		%>
	</table>
</body>
</html>