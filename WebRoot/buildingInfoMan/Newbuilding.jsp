<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>输入新楼房</title>
    
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
			<%}else if (role.equals("1")||role.equals("5")) {
			
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
				
				if(confirm("你没有权限访问该网页或者没有登录,请重新登录！"))
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
   		<div id="data" align="center"
			style="position: relative ;display: block;">
			<form action="buildingInfoServlet?method=new" name="newbuildingFrom" method="post">
			<table border="5" cellpadding="1px" cellspacing="1px" id="table1"
				bordercolor="#0080FF">
				<caption>新楼宇信息录入</caption>
				<tr>
					<th width="80px">楼宇编号</th>
					<th width="80px">楼房名称</th>
					<th width="80px">楼房地址</th>
					<th width="80px">邮编</th>
					<th width="80px">层数</th>
					<th width="80px">房间数</th>
					<th width="80px">电梯数</th>
				</tr>
				<tr>
				<td ><input type="text" name="bid"/></td>
				<td ><input type="text" name="bname"/></td>
				<td ><input type="text" name="baddr"/></td>
				<td ><input type="text" name="bpostcode"/></td>
				<td ><input type="text" name="bstorey" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
				<td ><input type="text" name="brooms" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
				<td ><input type="text" name="belevator" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
				</tr>
				<tr>
				<td bordercolor="#FFFFFF">	<input type="submit" value="提交" style="width: 150px"></td>
						<td bordercolor="#FFFFFF"><a href="./buildingInfoMan/budInfoMan.jsp">返回</a></td>
					
				</tr>	
				
			</table>
		</form>
	</div>
  </body>
</html>
