function confirmDelete() {
	var x = confirm("Ban co muon xoa?");
	if(x == true) {
		return true;
	} else {
		return false;
	}
}

function SearchTitle() {
	var xhttp;
	var name = document.formSearch.Search.value;
	
	if (name != "") {
		var url = "SearchTitleAction?name=" + name;
		
		if (window.XMLHttpRequest) {
			xhttp = new XMLHttpRequest();
		} else {
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4) {
				var data = xhttp.responseText;
				$('#div-search').html(data);
				$('#div-search').css("display", "block");
			}
		}
		xhttp.open("POST", url, true);
		xhttp.send();
	} else {
		document.getElementById("div-search").innerHTML = "";
	}
	
}

function IncreaseView(view, id) {
	var xhttp;
	if (view == 1) {
		var url = "UpdateMovieDetailViewAction?view=" + view + "&id=" + id;
		if (window.XMLHttpRequest) {
			xhttp = new XMLHttpRequest();
		} else {
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xhttp.open("POST", url, true);
		xhttp.send();
	}
}

//function InsertComments(idmovie) {
//	var xhttp;
//	var content = document.getElementById("comment-area").value;
//	var url = "CommentsAction?Action=insert&idmovie=" + idmovie + "&Content=" + content;
//	if (window.XMLHttpRequest) {
//		xhttp = new XMLHttpRequest();
//	} else {
//		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
//	}
//	xhttp.onreadystatechange = function() {
//		if (xhttp.readyState == 4) {
////			var data = xhttp.responseText;
//			document.getElementById("comment-area").value = "";
//		}
//	}
//	xhttp.open("POST", url, true);
//	xhttp.send();
//}



