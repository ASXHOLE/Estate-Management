<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加收费表单</title>
 
   <script type="text/javascript">
   		     function js(lastInfo,thisInfo,price){    	
			   var lastInfo = document.getElementById('lastInfo').value;
			   var thisInfo = document.getElementById('thisInfo').value;
			    var price = document.getElementById('price').value;
			   document.getElementById('allPay').value = price*(thisInfo-lastInfo);
   		     } 
    </script>
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
  <% 
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss"); 
		java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
		String id = formatter.format(currentTime); //将日期时间格式化 
   %>
  <form action="../feesServlet" method="post">
    <table align = "center">
        <tr><td>收费编号：<input type="text" name="payId" value = <%=id %>></td></tr>
   		<tr><td>业主房号：<input type="text" name="ownerId"></td></tr>
   		<tr><td>业主姓名：<input type="text" name="ownerName"></td></tr>	
   		<tr><td>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 型：
   		<select name= "payType">
   		   <option>电费</option>
   		   <option>水费</option>
   		   <option>物业费</option>
   		   <option>卫生费</option>
   		   <option>停车费</option>
   		</select>
   		</td></tr>
   		<tr><td>上月资料：<input type="text" name="lastMonthInfo" id = "lastInfo" 
   		      onkeyup="js('lastInfo','thisInfo','price')"></td></tr>
   		<tr><td>本月资料：<input type="text" name="thisMonthInfo" id = "thisInfo" 
   		       onkeyup="js('lastInfo','thisInfo','price')"></td></tr>
   		<tr><td>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：<input id ="price" type="text" name="unitPrice"  
   		      onkeyup="js('lastInfo','thisInfo','price')"></td></tr>
   		<tr><td>金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额：<input type="text" name = "monthPay"id="allPay"></td></tr>
         <tr><td><input type="submit" value="确定">
                 <input type="reset" value="重置"></td></tr>
    </table>
   </form>
  </body>
</html>
