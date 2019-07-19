<%@page import="java.util.List"%>
<%@page import="model.entity.Movie"%>
<%@page import="model.MovieModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>View Genre List</title>
</head>
<body>
	<%
		MovieModel mModelGenre = new MovieModel();
		List<Movie> mListGenre = (List<Movie>)request.getAttribute("GenreList");
		Object currentPage = request.getAttribute("CurrentPage");
		String result = (String)(request.getAttribute("ErrorResult"));
	%>
	<div id="genre-page-recognition" pageId-attr="<%=currentPage%>">
	<%
		if (result != null) {
	%>
		<li><a><%out.print(result); %></a>
	<%
		} else {
	%>
		<div class="browse-inner">
		<%
			for (int i=0; i<6; i++) {
				if (i > (mListGenre.size() - 1)) {
		%>
			<div class="col-md-2 w3l-movie-gride-agile">
				<a class="hvr-shutter-out-horizontal">
					<div class="w3l-action-icon">
						<i class="fa fa-play-circle" aria-hidden="true"></i>
					</div> </a>
				<div class="mid-1">
					<div class="w3l-movie-text">
						<h6>
							<a></a>
						</h6>
					</div>
					<div class="mid-2">
	
						<p></p>
						<div class="block-stars">
							<ul class="w3l-ratings">
<!-- 								<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 								<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 								<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 								<li><a><i class="fa fa-star-half-o" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a><i class="fa fa-star-o" -->
<!-- 										aria-hidden="true"></i></a></li> -->
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		<%		
				} else {
		%>
			<div class="col-md-2 w3l-movie-gride-agile">
				<a href="./singleMovie.jsp?id=<%=mListGenre.get(i).getId()%>"
					class="hvr-shutter-out-horizontal"><img
					src="images/testMovies/<%=mListGenre.get(i).getImageLink()%> " style="width: 182px; height: 268px;"
					title="album-name" alt=" " />
					<div class="w3l-action-icon">
						<i class="fa fa-play-circle" aria-hidden="true"></i>
					</div> </a>
				<div class="mid-1">
					<div class="w3l-movie-text">
						<h6>
							<a href="singleMovie.jsp?id=<%=mListGenre.get(i).getId()%>"><%=mListGenre.get(i).getTitle()%></a>
						</h6>
					</div>
					<div class="mid-2">

						<p><%=mListGenre.get(i).getReleaseDate()%></p>
						<div class="block-stars">
							<ul class="w3l-ratings">
								<li><a href="#"><i class="fa fa-star"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-star"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-star"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-star-half-o"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-star-o"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<%
				}
			}
		%>
			<div class="clearfix"> </div>
		</div>
		<!-- /latest-movies1 -->
	
		<!-- //latest-movies1 -->
		<!-- /latest-movies1 -->
		<div class="browse-inner" style="height: 383.8px">
		<%
			for (int i=6; i<12; i++) {
				if (i > (mListGenre.size() - 1)) {
		%>
			<div class="col-md-2 w3l-movie-gride-agile">
				<a class="hvr-shutter-out-horizontal">
					<div class="w3l-action-icon">
						<i class="fa fa-play-circle" aria-hidden="true"></i>
					</div> </a>
				<div class="mid-1">
					<div class="w3l-movie-text">
						<h6>
							<a></a>
						</h6>
					</div>
					<div class="mid-2">
	
						<p></p>
						<div class="block-stars">
							<ul class="w3l-ratings">
<!-- 								<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 								<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 								<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li> -->
<!-- 								<li><a><i class="fa fa-star-half-o" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a><i class="fa fa-star-o" -->
<!-- 										aria-hidden="true"></i></a></li> -->
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		<%		
				} else {
		%>
			<div class="col-md-2 w3l-movie-gride-agile">
				<a href="./singleMovie.jsp?id=<%=mListGenre.get(i).getId()%>"
					class="hvr-shutter-out-horizontal"><img
					src="images/testMovies/<%=mListGenre.get(i).getImageLink()%>"
					title="album-name" alt=" " style="width: 182px; height: 268px;"/>
					<div class="w3l-action-icon">
						<i class="fa fa-play-circle" aria-hidden="true"></i>
					</div> </a>
				<div class="mid-1">
					<div class="w3l-movie-text">
						<h6>
							<a href="singleMovie.jsp?id=<%=mListGenre.get(i).getId()%>"><%=mListGenre.get(i).getTitle()%></a>
						</h6>
					</div>
					<div class="mid-2">

						<p><%=mListGenre.get(i).getReleaseDate()%></p>
						<div class="block-stars">
							<ul class="w3l-ratings">
								<li><a href="#"><i class="fa fa-star"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-star"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-star"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-star-half-o"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-star-o"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		<%
				}
			}
		%>
		<div class="clearfix"> </div>
		</div>
		
		<%
		}
		%>
	</div>
</body>
</html>