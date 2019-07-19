<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>One Movies Header</title>

</head>
<body>
	<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="index.jsp"><h1>One<span>Movies</span></h1></a>
			</div>
			<div class="w3_search">
				<form action="#" method="post" name="formSearch">
					<input type="text" name="Search" placeholder="Search" required="" onkeyup="SearchTitle()">
					<input type="submit" value="Go">
					<div id="div-search" style="display: none;"></div>
				</form>
			</div>
			<div class="w3l_sign_in_register">
				<ul>
					<li><i class="fa fa-phone" aria-hidden="true"></i> (+000) 696 696 966</li>
					<%
						if (session.getAttribute("Username") == null) {
					%>
					<li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
					<%
						} else {
					%>
					<li><a href="./admin.jsp"><< <%=session.getAttribute("Username").toString().toUpperCase() %> >></a></li>
					<li><a href="./LogoutAction">Logout</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->
<!-- bootstrap-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					Sign In & Sign Up
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<section>
					<div class="modal-body">
						<div class="w3_login_module">
							<div class="module form-module">
							  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
								<div class="tooltip">Click Me</div>
							  </div>
							  <div class="form">
								<h3>Login to your account</h3>
								<form action="./LoginAction" method="post">
								  <input type="text" name="Username" placeholder="Username" required="">
								  <input type="password" name="Password" placeholder="Password" required="">
								  <input type="submit" value="Login">

									<a href="https://accounts.google.com/o/oauth2/auth?client_id=439616454303-krsmvd6d89pr16t984pt3p8ap14ihfid.apps.googleusercontent.com&redirect_uri=http://localhost:8080/LoginGoogleServlet&response_type=code&scope=https://www.googleapis.com/auth/LoginGoogleServlet">Login with Email</a>
									<br><br>
									<a href="#">Login with Facebook</a>

								</form>
							  </div>
							  <div class="form">
								<h3>Create an account</h3>
								<form action="./RegisterAction" method="post">
								  <input type="text" name="Username" placeholder="Username" required="">
								  <input type="password" name="Password" placeholder="Password" required="">
								  <input type="email" name="Email" placeholder="Email Address" required="">
								  <input type="submit" value="Register">
								</form>
							  </div>
							  <div class="cta"><a href="#">Forgot your password?</a></div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script>
		$('.toggle').click(function(){
		  // Switches the Icon
		  $(this).children('i').toggleClass('fa-pencil');
		  // Switches the	 forms
		  $('.form').animate({
			height: "toggle",
			'padding-top': 'toggle',
			'padding-bottom': 'toggle',
			opacity: "toggle"
		  }, "slow");
		});
	</script>
<!-- //bootstrap-pop-up -->

	<script src="js/index.js"></script>
</body>
</html>