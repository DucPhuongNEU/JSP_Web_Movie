<%@page import="model.entity.News"%>
<%@page import="java.util.List"%>
<%@page import="model.NewsModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>News List</title>
</head>
<body>
	<%
		NewsModel nModel = new NewsModel();
		List<News> nList = (List<News>)request.getAttribute("NewsList");
		Object currentPage = request.getAttribute("CurrentPage");

	%>
	<div class="wthree-news-top-left" id="news-page-recognition" pageId-attr="<%=currentPage%>" style="width: 713px; height: 250.6px;">
	<%
		for (int i = 0; i < 2; i++) {
			if (i > (nList.size() - 1)) {
	%>
		<div class="col-md-6 w3-agileits-news-left">
			<div class="col-sm-5 wthree-news-img">
				<a href=""><img src="" alt="" /></a>
			</div>
			<div class="col-sm-7 wthree-news-info">
				<h5>
					<a href=""></a>
				</h5>
				<p></p>
				<ul>
<!-- 					<li><i class="fa fa-clock-o" aria-hidden="true"></i></li> -->
<!-- 					<li><i class="fa fa-eye" aria-hidden="true"></i></li> -->
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	<%
			} else {
	%>

		<div class="col-md-6 w3-agileits-news-left">
			<div class="col-sm-5 wthree-news-img">
				<a href="./news-single.jsp?idnews=<%=nList.get(i).getIdnews()%>"><img
					src="images/imagesNews/<%=nList.get(i).getImage() %>" alt="" style="width: 150px; height: 200px"/></a>
			</div>
			<div class="col-sm-7 wthree-news-info">
				<h5><a href="./news-single.jsp?idnews=<%=nList.get(i).getIdnews()%>"><%=nList.get(i).getTitle() %></a></h5>
				<% 
					String contentString = nList.get(i).getContent();
					if (contentString.length() >= 100) {
				%>
				<p><%=contentString.substring(0, 100)%>...
				</p>
				<%
					} else {
				%>
				<p><%=contentString%></p>
				<%
					}
				%>
				<ul>
					<li><i class="fa fa-clock-o" aria-hidden="true"></i> <%=nList.get(i).getReleasedate() %></li>
					<li><i class="fa fa-eye" aria-hidden="true"></i> <%=nList.get(i).getView() %></li>
				</ul>
			</div>

			<div class="clearfix"> </div>

		</div>
	<%
			}
		}
	%>
		<div class="clearfix"> </div>
	</div>
	<div class="wthree-news-top-left" id="news-page-recognition" pageId-attr="<%=currentPage%>" style="width: 713px; height: 250.6px;">
	<%
		for (int i = 2; i < 4; i++) {
			if (i > (nList.size() - 1)) {
	%>
		<div class="col-md-6 w3-agileits-news-left">
			<div class="col-sm-5 wthree-news-img">
				<a href=""><img src="" alt="" /></a>
			</div>
			<div class="col-sm-7 wthree-news-info">
				<h5>
					<a href=""></a>
				</h5>
				<p></p>
				<ul>
<!-- 					<li><i class="fa fa-clock-o" aria-hidden="true"></i></li> -->
<!-- 					<li><i class="fa fa-eye" aria-hidden="true"></i></li> -->
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	<%
			} else {
	%>

		<div class="col-md-6 w3-agileits-news-left">
			<div class="col-sm-5 wthree-news-img">
				<a href="./news-single.jsp?idnews=<%=nList.get(i).getIdnews()%>"><img
					src="images/imagesNews/<%=nList.get(i).getImage() %>" alt="" style="width: 150px; height: 200px"/></a>
			</div>
			<div class="col-sm-7 wthree-news-info">
				<h5><a href="./news-single.jsp?idnews=<%=nList.get(i).getIdnews()%>"><%=nList.get(i).getTitle() %></a></h5>
				<% 
					String contentString = nList.get(i).getContent();
					if (contentString.length() >= 100) {
				%>
				<p><%=contentString.substring(0, 100)%>...
				</p>
				<%
					} else {
				%>
				<p><%=contentString%></p>
				<%
					}
				%>
				<ul>
					<li><i class="fa fa-clock-o" aria-hidden="true"></i> <%=nList.get(i).getReleasedate() %></li>
					<li><i class="fa fa-eye" aria-hidden="true"></i> <%=nList.get(i).getView() %></li>
				</ul>
			</div>

			<div class="clearfix"> </div>

		</div>
	<%
			}
		}
	%>
		<div class="clearfix"> </div>
	</div>
	<div class="wthree-news-top-left" id="news-page-recognition" pageId-attr="<%=currentPage%>" style="width: 713px; height: 250.6px;">
	<%
		for (int i = 4; i < 6; i++) {
			if (i > (nList.size() - 1)) {
	%>
		<div class="col-md-6 w3-agileits-news-left">
			<div class="col-sm-5 wthree-news-img">
				<a href=""><img src="" alt="" /></a>
			</div>
			<div class="col-sm-7 wthree-news-info">
				<h5>
					<a href=""></a>
				</h5>
				<p></p>
				<ul>
<!-- 					<li><i class="fa fa-clock-o" aria-hidden="true"></i></li> -->
<!-- 					<li><i class="fa fa-eye" aria-hidden="true"></i></li> -->
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	<%
			} else {
	%>

		<div class="col-md-6 w3-agileits-news-left">
			<div class="col-sm-5 wthree-news-img">
				<a href="./news-single.jsp?idnews=<%=nList.get(i).getIdnews()%>"><img
					src="images/imagesNews/<%=nList.get(i).getImage() %>" alt="" style="width: 150px; height: 200px"/></a>
			</div>
			<div class="col-sm-7 wthree-news-info">
				<h5><a href="./news-single.jsp?idnews=<%=nList.get(i).getIdnews()%>"><%=nList.get(i).getTitle() %></a></h5>
				<% 
					String contentString = nList.get(i).getContent();
					if (contentString.length() >= 100) {
				%>
				<p><%=contentString.substring(0, 100)%>...
				</p>
				<%
					} else {
				%>
				<p><%=contentString%></p>
				<%
					}
				%>
				<ul>
					<li><i class="fa fa-clock-o" aria-hidden="true"></i> <%=nList.get(i).getReleasedate() %></li>
					<li><i class="fa fa-eye" aria-hidden="true"></i> <%=nList.get(i).getView() %></li>
				</ul>
			</div>

			<div class="clearfix"> </div>

		</div>
	<%
			}
		}
	%>
		<div class="clearfix"> </div>
	</div>
	
</body>
</html>