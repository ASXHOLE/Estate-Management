<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<base href="<%=basePath%>">
    
    <title>黑名单录入</title>

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
    <div align="center">黑名单录入
    <form action="BlackListServlet" name="BlackListFrom" method="post" >
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
    <td colspan="2" align="center">
    <input type="submit" value="提交">
    <a href="./BlackList/Blist.jsp">查询黑名单</a>
    </td>    
    </tr>
    </table>
    </form>
    </div><br>
  </body>
</html>
