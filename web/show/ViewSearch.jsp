<%@page import="model.entity.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.box {
	position: absolute;
	width: 357px;
	background: white;
	z-index: 1;
	border-radius: 5px;
	border: 1.5px solid #652F8D;
}

	.box ul {
		padding: 0;
		margin: 0;
	}

	.box ul a {
		text-decoration: none;
	}

	.box ul a li {
		float: none!important;
		min-height: 40px;
		line-height: 40px;
		margin-bottom: 3px;
		padding-left: 5px;
		list-style: none;
	}

	.box ul a li:hover {
		background: rgb(238, 194, 151);
		border-radius: 5px;
	}
</style>


</head>
<body>
	<div class="box">
		<ul>
			<%
				String result = (String)request.getAttribute("Result");
				if (result != null) {
			%>
				<a><li><%out.print(result); %> (˚Δ˚)b</li></a>
			<%
				} else {
					List<Movie> mList = new ArrayList<>();
					mList = (List<Movie>)request.getAttribute("movielist");
					for (int i = 0; i < mList.size(); i++) {
				
			%>
				<a href="./singleMovie.jsp?id=<%=mList.get(i).getId()%>">
					<li>
						<img src="./images/testMovies/<%=mList.get(i).getImageLink()%>" style="width: 60px; height: 70px;">
						<%=mList.get(i).getTitle() %>
					</li>
				</a>
			
			<%
					}
				}
			%>
		</ul>
	</div>
</body>
</html>