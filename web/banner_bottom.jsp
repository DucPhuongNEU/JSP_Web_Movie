<%@page import="model.entity.Movie"%>
<%@page import="model.MovieModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>One movies</title>
<!-- banner-bottom-plugin -->
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="js/owl.carousel.js"></script>
<!-- //banner-bottom-plugin -->
</head>
<body>
		<div class="w3_agile_banner_bottom_grid">
			<div id="owl-demo" class="owl-carousel owl-theme">
				<%
					MovieModel mModel = new MovieModel();
					for (Movie m : mModel.getAllMovie()) {
						if (m.getReleaseDate() == 2018 || m.getReleaseDate() == 2017) {
				%>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="singleMovie.jsp?id=<%=m.getId() %>" class="hvr-shutter-out-horizontal">
								<img src="./images/anime/<%=m.getImageLink()%>" title="album-name" class="img-responsive" alt=" " style="height:268px; width: 182px;"/>
<%-- 								<img src="./GetImageAction?id=<%=m.getId()%>" title="album-name" class="img-responsive" alt=" " style="height:268px; width: 182px;"/> --%>
							<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text" style="height: 40px; line-height: 40px;">
								<h6><a href="singleMovie.jsp?id=<%=m.getId() %>"><%=m.getTitle()%></a></h6>							
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p><%=m.getReleaseDate() %></p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>	
			<%
						}
				}
			%>
			
			

<!-- 					<div class="item"> -->
<!-- 						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1"> -->
<!-- 							<a href="single.jsp" class="hvr-shutter-out-horizontal"><img src="images/m15.jpg" title="album-name" class="img-responsive" alt=" " /> -->
<!-- 								<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div> -->
<!-- 							</a> -->
<!-- 							<div class="mid-1 agileits_w3layouts_mid_1_home"> -->
<!-- 								<div class="w3l-movie-text"> -->
<!-- 									<h6><a href="single.jsp">Godâs Compass</a></h6>							 -->
<!-- 								</div> -->
<!-- 								<div class="mid-2 agile_mid_2_home"> -->
<!-- 									<p>2016</p> -->
<!-- 									<div class="block-stars"> -->
<!-- 										<ul class="w3l-ratings"> -->
<!-- 											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 											<li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 									<div class="clearfix"></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="ribben"> -->
<!-- 								<p>NEW</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
			</div>
		</div>			
</body>
</html>