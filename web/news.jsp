<%@page import="model.NewsModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>One Movies | News </title>
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
<link rel="stylesheet" href="css/faqstyle.css" type="text/css" media="all" />
<link href="css/single.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/contactstyle.css" type="text/css" media="all" />
<!-- news-css -->
<link rel="stylesheet" href="news-css/news.css" type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link rel="stylesheet" href="list-css/list.css" type="text/css" media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome icons -->
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
</head>
	
<body>
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



<%
	NewsModel nModel = new NewsModel();	
	int quantity = nModel.getCountNews();
	int count = 6;
	int row = quantity / count;
	if (quantity % 2 != 0 || (quantity < count && quantity != 0 )) {
		row++;
	}
%>
<!-- faq-banner -->
	<div class="faq">
			<div class="container">
				<div class="agileits-news-top">
					<ol class="breadcrumb">
					  <li><a href="index.jsp">Home</a></li>
					  <li class="active">News</li>
					</ol>
				</div>
				<div class="agileinfo-news-top-grids">
					<div class="col-md-8 wthree-top-news-left">
						<div class="wthree-news-left">
							<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
								<ul id="myTab" class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active"><a href="#home1" id="home1-tab" role="tab" data-toggle="tab" aria-controls="home1" aria-expanded="true">Latest News</a></li>
<!-- 									<li role="presentation"><a href="#w3bsd" role="tab" id="w3bsd-tab" data-toggle="tab" aria-controls="w3bsd">Movie News</a></li> -->
								</ul>
								<div id="myTabContent" class="tab-content">
									<div role="tabpanel" class="tab-pane fade in active" id="home1" aria-labelledby="home1-tab">
										
										<div id="newsList" row-attr="<%=row%>">
										
										</div>

										<div class="clearfix"></div>
									</div>
								</div>
								<!-- 										Pagination -->
										<nav style="text-align: center">
										<ul class="pagination">
											<%
// 												Cookie[] cookieList = request.getCookies();
// 												if (cookieList != null) {
// 													for (Cookie cookie : cookieList) {
// 														if (cookie.getName().equals("CurrentPage")) {
// 															curP = Integer.parseInt(cookie.getValue());
// 														}
// 													}
// 												}
												
											%>
											<li id="btn-news-previous" style="display: none;"><a 
													aria-label="Previous" onclick="LoadNewPage(0,-1)"><span
													aria-hidden="true">«</span></a></li>
											<%
												
												for (int i = 1; i <= row; i++) {
											%>	
											<li id="btn-news-page-<%=i%>"><a onclick="LoadNewPage(<%=i%>,0)"><%=i %></a></li>
											<%
												}
											%>
											<li id="btn-news-next" style="display: none;"><a 
													aria-label="Next" onclick="LoadNewPage(0,1)"><span 
													aria-hidden="true">»</span></a></li>
											
										</ul>
										</nav>
<!-- 										//Pagination -->
							</div>
						</div>
					</div>
					
<!-- 					news-nav.jsp -->
					<jsp:include page="news-nav.jsp"></jsp:include>
<!-- 					//news-nav.jsp -->
					
					<div class="clearfix"> </div>
				</div>
			</div>
	</div>
<!-- //faq-banner -->

<script>
<!-- Pagination -->


function LoadNewPage(p, actionP) {
	var row = $('#newsList').attr('row-attr');
	var curPageId = $('#news-page-recognition').attr('pageId-attr');
	if (typeof curPageId === 'undefined') curPageId = 1;
	curPageId = parseInt(curPageId);
	if (p == 0) {
		p = parseInt(curPageId) + parseInt(actionP);
	}
	// alert("Total slides: " + row + " and oldPage is: " + curPageId + " and new page is: " + p);
	$('#btn-news-previous, #btn-news-next').css('display', 'none');
	if (row > p) {
		$('#btn-news-next').show();
	}
	if (p!= 0 && p != 1) {
		$('#btn-news-previous').show();
	}
	$('nav .pagination li a').removeClass('active-btn-news-page');
	$('#btn-news-page-' + p).find("a").addClass('active-btn-news-page');

	// AJAX time 
	var xhttp;
	var url = "PaginationNewsAction?Page=" + p + "&OldPage=" + curPageId +"&ActionP=" + actionP;
	if (window.XMLHttpRequest) {
		xhttp = new XMLHttpRequest();
	} else {
		xhttp = new ActiveXObject("microsoft.XMLHttp");
	}
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4) {
			var data = xhttp.responseText;
			document.getElementById("newsList").innerHTML = data;
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