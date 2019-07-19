<%@page import="model.AccountModel"%>
<%@page import="model.CommentsModel"%>
<%@page import="model.entity.Comments"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Comments</title>
<style>
.media-grids:hover {
	background-color: #F7F7F7;
}
</style>
</head>
<body>
	<%
// 		List<Comments>cmList = (List<Comments>)request.getAttribute("CommentsList");
		int idmovie = Integer.parseInt(request.getParameter("id"));
		int idmoviedetail = -1;
		if (request.getParameter("idmoviedetail") != null && !request.getParameter("idmoviedetail").isEmpty()) {
			idmoviedetail = Integer.parseInt(request.getParameter("idmoviedetail"));
		}
		CommentsModel cmModel = new CommentsModel();
		List<Comments>cmList = cmModel.getComments(idmovie);
		
	%>

	<div class="all-comments">
		<div class="all-comments-info">
			<a href="#">Comments</a>
			
			<%
				if (session.getAttribute("Username") == null) {
			%>
<!-- 				<div class="agile-info-wthree-box"> -->
<!-- 					<form> -->
<!-- 						<input type="text" placeholder="Name" required="">			           					    -->
<!-- 						<input type="text" placeholder="Email" required=""> -->
<!-- 						<textarea placeholder="Message" required=""></textarea> -->
<!-- 						<input type="submit" value="SEND"> -->
<!-- 						<div class="clearfix"> </div> -->
<!-- 					</form> -->
<!-- 				</div> -->
			<%
				} else {
			%>
				<div class="agile-info-wthree-box">
					<form action="AllCommentAction?Action=insert&idmovie=<%=idmovie%>&idmoviedetail=<%=idmoviedetail %>" method="post">
						<textarea name="comment-area" id="comment-area" placeholder="Comments" required=""></textarea>
						<input type="submit" value="Submit Comment">
						<div class="clearfix"></div>
					</form>
				</div>
			<%
				}
			%>
			
		</div>
		
		<%
			if (cmList.size() == 0) { 
		%> 
				<div class="media-grids">
					<div class="media">
						<h5>No comments</h5>
					</div>
				</div>
		<%
			} else { 
				for (int i = 0; i < cmList.size(); i++) {
					String usr = cmList.get(i).getUsername();
	 	%> 
			<div class="media-grids">
				<div class="media">
					<h5><%=usr %></h5>
					<div class="media-left">
						<a href="./admin.jsp">
							<img src="images/avatar/<%=new AccountModel().getAccountByUsername(usr).getAvatar() %>" width="50" height="50" title="One movies" alt=" " />
						</a>
					</div>
					<div class="media-body showcmt">
						<p><%=cmList.get(i).getContent() %></p>
						<span>View all posts by :<a href="./index.jsp"> Admin </a></span>
						
						<%
							if (session.getAttribute("Username") != null) {
								if (session.getAttribute("Username").equals("admin")) {
									if (usr.equals("admin")) {
						%>
						<a href="./AllCommentAction?Action=delete&idcomment=<%=cmList.get(i).getIdcomment()%>&idmovie=<%=idmovie %>&idmoviedetail=<%=idmoviedetail%>" style="float: right!important;"><img src="./images/icon/delete.png" width="20" height="20" title="delete comment"></a>
						<a onclick="EditComment(<%=i %>)" style="float: right!important;"><img src="./images/icon/edit.png" width="20" height="20" title="edit comment"></a>
						<%			
									} else {
						%>
						<a href="./AllCommentAction?Action=delete&idcomment=<%=cmList.get(i).getIdcomment()%>&idmovie=<%=idmovie %>&idmoviedetail=<%=idmoviedetail%>" style="float: right!important;"><img src="./images/icon/delete.png" width="20" height="20" title="delete comment"></a>
						<%
									}
						%>
						<%
								} else if (session.getAttribute("Username").equals(usr)) {
						%>
						<a href="./AllCommentAction?Action=delete&idcomment=<%=cmList.get(i).getIdcomment()%>&idmovie=<%=idmovie %>&idmoviedetail=<%=idmoviedetail%>" style="float: right!important;"><img src="./images/icon/delete.png" width="20" height="20" title="delete comment"></a>
						<a onclick="EditComment(<%=i %>)" style="float: right!important;"><img src="./images/icon/edit.png" width="20" height="20" title="edit comment"></a>
						
						<%		}
						}	
						%>
					</div>
					<div class="media-body editcmt" style="display: none;">
						<form action="./AllCommentAction?Action=edit&idcomment=<%=cmList.get(i).getIdcomment() %>&idmovie=<%=idmovie%>&idmoviedetail=<%=idmoviedetail %>" method="post">
						<textarea name="edit-comment-area" maxlength="800" placeholder="Comment..."
							style="width: 100%; border: 1.5px solid red; border-radius: 5px; background-color: #F7F7F7;"><%=cmList.get(i).getContent() %></textarea>
						<button type="submit" class="btn btn-success" style="width: 90px;">Edit</button></a>
						<button class="btn btn-warning" style="width: 90px;" onclick="HiddenComment(<%=i%>)">Cancel</button>
						</form>
					</div>
				</div>
			</div>
			
		<%		}
 			} 
 		%> 

	</div>
	<script>
	function EditComment(i) {
// 		$('.showcmt')[i].css('display', 'none');
// 		$('.editcmt')[i].css('display', 'block');
		document.getElementsByClassName("showcmt")[i].style.display = "none";
		document.getElementsByClassName("editcmt")[i].style.display = "table-cell";
	}

	function HiddenComment(i) {
		document.getElementsByClassName("showcmt")[i].style.display = "table-cell";
		document.getElementsByClassName("editcmt")[i].style.display = "none";
	}
	</script>
</body>
</html>