
var page=1;
var ispage=false;
var issearch=false;
var table=1;

function operate() {
	setTimeout("disappeare()", 3000);
}
function disappeare() {
	document.getElementById('Msg').innerHTML = "";
}

function Init(){
	getInfo();
	getRess();
	//document.getElementById("myTable").style.display="none";
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

function getRess() {
	if(!ispage)
		page=1;
	var s="search";
	if(issearch)
		s=document.getElementById("searchText").value;
	
	var AjaxURL = "../getRess?page=" + page;
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
						html += "<tr><td class=\"avatar\">" + (i+1) + "</td><td>"+objs[i]["resname"]+"</td><td>"+objs[i]["casecount"]+"</td><td>"+objs[i]["pass"]+"</td><td>"+objs[i]["fail"]+"</td><td class=\""+objs[i]["status"]+"\">"+objs[i]["status"]+"</td><td>"+objs[i]["rtime"]+"</td><td><a href=\"javascript:Details('"+objs[i]["id"]+"')\">查看</a><a class=\"DEL\" href=\"javascript:Delete('"+objs[i]["id"]+"')\">删除</a></td></tr>";
					}
					document.getElementById("keyWords").innerHTML = html;
				}else
					document.getElementById("keyWords").innerHTML = "<tr><td class=\"avatar\">1</td><td>系统提示</td><td>查询结果</td><td>结果</td><td>结果</td><td>结果</td><td>结果</td><td>查询结果为空，请检查查询条件</td></tr>";

		},
		error : function(data) {
			document.getElementById("Msg").innerText = "服务器忙！请稍后重试。";
			operate();
		}
	});
}

function Details(id){
	var AjaxURL = "../getRes?id="+id;
	var html1="<table id=\"table1\" class=\"highchart\" data-graph-container-before=\"1\"data-graph-type=\"pie\" style=\"position: relative; top: -10px; display:none;\"><caption>";
	$.ajax({
		type : "get",
		dataType : "html",
		url : AjaxURL,
		success : function(result) {
			var obj = eval("(" + result + ")");
			if (obj["status"] == "200") {
				html1+=obj["resname"] + "统计结果" + "</caption><thead><tr><th>统计项</th><th>数量</th></tr></thead><tbody><tr><td>总量</td><td>"+obj["casecount"]+"</td></tr><tr><td>Fail</td><td>"+obj["fail"]+"</td></tr><tr><td>PASS</td><td>"+obj["pass"]+"</td></tr></tbody></table>";
				document.getElementById("table1").outerHTML=html1;
				html1="<a id=\"download\" href=\"../download?filename="+obj["resname"]+"&type=res\">下载结果文件</a>";
				document.getElementById("download").outerHTML=html1;
				document.getElementById("myTable").style.display="none";
				document.getElementById("next").hidden = true;
				 $('table.highchart').highchartTable();
			} else {
				document.getElementById("Msg").innerText = "没有该记录的结果信息！";
				operate();
			}
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
	getRess();
	ispage=false;
}

function NextPage(){
	ispage=true;
	page=page+1;
	getRess();
	ispage=false;
}

function getRes(){
	issearch=true;
	getKeyWrods();
	issearch=false;
}

