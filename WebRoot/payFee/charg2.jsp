<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.payfee_bean.feesInfo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>收费信息</title>
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
    <center>
    <table border="1">
    <tr align="center"> 
        <td>收费编号</td>
        <td>业主房号</td> 
        <td>业主姓名</td>  
        <td>收费类型</td> 
        <td>上月资料</td>
        <td>本业资料</td> 
        <td>单价</td>
        <td>金额</td> 
   </tr> 
   <%
   		ArrayList list = (ArrayList)session.getAttribute("list");
   		
   		for(int i=0; i<list.size();i++){ 
        	feesInfo fe2 = (feesInfo)list.get(i); 
       
    %>
    <tr>
        <td><%=fe2.getPayId()%></td>
    	<td><%=fe2.getOwnerId()%></td>
    	<td><%=fe2.getOwnerName()%></td>	
    	<td><%=fe2.getPayType()%></td>
    	<td><%=fe2.getLastMonthInfo()%></td>
    	<td><%=fe2.getThisMonthInfo()%></td>
    	<td><%=fe2.getUnitPrice()%></td>
    	<td><%=fe2.getMonthPay()%></td>
    </tr>
    <% 
    }
    %>
    </table>
      <a href= "success.jsp"><input type= "submit" name = "pay" value = "缴费"></a>
    </center>
  </body>
</html>
