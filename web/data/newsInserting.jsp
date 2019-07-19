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
	<h2 style="color: #FF8D1B!important;">Add News</h2>
	<form action="./AllNewsAction?Action=insert" method="post" enctype="multipart/form-data">
		<h3 style="text-align: left; color: #FF8D1B!important;">Title</h3>
			<input type="text" name="Title" size="50" class="form-control">
		<h3 style="text-align: left; color: #FF8D1B!important;">Image</h3>
			<input type="file" name="Image">
		<h3 style="text-align: left; color: #FF8D1B!important;">Content</h3>
			<textarea rows="10" cols="10" id="editor" name="Content" style="width: 100%; height: 200px"></textarea>
		
		<div style="margin-top: 10px; text-align: center">
			<input type="submit" class="btn btn-primary mybutton" value="Confirm">
			<a href="./admin.jsp?f=news"><input type="button" class="btn btn-primary mybutton" value="Return"/></a>
		</div>
	</form>
	
<script>
	CKEDITOR.replace('editor');
</script>
</body>
</html>