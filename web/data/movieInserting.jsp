<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Movie Manage</title>
</head>
<body>
	<h3 style="color: #FF8D1B;">Insert New Movie</h3>
		<form action="./InsertMovieAction" method="post" enctype="multipart/form-data">
			<table style="width: 100%;">
				<tr>
					<td>Title: </td>
					<td><input type="text" name="Title" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Season: </td>
					<td><input type="text" name="Season" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Author: </td>
					<td><input type="text" name="Author" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Country: </td>
					<td><input type="text" name="Country" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Movie Type: </td>
					<td><input type="text" name="MovieType" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Genre: </td>
					<td><input type="text" name="Genre" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Release date: </td>
					<td><input type="text" name="Releasedate" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Episode: </td>
					<td><input type="text" name="Episode" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Status: </td>
					<td><input type="text" name="Status" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Description: </td>
					<td><input type="text" name="Description" class="form-control form-control-add-css"></td>
				</tr>
				<tr>
					<td>Image Link: </td>
					<td><input type="file" name="ImageLink" class="form-control form-control-add-css"></td>
				</tr>
			</table>
			<input type="submit" value="Confirm" class="btn btn-success btn-xs mybutton">
		</form>
		<br />
		<a href="./admin.jsp?f=movieManage"><input type="button" value="Return" class="btn btn-success btn-xs mybutton"></a>
</body>
</html>