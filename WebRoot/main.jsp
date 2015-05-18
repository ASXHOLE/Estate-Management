<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link href="css/mainPage.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />
    <base href="<%=basePath%>"> 
    
    <title>主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/Logout.js" type="text/javascript"></script>
  </head>
  
  
  <body>
    <%
		//读取session进行权限判断
		try {
			String role;
			//out.println(request.getSession().getAttribute("role"));
			role = request.getSession().getAttribute("role").toString();

			if (!role.isEmpty()) {

			} else {%>
				<script>
				
				if(confirm("你还没有登录或没有权限访问该网页，请先登录！"))
				    {//如果是true ，那么就把页面转向
				        location.href="Login/Log.jsp";
				    }
				    else
				    {//选择取消键
				        location.href="Login/Log.jsp";
				    }		
			</script>
			<%}
		} catch (NullPointerException e) {%>
		
			<script>
				
				if(confirm("你还没有登录或没有权限访问该网页，请先登录！"))
				    {//如果是true ，那么就把页面转向
				        location.href="Login/Log.jsp";
				    }
				    else
				    {//选择取消键
				        location.href="Login/Log.jsp";
				    }		
			</script>
			<%
		}
	%>
	<p class="slogan"
			align="center">欢迎使用小区物业管理系统</p>
	<div align="center"  id="menu">
	
    <input type="button" value="楼宇信息管理" class="btn"  onclick="javascript:window.location.href='mainServlet?method=building'">
    <input type="button" value="来访人员登记" class="btn"  onclick="javascript:window.location.href='mainServlet?method=visitor'">
    <input type="button" value="来访人员黑名单管理" class="btn"  onclick="javascript:window.location.href='mainServlet?method=blacklist'">
    <input type="button" value="小区收费系统" class="btn"  onclick="javascript:window.location.href='mainServlet?method=fee'">
    <input type="button" value="注销登录" class="btn"  onclick="logout()">
    
    </div>
  </body>
</html>
