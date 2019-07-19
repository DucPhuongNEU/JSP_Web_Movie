<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Account Page</title>
<link rel="icon" href="./images/1.jpg">
<link rel="stylesheet" type="text/css" href="./css/style-admin.css">


<link rel="stylesheet" href="css/bootstrap.min.css">


<script src="js/jquery-3.3.1.min.js"></script>

<script src="js/bootstrap.min.js"></script>


<script src="js/index.js"></script>

<style type="text/css">
body {
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="container-fluid">
			<div id="content">
		<div class="row">
				<div class="col-md-2">
					<div class="left">
						<h3>Menu</h3>
						<ul>
							<a href="./index.jsp"><li>Home</li></a>
							<a href="./admin.jsp?f=account"><li>Account Management</li></a>
							<a href="./admin.jsp?f=movieManage"><li>Movie Management</li></a>
							<a href="./admin.jsp?f=news"><li>News Management</li></a>
						</ul>
					</div>
				</div>
				<div class="col-md-10">
					<div class="right">
						<%
							String f = request.getParameter("f");
							if (f == null) {
								f = "account";
							}
							switch (f) {
							case "movieManage":
						%>
						<jsp:include page="./data/movieManage.jsp"></jsp:include>
						<%
							break;
							case "accountEditing":
						%>
						<jsp:include page="./data/accountEditing.jsp"></jsp:include>
						<%
							break;
							case "movieDetailManage":
						%>
						<jsp:include page="./data/movieDetailManage.jsp"></jsp:include>
						<%
							break;
							case "movieDetailEditing":
						%>
						<jsp:include page="./data/movieDetailEditing.jsp"></jsp:include>
						<%
							break;
							case "movieDetailInserting":
						%>
						<jsp:include page="./data/movieDetailInserting.jsp"></jsp:include>
						<%
							break;
							case "movieEditing":
						%>
						<jsp:include page="./data/movieEditing.jsp"></jsp:include>
						<%
							break;
							case "movieInserting":
						%>
						<jsp:include page="./data/movieInserting.jsp"></jsp:include>
						<%
							break;
							case "news":
						%>
						<jsp:include page="./data/news.jsp"></jsp:include>
						<%
							break;
							case "newsEditing":
						%>
						<jsp:include page="./data/newsEditing.jsp"></jsp:include>
						<%
							break;
							case "newsInserting":
						%>
						<jsp:include page="./data/newsInserting.jsp"></jsp:include>
						<%
							break;
							default:
						%>
						<jsp:include page="./data/account.jsp"></jsp:include>
						<%
							break;
							}
						%>
					</div>
				</div>
			</div>


		</div>
	</div>

</body>
</html>