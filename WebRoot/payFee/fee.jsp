<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>请选择功能</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style type="text/css">
	  body{
		  background:url("img/Login_bg.jpg");
		  background-size:1400px 768px;
	  }
  </style>
  
  <body>
  <%
		//读取session进行权限判断
		try {
			String role;
			//out.println(request.getSession().getAttribute("role"));
			role = request.getSession().getAttribute("role").toString();
			if(role.isEmpty()||role.equals(null)){%>
			<script>
				
				if(confirm("你还没有登录，请先登录！"))
				    {//如果是true ，那么就把页面转向
				        location.href="../Login/Log.jsp";
				    }
				    else
				    {//选择取消键
				        location.href="../Login/Log.jsp";
				    }		
			</script>
			<%}else if (role.equals("4")||role.equals("5")) {
			
			} else {%>
				<script>
				
				if(confirm("你没有权限访问该网页"))
				    {//如果是true ，那么就把页面转向
				        location.href="../main.jsp";
				    }
				    else
				    {//选择取消键
				        location.href="../main.jsp";
				    }		
			</script>
			<%}
		} catch (NullPointerException e) {%>
		
			<script>
				
				if(confirm("你没有权限访问该网页或者,请重新登录！"))
				    {//如果是true ，那么就把页面转向
				        location.href="../Login/Log.jsp";
				    }
				    else
				    {//选择取消键
				        location.href="../Login/Log.jsp";
				    }	
			</script>
			<%
		}
	%>
  <div align="center">
    <form action="./feeModule?method=addFee" method="post">
    	<input type="submit" value="添加收费" style="width: 300px; height: 80px;font-size: 30px">
    </form>
    <form action="./feeModule?method=checkFee" method="post">
    	<input type="submit" value="查询收费" style="width: 300px; height: 80px;font-size: 30px">
    </form>
    <form action="./feeModule?method=pay" method="post">
    	<input type="submit" value="缴费程序" style="width: 300px; height: 80px;font-size: 30px">
    </form>
    </div>
  </body>
</html>
