
var page=1;
var ispage=false;
var issearch=false;

function operate() {
	setTimeout("disappeare()", 3000);
}
function disappeare() {
	document.getElementById('Msg').innerHTML = "";
}

function Init(){
	getInfo();
	getKeyWrods();
}

function getInfo() {
	var AjaxURL = "../getUserInfo";
	$.ajax({
		type : "POST",
		dataType : "html",
		url : AjaxURL,
		success : function(result) {
				data = result;
				var obj = eval("(" + data + ")");
				if (obj["status"] == "200") {
					document.getElementById("userinfo").innerText = obj["nickname"];
				} else {
					document.getElementById("Msg").innerText = obj["msg"];
					operate();
				}
		},
		error : function(data) {
			document.getElementById("Msg").innerText = "服务器忙！请稍后重试。";
			operate();
		}
	});
}

function AjaxLogout() {
	var AjaxURL = "../logout";
	$.ajax({
		type : "POST",
		dataType : "html",
		url : AjaxURL,
		success : function(result) {
			location="./static/KeyWords.html";
		},
		error : function(data) {
			document.getElementById("Msg").innerText = "服务器忙！请稍后重试。";
			operate();
		}
	});
}

function getKeyWrods() {
	if(!ispage)
		page=1;
	var s="search";
	if(issearch)
		s=document.getElementById("searchText").value;
	
	var AjaxURL = "../getKeyWords?Search=" + s + "&type=" + document.getElementById("select_t").value + "&page=" + page;
	$.ajax({
		type : "Get",
		dataType : "html",
		url : AjaxURL,
		success : function(result) {
				data = result;
				var objs = eval("(" + data + ")");
				objs = objs["keyWords"];
				var html="";
				try 
				{ 
					if(objs.length<10)
						document.getElementById("next").hidden = true;
					else
						document.getElementById("next").hidden = false;
					
					if(page=="1"){
						document.getElementById("back").hidden = true
					}else
						document.getElementById("back").hidden = false;
				} 
				catch (e) 
				{
				} 
				if(objs.length>0){
					for (var i=0;i<objs.length;i++)
					{
						//var obj= eval("(" + objs[i] + ")");
						html += "<tr><td class=\"avatar\">" + (i+1) + "</td><td>"+objs[i]["keyword"]+"</td><td>"+objs[i]["describes"]+"</td><td>"+objs[i]["uses"]+"</td></tr>";
					}
					document.getElementById("keyWords").innerHTML = html;
				}else
					document.getElementById("keyWords").innerHTML = "<tr><td class=\"avatar\">1</td><td>系统提示</td><td>查询结果</td><td>查询结果为空，请检查查询条件</td></tr>";

		},
		error : function(data) {
			document.getElementById("Msg").innerText = "服务器忙！请稍后重试。";
			operate();
		}
	});
}

function LastPage(){
	ispage=true;
	if(page>1)
		page=page-1;
	getKeyWrods();
	ispage=false;
}

function NextPage(){
	ispage=true;
	page=page+1;
	getKeyWrods();
	ispage=false;
}

function searchKey(){
	issearch=true;
	getKeyWrods();
	issearch=false;
}

