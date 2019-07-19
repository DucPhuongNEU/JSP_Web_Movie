<%@page import="model.entity.Movie"%>
<%@page import="java.util.List"%>
<%@page import="model.MovieModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>One Movies an Entertainment Category Flat Bootstrap Responsive Website Template | General :: w3layouts</title>
<link rel="icon" href="./images/1.jpg">

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="One Movies Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/medile.css" rel='stylesheet' type='text/css' />
<link href="css/single.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/faqstyle.css" type="text/css" media="all" />
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<!-- news-css -->
<link rel="stylesheet" href="news-css/news.css" type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link rel="stylesheet" href="list-css/list.css" type="text/css" media="all" />
<!-- //list-css -->
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="js/owl.carousel.js"></script>
<script>
	$(document).ready(function() { 
		$("#owl-demo").owlCarousel({
	 
		  autoPlay: 3000, //Set AutoPlay to 3 seconds
	 
		  items : 5,
		  itemsDesktop : [640,5],
		  itemsDesktopSmall : [414,4]
	 
		});
	 
	}); 
</script> 
</head>
<body onload="LoadNewPage(1,0)">
<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
<!-- //header -->
<!-- nav -->
	<jsp:include page="nav.jsp"></jsp:include>
<!-- //nav -->
<div class="general_social_icons">
	<nav class="social">
		<ul>
			<li class="w3_twitter"><a href="#">Twitter <i class="fa fa-twitter"></i></a></li>
			<li class="w3_facebook"><a href="#">Facebook <i class="fa fa-facebook"></i></a></li>
			<li class="w3_dribbble"><a href="#">Dribbble <i class="fa fa-dribbble"></i></a></li>
			<li class="w3_g_plus"><a href="#">Google+ <i class="fa fa-google-plus"></i></a></li>				  
		</ul>
  </nav>
</div>
<!-- /w3l-medile-movies-grids -->
	<div class="general-agileits-w3l">
		<div class="w3l-medile-movies-grids">

				<!-- /movie-browse-agile -->
	<%
		String genreM = (String)request.getParameter("Genre");
		String genreMFormatted = genreM.replace("-", " ");
		MovieModel mModelPage = new MovieModel();
		List<Movie> mListPage = mModelPage.getAllMovieByGenre(genreM);
		int quantity = mListPage.size();
		int count = 12;
		int row = quantity / count;
		if (quantity % 2 != 0 || (quantity < count && quantity != 0 )) {
			row++;
		}
	%>
				
				      <div class="movie-browse-agile">
					     <!--/browse-agile-w3ls -->
						<div class="browse-agile-w3ls general-w3ls">
								<div class="tittle-head">
									<h4 class="latest-text"><%=genreMFormatted %> Movies </h4>
									<div class="container">
										<div class="agileits-single-top">
											<ol class="breadcrumb">
											  <li><a href="index.jsp">Home</a></li>
											  <li class="active">Genres</li>
											  <li class="active"><%=genreMFormatted %></li>
											</ol>
										</div>
									</div>
								</div>
							<div class="container" id="genreList" row-attr="<%=row%>" genre-attr="<%=genreM%>">
							
							
							<!-- //latest-movies1 -->
							</div>
							
						</div>
				<!--//browse-agile-w3ls -->
						<div class="blog-pagenat-wthree">
							<ul>
								<li id="btn-genre-previous" style="display: none;"><a 
									class="frist" onclick="LoadNewPage(0,-1)">Prev</a></li>
								<%
									for (int i = 1; i <= row; i++) {
								%>
								<li id="btn-genre-page-<%=i %>"><a
									onclick="LoadNewPage(<%=i%>,0)"><%=i %></a></li>
								<%
									}
								%>
								<li id="btn-genre-next" style="display: none;"><a
									class="last" onclick="LoadNewPage(0,1)">Next</a></li>
							</ul>
						</div>
					</div>
				    <!-- //movie-browse-agile -->
				    
				   <!--body wrapper start-->
				<!--//body wrapper start-->
				
		</div>
	<!-- //w3l-medile-movies-grids -->
	</div>
	<!-- //comedy-w3l-agileits -->

<script>
<!-- Pagination -->


function LoadNewPage(p, actionP) {
	var row = $('#genreList').attr('row-attr');
	var genre = $('#genreList').attr('genre-attr');
	var curPageId = $('#genre-page-recognition').attr('pageId-attr');
	if (typeof curPageId === 'undefined') curPageId = 1;
	// curPageId = parseInt(curPageId);
	if (p == 0) {
		p = parseInt(curPageId) + parseInt(actionP);
	}
	// alert("Total slides: " + row + " and oldPage is: " + curPageId + " and new page is: " + p);
	$('#btn-genre-previous, #btn-genre-next').css('display', 'none');
	if (row > p) {
		$('#btn-genre-next').show();
	}
	if (p!= 0 && p != 1) {
		$('#btn-genre-previous').show();
	}
	$('.blog-pagenat-wthree ul li a').removeClass('active-btn-genre-page');
	$('#btn-genre-page-' + p).find("a").addClass('active-btn-genre-page');

	// AJAX time 
	var xhttp;
	var url = "PaginationGenreAction?Page=" + p + "&OldPage=" + curPageId +"&ActionP=" + actionP + "&Genre=" + genre;
	if (window.XMLHttpRequest) {
		xhttp = new XMLHttpRequest();
	} else {
		xhttp = new ActiveXObject("microsoft.XMLHttp");
	}
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4) {
			var data = xhttp.responseText;
			document.getElementById("genreList").innerHTML = data;
		}
	}
	xhttp.open("POST", url, true);
	xhttp.send();
}


<!-- //Pagination -->
</script>


<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
<!-- //footer -->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<!-- //Bootstrap Core JavaScript -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
</body>
</html>