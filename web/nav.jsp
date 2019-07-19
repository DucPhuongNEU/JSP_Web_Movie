<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>One Movies</title>

</head>
<body>
	<div class="movies_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.jsp">Home</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Genres <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="genres.jsp?Genre=action">Action</a></li>
											<li><a href="genres.jsp?Genre=biography">Biography</a></li>
											<li><a href="genres.jsp?Genre=crime">Crime</a></li>
											<li><a href="genres.jsp?Genre=family">Family</a></li>
											<li><a href="genres.jsp?Genre=horror">Horror</a></li>
											<li><a href="genres.jsp?Genre=magic">Magic</a></li>
											<li><a href="genres.jsp?Genre=romance">Romance</a></li>
											<li><a href="genres.jsp?Genre=sports">Sports</a></li>
											<li><a href="genres.jsp?Genre=war">War</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="genres.jsp?Genre=adventure">Adventure</a></li>
											<li><a href="genres.jsp?Genre=comedy">Comedy</a></li>
											<li><a href="genres.jsp?Genre=documentary">Documentary</a></li>
											<li><a href="genres.jsp?Genre=fantasy">Fantasy</a></li>
											<li><a href="genres.jsp?Genre=martial-arts">Martial Arts</a></li>
											<li><a href="genres.jsp?Genre=shounen">Shounen</a></li>
											<li><a href="genres.jsp?Genre=super-power">Super Power</a></li>
											<li><a href="genres.jsp?Genre=thriller">Thriller</a></li>
											<li><a href="genres.jsp?Genre=fiction">Fiction</a></li>
											<li><a href="genres.jsp?Genre=mystery">Mystery</a></li>
											
										</ul>
									</div>
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<li><a href="genres.jsp?Genre=animation">Animation</a></li>
											<li><a href="genres.jsp?Genre=costume">Costume</a></li>
											<li><a href="genres.jsp?Genre=drama">Drama</a></li>
											<li><a href="genres.jsp?Genre=game">Game</a></li>
											<li><a href="genres.jsp?Genre=history">History</a></li>
											<li><a href="genres.jsp?Genre=musical">Musical</a></li>
											<li><a href="genres.jsp?Genre=psychological">Psychological</a></li>
											<li><a href="genres.jsp?Genre=school">School life</a></li>
											<li><a href="genres.jsp?Genre=slice-of-life">Slice of life</a></li>
											<li><a href="genres.jsp?Genre=supernatural">Supernatural</a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
									</li>
								</ul>
							</li>
							<li><a href="series.jsp">tv - series</a></li>
							<li><a href="news.jsp">news</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Country <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<li>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="country.jsp?Country=asia">Asia</a></li>
												<li><a href="country.jsp?Country=france">France</a></li>
												<li><a href="country.jsp?Country=taiwan">Taiwan</a></li>
												<li><a href="country.jsp?Country=USA">United States</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="country.jsp?Country=china">China</a></li>
												<li><a href="country.jsp?Country=Hongcong">HongCong</a></li>
												<li><a href="country.jsp?Country=japan">Japan</a></li>
												<li><a href="country.jsp?Country=thailand">Thailand</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<li><a href="country.jsp?Country=euro">Euro</a></li>
												<li><a href="country.jsp?Country=india">India</a></li>
												<li><a href="country.jsp?Country=korea">Korea</a></li>
												<li><a href="country.jsp?Country=United-Kingdom">United Kingdom</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</li>
								</ul>
							</li>
							<li><a href="short-codes.jsp">Short Codes</a></li>
							<li><a href="#">Add1</a></li>
							<li><a href="#">Add2</a></li>
<!-- 							<li><a href="list.jsp">A - Z list</a></li> -->
						</ul>
					</nav>
				</div>
			</nav>	
		</div>
	</div>
</body>
</html>