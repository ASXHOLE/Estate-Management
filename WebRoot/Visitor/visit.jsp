<%@ page language="java" import="java.util.*,java.text.*"
	contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<title>来访人员录入</title>

</head>

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
			<%}else if (role.equals("3")||role.equals("5")) {
			
			} else {
				System.out.println(role);
			%>
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
		来访人员登记
		<form action="VisitServlet" name="VisitFrom" method="post">
			<table border="0" align="center">
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>身份证：</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>日期：</td>
					<td><input type="text" name="date"
						value="
    <% 
     Date currentTime = new Date(); 
     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
     String dateString = formatter.format(currentTime).trim();
     out.print(dateString);
     %>">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="提交">
						<a href="./Visitor/list.jsp">查询登记名单</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
