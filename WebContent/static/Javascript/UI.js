$(function($) {
	$("#pop").hover(function() {
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
		$("#EditBox").fadeIn("slow");
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
		$("#EditBox").fadeOut("fast");
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
	$("#pop_img").hover(function() {
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
		$("#Box_img").fadeIn("slow");
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
		$("#Box_img").fadeOut("fast");
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

window.onresize = function() {
	resize();
};
function resize() {
	$('#formbackground').height($(window).height() * 0.08);
	$('#formbackground').width($(window).width() * 0.99);
}

function operate() {
	setTimeout("disappeare()", 3000);
}
function disappeare() {
	document.getElementById('Msg').innerHTML = "";
}

function popdel(id1, id2) {
	document.getElementById("del").click();
	document.getElementById("delForm").name = id1;
	document.getElementById("EditForm").name = id2;
	document.getElementById("delText").innerText = "删除操作是不可逆的，你确定删除这个用例？";
}

function Show_img(img) {
	document.getElementById("Big_img").src = img;
}

function setCookie(name, value) {
	//var Days = 30;
	//var exp = new Date();
	//exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
	document.cookie = name + "=" + escape(value) + "; Path=/dnAT";
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

function runExe(type) {
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var url = "../runCases";
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
				var filename = "";
				if(type == "UI"){
					filename = document.getElementById("select_UI").value;
				}
				
				if(type == "APP"){
					filename = document.getElementById("select_APP").value;
				}
				
				if(type == "Interface"){
					filename = document.getElementById("select_Interface").value;
				}
				if(filename=="" || filename==" " || filename=="选择用例"){
					document.getElementById("Msg").innerText = "请先选择要运行的用例";
					operate();
				}else{
					document.getElementById("run").href = "autoTest://\"run\" \"" +obj["url"] + "\" \"" + filename + "\" \"" + getCookie("sid") + "\" \"" + type + "\"";
					document.getElementById("run").click();
				}
			}else{
				pops("pop_msg");
				document.getElementById("msgText").innerText = obj["msg"];
			}
	};
	
}

function SearchAll() {

	resize();
	if(getCookie("islogin")=="1"){
		getInfo();
	}
	
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var url = "../getCases";
	var data = "";
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4)
			if (xmlhttp.status == 200)
				data = xmlhttp.responseText;
		// alert(data);
		var obj = eval("(" + data + ")");
		if (obj != null)
			if (obj["status"] == "200") {
				var c = "";
				document.getElementById("select_UI").innerHTML = "<option value=\"选择用例\">选择用例</option>";
				for (var i = 0; i < obj["UI"].length; i++) {
					c = "case" + (i + 1);
					document.getElementById("select_UI").innerHTML += "<option value=\""
							+ obj["UI"][i][0][c]
							+ "\">"
							+ obj["UI"][i][0][c] + "</option>"
				}
				
				document.getElementById("select_APP").innerHTML = "<option value=\"选择用例\">选择用例</option>";
				for (var i = 0; i < obj["APP"].length; i++) {
					c = "case" + (i + 1);
					document.getElementById("select_APP").innerHTML += "<option value=\""
							+ obj["APP"][i][0][c]
							+ "\">"
							+ obj["APP"][i][0][c] + "</option>"
				}
				
				document.getElementById("select_Interface").innerHTML = "<option value=\"选择用例\">选择用例</option>";
				for (var i = 0; i < obj["Interface"].length; i++) {
					c = "case" + (i + 1);
					document.getElementById("select_Interface").innerHTML += "<option value=\""
							+ obj["Interface"][i][0][c]
							+ "\">"
							+ obj["Interface"][i][0][c] + "</option>"
				}
			}

	};
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
	var url = "../logout";
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

function getInfo(){
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	var url = "";
	document.getElementById("delText").innerText = "正在删除，请等待...";
	url = "../getUserInfo?loginName=" + getCookie("loginName");
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


function AjaxSubmit() {
	var AjaxURL = "../runCases";
	$.ajax({
		type : "POST",
		dataType : "html",
		url : AjaxURL,
		data : $('#Cases').serialize(),
		success : function(result) {
			var obj = eval("(" + result + ")");
			if (obj["status"] == "200") {
				document.getElementById("Msg").innerText = obj["msg"];
				operate();
			} else {
				pops("pop_msg");
				document.getElementById("msgText").innerText = obj["msg"];
			}
		},
		error : function(data) {
			document.getElementById("msgText").innerText = "服务器忙...";
		}
	});
}

function AjaxLogin() {
	var AjaxURL = "../login";
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

function ajaxSubmitForm(file) {
	var value = document.getElementById(file).value;
	if (value == "") {
		document.getElementById("Msg").innerText = "请先选择文件";
		operate();
		return false;
	}
	if (!value.match(/.xls/i)) {
		document.getElementById("Msg").innerText = "文件格式错误";
		return false;
	}
	
	var formData = new FormData();
	formData.append(file, $("#"+file)[0].files[0]);
	$.ajax({
		url : "../Upload",
		type : 'POST',
		data : formData,
		// 告诉jQuery不要去处理发送的数据
		processData : false,
		// 告诉jQuery不要去设置Content-Type请求头
		contentType : false,
		beforeSend : function() {
			pops("pop_msg");
			document.getElementById("msgText").innerText = "正在上传，请稍等...";
		},
		success : function(responseStr) {
			var obj = eval("(" + responseStr + ")");
			if (obj["status"] == "200") {
				document.getElementById("closeBtn_msg").click();
				document.getElementById("Msg").innerText = obj["msg"];
				operate();
				SearchAll();
			} else {
				document.getElementById("closeBtn_msg").click();
				document.getElementById("Msg").innerText = obj["msg"];
				operate();
			}
		},
		error : function(responseStr) {
			document.getElementById("closeBtn_msg").click();
			document.getElementById("Msg").innerText = "服务器忙，请稍后重试！";
			operate();
		}
	});
}

function clickDebug(){
	document.getElementById("debug").click();
}
