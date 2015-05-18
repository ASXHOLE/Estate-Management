<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.payfee_bean.feesInfo" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>收取费用</title>
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
     <form action="../chargServlet" method ="post" >
            房号：<input name = "houseId" type = "text" value="请输入业主房号" 
              onfocus="javascript:if(this.value=='请输入业主房号')this.value='';">

     <input name = "find" type = "submit" value = "查询" >
     </form>
  </body>
</html>
