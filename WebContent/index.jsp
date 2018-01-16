<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<!-- The Main CSS File -->
<link rel="stylesheet" href="./static/CSS/style.css">
<script src="./static/Javascript/jquery.min.js"></script>
<script src="./static/Javascript/index.js"></script>
</head>

<body onload="AllKeyWords()">
	<header>
		<div id="formbackground" class="logo_r"
			style="position: absolute; z-index: -1;">
			<a href="index.jsp" Title="autoTest框架"> <img
				src="./static/Images/Testlogo.png" alt="Testlogo">
			</a>
		</div>
	</header>

	<aside class="sidebar">
		<ul class="tab_nav">
			<li class="active_tab i_32_dashboard"><a href="index.jsp"
				title="General Info"> <span class="tab_label">Home Page</span> <span
					class="tab_info">Frame Info</span>
			</a></li>
			<li class="i_32_charts"><a href="./static/UI.jsp"
				title="Visual Data"> <span class="tab_label">自动化测试</span> <span
					class="tab_info">Edit and Run</span>
			</a></li>
			<li class="i_32_tables"><a href="./static/tables.jsp"
				title="Some Rows"> <span class="tab_label">调试工具</span> <span
					class="tab_info">Res Table</span>
			</a></li>
		</ul>
	</aside>
	<div class="contents2">
		<div class="grid_wrapper">
			<div class="g_6 contents_header">
				<h3 class="i_16_message tab_label">KeyWords</h3>
				<h3 id="Msg"
					style="position: relative; top: -45px; float: right; color: red;"></h3>
				<div>
					<span class="label">Your KeyWord Discribe And Use Demo</span>
				</div>
			</div>

			<div style="float: right;">
				<a id="user" style="position: relative; top: -3px;"></a><img
					src="./static/Images/user.png"></img> <a id="login"
					href="javascript:showLogin();"
					style="position: relative; top: -3px;">登录</a> <a id="logout"
					href="javascript:showLogout();"
					style="position: relative; top: -3px;"></a>
			</div>

						<div id="loginBox">
				<div class="row1">
					登录<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						id="closeBtn">X</a>
				</div>
				<form id="loginForm" method="post"
					onsubmit="AjaxLogin();">
					<p class="p_input">
					<div class="p_cli1"><a style="left:2px; position: relative;">用户名</a><input id="loginName" name="loginName" type="text"
							value="" class="c_input" style="left:6px; position: relative;"/>
					</div>
					<div class="p_cli2"><a style="left:6px; position: relative;">密</a><a style="left:11px; position: relative;">码</a><input id="Pwd" name="Pwd" type="password"
							value="" class="c_input" style="left:20px; position: relative;"/>
					</div>
				</form>
				<div class="row2">
					<a href="javascript:AjaxLogin(); " id="loginbtn">登录</a>
					<a href="#" id="Cancelbtn"
						onclick='document.getElementById("closeBtn").click();'>取消</a>
				</div>
			</div>

			<div id="msgBox">
				<div class="row1">
					异常信息！<a href="javascript:void(0)" title="关闭窗口"
						class="close_btn_msg" id="closeBtn_msg">X</a>
				</div>
				<form id="msgForm" name="msgForm" action="" method="post">
					<h3 style="text-align: center;">
						<br> <font id="msgText" color="red"> 服务器忙... </font>
					</h3>
				</form>
			</div>

			<div id="EditBox2">
				<div class="row1">
					关键字说明<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						id="closeBtn">X</a>
				</div>
				<form id="EditForm2" onsubmit="">

					<div class="p_cli1">
						<h3 id="keyName2" style="position: absolute; top: -50px;">关键字</h3>
						<textarea id="Describe2"
							style="width: 650px; height: 60px; position: relative; top: 5px;">关键字描述</textarea>
						<textarea id="useCase2"
							style="width: 650px; height: 100px; position: relative; top: 20px;">关键字用法</textarea>
					</div>
				</form>
			</div>

			<div id="delBox">
				<div class="row1">
					删除关键字<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						id="closeBtn">X</a>
				</div>
				<form id="delForm" name="delForm" action="" method="post">
					<h3 style="text-align: center;">
						<br> <font id="delText" color="red">
							删除操作是不可逆的，你确定删除这个关键字？ </font>
					</h3>
				</form>
				<div class="row2">
					<a href="javascript:document:closeBtn.click();" id="loginbtn"
						onclick='delKey(document.getElementById("delForm").name)'>删除</a> <a
						href="#" id="Cancelbtn"
						onclick='document.getElementById("closeBtn").click();'>取消</a>
				</div>
			</div>

			<div class="g_t">
				<form id="CheckForm" method="get">
					<div class="widget_header">
						<h4 class="widget_header_title wwIcon i_16_charts">Options:&nbsp&nbsp</h4>
						<select name="select_type" id="select_t" onclick="searchKey()">
							<option value="-1">选择类型</option>
							<option value="0">系统关键字</option>
							<option value="1">UI关键字</option>
							<option value="2">接口关键字</option>
							<option value="3">APP关键字</option>
						</select> <input id="searchText" type="text" value="Search"
							class="c_input_Search"
							onkeydown='if(event.keyCode==13){searchKey()}'
							onfocus='if(this.value=="Search"){this.value=""}'
							onblur='if(this.value==""){this.value="Search"}' /> <img
							id="searchImg" title="搜索 "
							src="./static/Images/Icons/16/Search.png"
							style="position: relative; top: 11px; left: 125px; cursor: pointer; float: right;"
							onclick='searchKey()' />
					</div>
					<section id="conter">
						<section id="help-left">
							<a href="#" id="pop1"> </a> <a href="#" id="del"> </a> <a
								href="#" id="pop2"> </a> <a href="#" id="pop_msg"> </a>
						</section>
						<section id="help-right"></section>
					</section>
				</form>
				<table id="key_t" class="bordered">
					<thead>
						<tr>
							<th class="r1">id</th>
							<th class="r1">类型</th>
							<th class="r2">关键字</th>
							<th class="r3">描述</th>
							<th>使用方法</th>
						</tr>
					</thead>
					<tr>
						<td class="r1">0</td>
						<td class="r1">0</td>
						<td class="r2">0</td>
						<td class="r3">没有查询到对应关键字</td>
						<td>error:null</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

</body>
</html>