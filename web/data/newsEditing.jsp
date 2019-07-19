<%@page import="model.entity.News"%>
<%@page import="model.NewsModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>One Movies Account Manager</title>
<link rel="icon" href="../images/1.jpg">
<script type="text/javascript" src="<%=request.getContextPath()%>/libckeditor/ckeditor/ckeditor.js"></script>
</head>
<body>

	<%
		int idnews = Integer.parseInt(request.getParameter("idnews"));
		NewsModel nModel  = new NewsModel();
		News n = nModel.getNewById(idnews);
	%>
	<h2 style="color: #FF8D1B!important;">Add News</h2>
	<form action="./AllNewsAction?Action=edit&idnews=<%=idnews%>" method="post" enctype="multipart/form-data">
		<h3 style="text-align: left; color: #FF8D1B!important;">Title</h3>
			<input type="text" name="Title" size="50" value="<%=n.getTitle() %>" width="400" class="form-control" style="color: #FF8D1B!important;">
		<h3 style="text-align: left; color: #FF8D1B!important;">Image</h3>
			<img src="./images/imagesNews/<%=n.getImage()%>" width="300"; height="200">
			<input type="file" name="Image" size="50" value="<%=n.getImage()%>">
		<h3 style="text-align: left; color: #FF8D1B!important;">Content</h3>
			<textarea rows="10" cols="10" id="editor" name="Content" style="width: 100%; height: 200px"><%=n.getContent() %></textarea>
			
		<div style="margin-top: 10px; text-align: center">
			<input type="submit" value="Confirm" class="btn btn-primary mybutton">
			<a href="./admin.jsp?f=news"><input type="button" value="Return" class="btn btn-primary mybutton"/></a>
		</div>
	</form>

<script>
	CKEDITOR.replace('editor');
</script>
</body>
</html>