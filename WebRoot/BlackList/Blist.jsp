<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>黑名单记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
	<jsp:useBean id="people" scope="page" class="com.People_Bean.People" />
	<jsp:setProperty name="people" property="*" />
	<table align="center">
		<caption>黑名单详细信息</caption>
		<tr>
			<th>姓名</th>
			<th>身份证号码</th>
			
		</tr>
		<%
			Vector v2 = people.Blist();
			int index = 0;
			try {
				while (v2.size() > 0) {
		%>
		<tr>
			<%
				Vector v3 = (Vector) v2.get(index);
						for (int i = 1; i < 3; i++) {
			%>
			<td><%=v3.get(i).toString()%></td>
			<%
				}
						index++;
			%>
		</tr>
		<%
			}
			} catch (ArrayIndexOutOfBoundsException ex) {

			} catch (NullPointerException ex) {
		%>

		<script>
			if (confirm("没有查询到任何数据")) {//如果是true ，那么就把页面转向BlackList.jsp
				location.href = "./BlackList.jsp";
			} else {//选择取消键
				location.href = "./BlackList.jsp";
			}
		</script>
		<%
			}
		%>
	</table>
  </body>
</html>
