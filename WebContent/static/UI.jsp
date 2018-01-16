<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<!-- The Main CSS File -->
<link rel="stylesheet" href="./CSS/style.css">
<script src="./Javascript/jquery.min.js"></script>
<script src="./Javascript/UI.js"></script>

</head>
<body onload="SearchAll()">
	<header>
		<div id="formbackground" class="logo_r"
			style="position: absolute; z-index: -1;">
			<a href="index.jsp" Title="autoTest框架"> <img
				src="../static/Images/Testlogo.png" alt="Testlogo">
			</a>
		</div>
	</header>

	<div class="wrapper small_menu">
		<ul class="menu_small_buttons">
			<li><a title="General Info" class="i_22_dashboard"
				href="./index.jsp"></a></li>
			<li><a title="Your Messages" class="i_22_inbox smActive"
				href="./inbox.jsp"></a></li>
			<li><a title="Visual Data" class="i_22_charts" href="./UI.jsp"></a></li>
			<li><a title="Kit elements" class="i_22_ui"
				href="./Interface.jsp"></a></li>
			<li><a title="Some Rows" class="i_22_tables" href="./tables.jsp"></a></li>
		</ul>
	</div>

	<aside class="sidebar">
		<ul class="tab_nav">
			<li class="i_32_dashboard"><a href="../index.jsp"
				title="General Info"> <span class="tab_label">Home Page</span> <span
					class="tab_info">Frame Info</span>
			</a></li>
			<li class="active_tab i_32_charts"><a href="./UI.jsp"
				title="Visual Data"> <span class="tab_label">自动化测试</span> <span
					class="tab_info">Edit and Run</span>
			</a></li>
			<li class="i_32_tables"><a href="./tables.jsp" title="Some Rows">
					<span class="tab_label">调试工具</span> <span class="tab_info">Res
						Table</span>
			</a></li>
		</ul>
	</aside>

	<div class="contents2">
		<div class="grid_wrapper">
			<h3 id="Msg"
				style="position: absolute; top: 3px; left: 42%; color: red;"></h3>
			<img id="load" title="正在运行" src="./Images/Loading.gif"
				style="position: absolute; left: 43%; top: 50px;" hidden>
			<div style="float:right;">
				<img src="./Images/debug.png" onClick="clickDebug();"></img>
				<a id="debug" href='autoTest://"debug" "debug" "2" "3" "4"' style="position: relative;top: -3px;">我要调试</a> <a style="position: relative;top: -3px;">&nbsp&nbsp</a>
				<a id="user" style="position: relative;top: -3px;"></a>
				<img src="./Images/user.png"></img>
				<a id="login" href="javascript:showLogin();" style="position: relative;top: -3px;">登录</a> <a id="logout" href="javascript:showLogout();" style="position: relative;top: -3px;"></a>
			</div>

			<div id="Box_img">
				<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
					id="closeBtn">X</a> <img id="Big_img" class="Big_img"
					src="./imgs/1.jpg"
					onclick='document.getElementById("closeBtn").click();'>
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

			<div id="delBox">
				<div class="row1">
					删除测试用例<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
						id="closeBtn">X</a>
				</div>
				<form id="delForm" name="delForm" action="" method="post">
					<h3 style="text-align: center;">
						<br> <font id="delText" color="red">
							删除操作是不可逆的，你确定删除这条测试用例？ </font>
					</h3>
				</form>
				<div class="row2">
					<a href="javascript:document:closeBtn.click();" id="loginbtn"
						onclick='delCase(document.getElementById("delForm").name,document.getElementById("EditForm").name)'>删除</a>
					<a href="#" id="Cancelbtn"
						onclick='document.getElementById("closeBtn").click();'>取消</a>
				</div>
			</div>
			
			<div class="g_t">
				<div>
					<span class="label"><a class="word">UI自动化</a></span>
				</div>
				<div>
					<span class="label">Your UI Cases Upload And Run</span>
				</div>
				<div class="widget_header">
					<h4 class="widget_header_title wwIcon i_16_charts">&nbsp&nbsp上传用例:</h4>
					<form id="fileUpload" action="" enctype="multipart/form-data"
						method="post">
						<input class="option_left" id="UI" name="UI" type="file"
							accept="application/vnd.ms-excel"/>
						<img class="option_right" title="执行选中用例" src="./Images/Icons/16/upLoad.png"
							onclick='javascript:ajaxSubmitForm("UI");' /> <a class="option_right1"
							href='javascript:ajaxSubmitForm("UI");'>&nbsp&nbsp上传</a>
						<a class="res" href='autoTest://"debug" "result" "2" "3" "4"'>查看本地结果</a>
					</form>
					<h4 class="widget_header_title wwIcon i_16_charts">&nbsp&nbsp用例运行:&nbsp&nbsp&nbsp</h4>
					<form id="Cases" action="post">
						<select name="select" id="select_UI" class="option_left1">
							<option value="选择用例">选择用例</option>
						</select> <img class="option_right" title="执行选中用例" src="./Images/Icons/16/run.png"
							onclick="javascript:runExe('UI');" /> <a class="option_right1"
							href="javascript:runExe('UI');">&nbsp&nbsp运行</a>
							<a id="run" href=""></a>
					</form>
				</div>
				
				<div>
					<span class="label"><a class="word">&nbsp</a></span>
				</div>
				<div>
					<span class="label"><a class="word">APP自动化</a></span>
				</div>
				<div>
					<span class="label">Your APP Cases Upload And Run</span>
				</div>
				<div class="widget_header">
					<h4 class="widget_header_title wwIcon i_16_charts">&nbsp&nbsp上传用例:</h4>
					<form id="fileUpload" action="" enctype="multipart/form-data"
						method="post">
						<input class="option_left" id="APP" name="APP" type="file"
							accept="application/vnd.ms-excel"/>
						<img class="option_right" title="执行选中用例" src="./Images/Icons/16/upLoad.png"
							onclick='javascript:ajaxSubmitForm("APP");' /> <a class="option_right1"
							href='javascript:ajaxSubmitForm("APP");'>&nbsp&nbsp上传</a>
					</form>
					<h4 class="widget_header_title wwIcon i_16_charts">&nbsp&nbsp用例运行:&nbsp&nbsp&nbsp</h4>
					<form id="Cases" action="post">
						<select name="select" id="select_APP" class="option_left1">
							<option value="选择用例">选择用例</option>
						</select> <img class="option_right" title="执行选中用例" src="./Images/Icons/16/run.png"
							onclick="javascript:runExe('APP');" /> <a class="option_right1"
							href="javascript:runExe('APP');">&nbsp&nbsp运行</a>
							<a id="run" href=""></a>
					</form>
				</div>
				
				
				<div>
					<span class="label"><a class="word">&nbsp</a></span>
				</div>
				<div>
					<span class="label"><a class="word">接口自动化</a></span>
				</div>
				<div>
					<span class="label">Your Interface Cases Upload And Run</span>
				</div>
				<div class="widget_header">
					<h4 class="widget_header_title wwIcon i_16_charts">&nbsp&nbsp上传用例:</h4>
					<form id="fileUpload" action="" enctype="multipart/form-data"
						method="post">
						<input class="option_left" id="Interface" name="Interface" type="file"
							accept="application/vnd.ms-excel"/>
						<img class="option_right" title="执行选中用例" src="./Images/Icons/16/upLoad.png"
							onclick='javascript:ajaxSubmitForm("Interface");' /> <a class="option_right1"
							href='javascript:ajaxSubmitForm("Interface");'>&nbsp&nbsp上传</a>
					</form>
					<h4 class="widget_header_title wwIcon i_16_charts">&nbsp&nbsp用例运行:&nbsp&nbsp&nbsp</h4>
					<form id="Cases" action="post">
						<select name="select" id="select_Interface" class="option_left1">
							<option value="选择用例">选择用例</option>
						</select> <img class="option_right" title="执行选中用例" src="./Images/Icons/16/run.png"
							onclick="javascript:runExe('Interface');" /> <a class="option_right1"
							href="javascript:runExe('Interface');">&nbsp&nbsp运行</a>
							<a id="run" href=""></a>
					</form>
				</div>
				
				<section id="conter">
						<section id="help-left">
							<a href="#" id="pop1"> </a> <a href="#" id="del"> </a> <a
								href="#" id="pop2"> </a> <a href="#" id="pop_msg"> </a>
						</section>
						<section id="help-right"></section>
					</section>
				</form>
			</div>
		</div>
	</div>
</body>
</html>