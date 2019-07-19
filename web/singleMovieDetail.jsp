<%@page import="model.entity.Rating"%>
<%@page import="model.RatingModel"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.entity.MovieDetail"%>
<%@page import="java.util.List"%>
<%@page import="model.MovieDetailModel"%>
<%@page import="model.entity.Movie"%>
<%@page import="model.MovieModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>One Movies Home</title>
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
<!-- news-css -->
<link rel="stylesheet" href="news-css/news.css" type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link rel="stylesheet" href="list-css/list.css" type="text/css" media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<!-- movie single  -->
<link href="css/singleMovie.css" rel='stylesheet' type='text/css' />
<!-- //movie single  -->
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
<script src="js/simplePlayer.js"></script>
<script src="js/index.js"></script>
<script>
	$("document").ready(function() {
// 		$("#video").simplePlayer();
		var view = 0;
		var temp = 0;

		var vid = document.getElementById("movie-vid");
		vid.onplaying = function() {
		    temp++;
		    if (temp==1) {
		    	view++;
		    	var idmovie = $('#movie-vid').attr('movie-id-attribute')
				if (view == 1) {
					IncreaseView(view, idmovie);
				}
// 		    	alert('view increase' + view);
		    }
// 		    alert('temp increase' + temp);
		};
		
	});
	
	
</script>

</head>
	
<body>
<%
	int id1 = Integer.parseInt(request.getParameter("id"));
	int idmoviedetail1 = Integer.parseInt(request.getParameter("idmoviedetail"));
	
	MovieModel mModel1 = new MovieModel();
	Movie m1 = mModel1.getMovieById(id1);
	
	MovieDetailModel mdModel = new MovieDetailModel();
	
	List<Movie> mList2 = new MovieModel().getAllMovie();
	int lastId = mList2.get(mList2.size()-1).getId();
	
	
	DecimalFormat formatRating = new DecimalFormat("#0.0");
	RatingModel rModel = new RatingModel();
	Rating r = rModel.getRating(id1, (String)session.getAttribute("Username"));
	float ratingV = rModel.getRatingValue(id1);
	
%>


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

<!-- single -->
<div class="single-page-agile-main">
	<div class="container">
		<!-- /w3l-medile-movies-grids -->
			<div class="agileits-single-top">
				<ol class="breadcrumb">
				  <li><a href="index.jsp">Home</a></li>
				  <li class="active">SingleMovie</li>
				  <li class="active"><a href="singleMovie.jsp?id=<%=m1.getId()%>"><%=m1.getTitle() %></a></li>
				  <%
				  	if (idmoviedetail1 != 0) {
				  %>
				  <li class="active"><%=mdModel.getMovieDetailByIdmoviedetail(idmoviedetail1).getEpisodename() %></li>
				  <%
				  	}
				  %>
				</ol>
			</div>
			<div class="single-page-agile-info">
                   <!-- /movie-browse-agile -->
            <div class="show-top-grids-w3lagile">
				<div class="col-sm-8 single-left">
					<div class="song">
						<div class="song-info">
							<h3><%=m1.getTitle() %></h3>	
						</div>
						<div class="video-grid-single-page-agileits">
