$(function($) {
	$("#pop1").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.6'
		}, 1000);
	}).on('click', function() {
		$("body").append("<div id='mask'></div>");
		$("#mask").addClass("mask").fadeIn("slow");
		$("#loginBox").fadeIn("slow");
	});
	$(".close_btn").hover(function() {
		$(this).css({
			color : 'black'
		});
	}, function() {
		$(this).css({
			color : '#999'
		});
	}).on('click', function() {
		$("#loginBox").fadeOut("fast");
		$("#mask").css({
			display : 'none'
		});
	});
	$("#loginbtn").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.8'
		}, 1000);
	});
});

$(function($) {
	$("#pop2").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.6'
		}, 1000);
	}).on('click', function() {
		$("body").append("<div id='mask'></div>");
		$("#mask").addClass("mask").fadeIn("slow");
		$("#EditBox2").fadeIn("slow");
	});
	$(".close_btn").hover(function() {
		$(this).css({
			color : 'black'
		});
	}, function() {
		$(this).css({
			color : '#999'
		});
	}).on('click', function() {
		$("#EditBox2").fadeOut("fast");
		$("#mask").css({
			display : 'none'
		});
	});
	$("#loginbtn").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.8'
		}, 1000);
	});
});

$(function($) {
	$("#del").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.6'
		}, 1000);
	}).on('click', function() {
		$("body").append("<div id='mask'></div>");
		$("#mask").addClass("mask").fadeIn("slow");
		$("#delBox").fadeIn("slow");
	});
	$(".close_btn").hover(function() {
		$(this).css({
			color : 'black'
		});
	}, function() {
		$(this).css({
			color : '#999'
		});
	}).on('click', function() {
		$("#delBox").fadeOut("fast");
		$("#mask").css({
			display : 'none'
		});
	});
	$("#loginbtn").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.8'
		}, 1000);
	});
});

$(function($) {
	$("#pop_msg").hover(function() {
		$(this).stop().animate({
			opacity : '1'
		}, 600);
	}, function() {
		$(this).stop().animate({
			opacity : '0.6'
		}, 1000);
	}).on('click', function() {
		$("body").append("<div id='mask'></div>");
		$("#mask").addClass("mask").fadeIn("slow");
		$("#msgBox").fadeIn("slow");
	});
	$(".close_btn_msg").hover(function() {
		$(this).css({
			color : 'black'
		});
	}, function() {
		$(this).css({
			color : '#999'
		});
	}).on('click', function() {
		$("#msgBox").fadeOut("fast");
		$("#mask").css({
			display : 'none'
		});
	});
});


function operate() {
	setTimeout("disappeare()", 2000);
}
function disappeare() {
	document.getElementById('Msg').innerHTML = "";
}

function pops(id) {
	document.getElementById(id).click();
}

function popdel(id, id1) {
	document.getElementById(id).click();
	document.getElementById("delText").innerText = "删除操作是不可逆的，你确定删除这个用例？";
	document.getElementById("delForm").name = id1;
}

function delKey(id) {
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var url = "";
	document.getElementById("delText").innerText = "正在删除，请等待...";
	url = "./delKey?id=" + id;
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4)
			if (xmlhttp.status == 200) {
				var ret = xmlhttp.responseText;
				if (ret == 1) {
					document.getElementById("Msg").innerText = "删除成功！";
					operate();
					document.getElementById("closeBtn").click();
					document.getElementById("searchImg").click();
				} else
					document.getElementById("delText").innerText = "删除失败，请重试！";
			} else {
				document.getElementById("delText").innerText = "删除失败，请重试！";
			}

	};
	document.getElementById("delText").innerText = "删除操作是不可逆的，你确定删除这个关键字？";
}

window.onresize = function() {
	resize();
};
function resize() {
	$('#formbackground').height($(window).height() * 0.08);
	$('#formbackground').width($(window).width() * 0.99);
}

function AllKeyWords() {
	resize();
	if(getCookie("islogin")=="1"){
		getInfo();
	}
	searchKey();
}

function searchKey() {

	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var url = "./SearchKey?Search=" + document.getElementById("searchText").value + "&type=" + document.getElementById("select_t").value;
	var data = "";
	xmlhttp.open("get", url, true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4)
			if (xmlhttp.status == 200)
				data = xmlhttp.responseText;
		//alert(data);
		document.getElementById("key_t").innerHTML = data;
	};
}

function getInfo(){
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var url = "";
	document.getElementById("delText").innerText = "正在删除，请等待...";
	url = "./getUserInfo?loginName=" + getCookie("loginName");
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4)
			if (xmlhttp.status == 200) {
				data = xmlhttp.responseText;
				var obj = eval("(" + data + ")");
				if (obj["status"] == "200") {
					document.getElementById("user").innerText = obj["nickname"];
					document.getElementById("login").innerHTML = "";
					document.getElementById("logout").innerHTML = "退出";
					operate();
				} else {
					document.getElementById("user").innerText = "";
					document.getElementById("login").innerHTML = "";
					document.getElementById("logout").innerHTML = "退出";
					//document.getElementById("msgText").innerText = obj["msg"];
				}
			}
	};
}

function setCookie(name, value) {
	//var Days = 30;
	//var exp = new Date();
	//exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
	document.cookie = name + "=" + escape(value); //+ ";expires="+ exp.toGMTString();
}

function getCookie(name) {
	var arr = document.cookie.split('; ');
	var i = 0;
	for (i = 0; i < arr.length; i++) {
		// arr2->['username', 'abc']
		var arr2 = arr[i].split('=');

		if (arr2[0] == name) {
			var getC = decodeURIComponent(arr2[1]);
			return getC;
		}
	}

	return '';
}

function pops(id) {
	document.getElementById(id).click();
}

function showLogout() {

	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var url = "./logout";
	var data = "";
	xmlhttp.open("post", url, true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4)
			if (xmlhttp.status == 200)
				data = xmlhttp.responseText;
		// alert(data);
		var obj = eval("(" + data + ")");
		if (obj != null)
			if (obj["status"] == "200") {
				document.getElementById("user").innerHTML = "";
				setCookie("islogin", "0");
				document.getElementById("login").innerHTML = "登录";
				document.getElementById("logout").innerHTML = "";
			} else {
				pops("pop_msg");
				document.getElementById("msgText").innerText = obj["msg"];
			}

	};
}

function showLogin() {
	pops("pop1");
	document.getElementById("loginName").value = getCookie("loginName");
}


function AjaxLogin() {
	var AjaxURL = "./login";
	$.ajax({
		type : "POST",
		dataType : "html",
		url : AjaxURL,
		data : $('#loginForm').serialize(),
		success : function(result) {
			var obj = eval("(" + result + ")");
			if (obj["status"] == "200") {
				document.getElementById("user").innerHTML = obj["nickname"].replace("'", "\"");
				setCookie("loginName",
						document.getElementById("loginName").value);
				setCookie("islogin", "1");
				setCookie("sid", obj["sessionid"]);
				document.getElementById("login").innerHTML = "";
				document.getElementById("logout").innerHTML = "退出";
				document.getElementById("closeBtn").click();
			} else {
				pops("pop_msg");
				document.getElementById("msgText").innerText = obj["msg"];
			}
		},
		error : function(data) {
			pops("pop_msg");
			document.getElementById("msgText").innerText = "服务器忙！请稍后重试。";
		}
	});
}