<%@page import="java.util.ArrayList"%>
<%@page import="model.entity.News"%>
<%@page import="java.util.List"%>
<%@page import="model.NewsModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>One Movies News</title>
</head>
<body>
	<%
		NewsModel nModelNav = new NewsModel();
		List<News> nListNav = nModelNav.getAllNews();
	%>
	<div class="col-md-4 wthree-news-right">
		<!-- news-right-top -->
		<div class="news-right-top">
			<div class="wthree-news-right-heading">
				<h3>Updated News</h3>
			</div>
			<div class="wthree-news-right-top">
				<div class="news-grids-bottom">
					<!-- date -->
					<div id="design" class="date">
						<div id="cycler">
						<%
							int countIdNews = 0;
							for (News ns : nListNav) {
								if (countIdNews >= 10) break;
								int randomNum = (int)(Math.random() * 9);
								if (randomNum % 2 == 0) {
						%>
							<div class="date-text">
								<a href="news-single.jsp?idnews=<%=ns.getIdnews()%>"><%=ns.getReleasedate() %><span
									class="blinking"><img src="images/new.png" alt="" /></span></a>
								<p><%=ns.getTitle() %></p>
							</div>
						<%
								} else {
						%>
							<div class="date-text">
								<a href="news-single.jspidnews=<%=ns.getIdnews()%>"><%=ns.getReleasedate() %></a>
								<p><%=ns.getTitle() %></p>
							</div>
						<%		
								}
								countIdNews++;
							}
						%>
						</div>
						<script>
										function blinker() {
											$('.blinking').fadeOut(500);
											$('.blinking').fadeIn(500);
										}
										setInterval(blinker, 1000);
										</script>
						<script>
											function cycle($item, $cycler){
												setTimeout(cycle, 2000, $item.next(), $cycler);
												
												$item.slideUp(1000,function(){
													$item.appendTo($cycler).show();        
												});
												}
											cycle($('#cycler div:first'),  $('#cycler'));
										</script>
					</div>
					<!-- //date -->
				</div>
			</div>
		</div>
		<!-- //news-right-top -->
		<!-- news-right-bottom -->
		<div class="news-right-bottom">
			<div class="wthree-news-right-heading">
				<h3>Top News</h3>
			</div>
			<div class="news-right-bottom-bg">
				<div class="news-grids-bottom">
					<div class="top-news-grid">
					<%
						nListNav = nModelNav.getAllNewsOrderByView();
						for (int i=0; i<3; i++) {
					%>
						<div class="top-news-grid-heading">
							<a href="news-single.jsp?idnews=<%=nListNav.get(i).getIdnews()%>"><%=nListNav.get(i).getTitle() %></a>
						</div>
						<div class="w3ls-news-t-grid top-t-grid">
							<ul>
								<li><a href=""><i class="fa fa-clock-o"></i> <%=nListNav.get(i).getReleasedate() %></a></li>
								<li><a href=""><i class="fa fa-user"></i> Admin</a></li>
							</ul>
						</div>
					<%
						}
					%>
					</div>
					
				</div>
			</div>
		</div>
		<!-- //news-right-bottom -->
	</div>
</body>
</html>