<%-- 							<div data-video="dLmKio67pVQ" id="video"> <img src="images/testMovies/<%=m1.getImageLink() %>" alt="" class="img-responsive" /> </div> --%>
								<%
									if (idmoviedetail1 != 0) {
								%>
								<video width="800" controls id="movie-vid" movie-id-attribute="<%=id1%>">
									<source src="./movie/<%=mdModel.getMovieDetailByIdmoviedetail(idmoviedetail1).getEpisodelink() %>" type="video/mp4">
								</video>
								<%
									}
								%>
							<div class="block-movie-episode" style="min-height: 100px; text-align: justify;">
								<div class="block-movie-episode-childDiv">
								<%
									if (idmoviedetail1 != 0) {
										int count = mdModel.getNumberExistingEpisode(m1.getId());
										List<MovieDetail> mdList = mdModel.getAllMovieDetailById(m1.getId()); 
										for (MovieDetail md : mdList) {
								%>
									<h3 class="videoItem">
										<a href="./singleMovieDetail.jsp?id=<%=md.getId() %>&idmoviedetail=<%=md.getIdmoviedetail()%>"><span class="label label-primary"><%=md.getEpisodename() %></span></a>
									</h3>
								<% 
										}
									} else {
								%>
									<p>There's no current video</p>
								<%
									}
								%>
								<div class="clearfix"> </div>
								</div>
							</div>
							<div class="block-stars" style="float: left">
								<h4 style="color: #ff8d1b;">Movie Rating: <%=formatRating.format(ratingV) %></h4>	
								<ul class="w3l-ratings">
									<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li>
									<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li>
									<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li>
									<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li>
									<li><a><i class="fa fa-star" aria-hidden="true"></i></a></li>
								</ul>
							</div>
							<div class="clearfix"></div>
							<form action="./AllRatingAction?idmovie=<%=id1 %>&idmoviedetail=<%=idmoviedetail1 %>" method="post">
								<input type="number" min="0" max="5" name="Rating" value="<%=r.getValuerating()%>"
									style="width: 69px; height: 37px; padding-bottom: 4px; border: 1px solid #FF8D1B; 
									border-radius: 4px; text-align: center;">
								<button type="submit" class="btn btn-success btn-xs mybutton">Rate the movie</button>
							</form>
	
	
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="song-grid-right">
						<div class="share">
							<h5>Share this</h5>
							<div class="single-agile-shar-buttons">
								<ul>
									<li>
										<div class="fb-like" data-href="https://www.facebook.com/w3layouts" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="false"></div>
										<script>(function(d, s, id) {
										  var js, fjs = d.getElementsByTagName(s)[0];
										  if (d.getElementById(id)) return;
										  js = d.createElement(s); js.id = id;
										  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.7";
										  fjs.parentNode.insertBefore(js, fjs);
										}(document, 'script', 'facebook-jssdk'));</script>
									</li>
									<li>
										<div class="fb-share-button" data-href="https://www.facebook.com/w3layouts" data-layout="button_count" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.facebook.com%2Fw3layouts&amp;src=sdkpreparse">Share</a></div>
									</li>
									<li class="news-twitter">
										<a href="https://twitter.com/w3layouts" class="twitter-follow-button" data-show-count="false">Follow @w3layouts</a><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
									</li>
									<li>
										<a href="https://twitter.com/intent/tweet?screen_name=w3layouts" class="twitter-mention-button" data-show-count="false">Tweet to @w3layouts</a><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
									</li>
									<li>
									<!-- Place this tag where you want the +1 button to render. -->
									<div class="g-plusone" data-size="medium"></div>

									<!-- Place this tag after the last +1 button tag. -->
									<script type="text/javascript">
									  (function() {
										var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
										po.src = 'https://apis.google.com/js/platform.js';
										var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
									  })();
									</script>
								</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="clearfix"> </div>
					
					
				<!-- comments -->
					<jsp:include page="comments.jsp"></jsp:include>
				<!-- //comments -->
					
				</div>
				<div class="col-md-4 single-right">
					<h3>Up Next</h3>
 					<div class="single-grid-right">
						<%
							int countID = 0;
	  						for (int i=id1+1; countID<=7; i+=2) { 
	  							if (i >= lastId) break;
	  							while(mModel1.getMovieById(i).getTitle() == null) {
	  								i++;
	  							}
								int view = mModel1.getMovieById(i).getView(); 
								countID++;
	 					%> 
							<div class="single-grid-right">
								<div class="col-md-4 single-right-grid-left">
									<a href="singleMovie.jsp?id=<%=i %>"><img src="images/testMovies/<%=mModel1.getMovieById(i).getImageLink()%>" alt="" style="height: 145px; width: 101"/></a>
								</div>
								<div class="col-md-8 single-right-grid-right">
									<a href="singleMovie.jsp?id=<%=i%>" class="title"><%=mModel1.getMovieById(i).getTitle() %></a>
									<p class="author"><a href="#" class="author"><%=mModel1.getMovieById(i).getAuthor()%></a></p>
<%-- 									<p class="views"><%=view %> views</p> --%>
									<%
		                        		if (view > 1) {
		                        	%>
										<p class="views"><%=view %> views</p>							                        	
		                        	<%
		                        		} else {
		                        	%>
		                        		<p class="views"><%=view %> view</p>
		                        	<%
		                        		}
		                        	%>
								</div>
								<div class="clearfix"> </div>
							</div>
						<%
	 						} 
	 					%> 
<!-- 							<div class="single-right-grids"> -->
<!-- 								<div class="col-md-4 single-right-grid-left"> -->
<!-- 									<a href="singleMovie.jsp"><img src="images/m1.jpg" alt="" /></a> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-8 single-right-grid-right"> -->
<!-- 									<a href="singleMovie.jsp" class="title"> Nullam interdum metus</a> -->
<!-- 									<p class="author"><a href="#" class="author">John Maniya</a></p> -->
<!-- 									<p class="views">2,114,200 views</p> -->
<!-- 								</div> -->
<!-- 								<div class="clearfix"> </div> -->
<!-- 							</div> -->
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			<!-- //movie-browse-agile -->
		<!-- body wrapper start -->
				<jsp:include page="banner_bottom.jsp"></jsp:include>
		<!-- body wrapper end -->
						 
			</div>
			<!-- //w3l-latest-movies-grids -->
	</div>	
</div>
	<!-- //w3l-medile-movies-grids -->
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