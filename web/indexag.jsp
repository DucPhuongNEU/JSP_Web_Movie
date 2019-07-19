<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Food Delivery, Alcohol, Laundry, Restaurants</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="css/backtotop.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
	<script>
	$(function(){
	$(window).scroll(function () {
	if ($(this).scrollTop() > 100) $(".lentop").fadeIn();
	else $(".lentop").fadeOut();
	});
	$(".lentop").click(function () {
	$("body,html").animate({scrollTop: 0}, "slow");
	});
	});
	</script>
</head>
<body>
	<jsp:include page="headerag.jsp"></jsp:include>
	<jsp:include page="banner.jsp"></jsp:include>
	<br>
	<br>

	<jsp:include page="contact.jsp"></jsp:include>

	<!-- <a href="#"><i class="sc fa fa-hand-pointer-o" id = "cuon" aria-hidden="true"></i></a> -->
	<div class='lentop'>
			<img src='images/icon/top.png' />
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>