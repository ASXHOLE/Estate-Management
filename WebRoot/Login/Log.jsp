<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<link href="css/login.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />
<title>小区物业管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/usernameField.js" type="text/javascript"></script>
</head>

<body>
	<div align="center">
		<p class="slogan"
			align="center">欢迎使用小区物业管理系统</p>
	</div>


	<div class="login-aside">
		<div id="o-box-up"></div>
		<div id="o-box-down" style="table-layout:fixed;">


			<form class="registerform" action="loginServlet">
				<div class="fm-item">
					<label for="logonId" class="label-login">系统登陆：</label> 
					<input
						type="text" value="输入账号" maxlength="100" name="account"
						id="username" class="i-text">

				</div>

				<div class="fm-item">
					<label for="logonId" class="form-label">登陆密码：</label> 
					<input
						type="password" value="" maxlength="100" name="password"
						id="password" class="i-text">
					<div class="ui-form-explain"></div>
				</div>



				<div class="fm-item">
					<label for="logonId" class="form-label"></label> 
					<input
						type="submit" value="" tabindex="4" id="send-btn"
						class="btn-login"> 
						<input type="reset" value="重置"
						class="btn-Reset">
					<div class="ui-form-explain"></div>
				</div>

			</form>

		</div>

	</div>

</body>

</html>
