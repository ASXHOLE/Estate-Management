<%@ page language="java" import="java.util.* ,com.dao.*, javax.script.*, java.io.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>楼宇信息管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
		<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/editTable.js" type="text/javascript"></script>
<script src="js/operTable.js" type="text/javascript"></script>

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
			
			} else if (role.equals("2")) {
				
			}else {%>
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
	
	<div align="center">
		<div id="data"
			style="position: relative ;display: block;float: left;margin-left: 200px">
			<table border="5" cellpadding="1px" cellspacing="1px" id="table1"
				bordercolor="#0080FF">
				<caption>楼房详细信息</caption>
				<tr>
					<th>选项</th>
					<th width="80px">楼宇编号</th>
					<th width="80px">楼房名称</th>
					<th width="80px">楼房地址</th>
					<th width="80px">邮编</th>
					<th width="80px">层数</th>
					<th width="80px">房间数</th>
					<th width="80px">电梯数</th>
					<th>数据操作</th>
				</tr>
				
	<jsp:useBean id="buildingInfo" scope="page" class="com.buildingInfo_bean.building_Info"/>
	<jsp:setProperty property="*" name="buildingInfo"/>

				<%
					//String sql = "Select * from  Building_Info";
					Vector QBI = buildingInfo.budInfo();
					int index = 0;

					try {
						while (QBI.size() > 0 && index<QBI.size()) {
				%>
				 <tr>

					<%
						Vector qbi = (Vector) QBI.get(index);
						out.println("<th><input type='checkbox' value='"+qbi.get(1).toString()+"'/></th>");
						out.println("<th align='left' style='color:#999999' id='"+qbi.get(1).toString()+"'>"+qbi.get(1).toString()+"</th>");
								for (int i = 2; i < 8; i++) {
								out.println("<td>"+qbi.get(i).toString()+"</td>");
						}
							
								index++;
								out.println("<th><input type='button' value='更新修改' id='modifi' /></th>");
					%>
					
				</tr>
				<%
					}
					} catch (ArrayIndexOutOfBoundsException ex) {

					}
				%> 
			</table>
		</div>
		<div 
			style="position: relative; float:left ;display: block;padding-top: 30px;padding-left: 10px;width:250px">
			<input type="button" value="查询" id="query"
				style="width: 200px ; margin-bottom: 10px" onclick="javascript:window.location.href='../buildingInfoServlet?method=query'" /> <input
				type="button" id="add" value="增加" 
				style="width: 200px ; margin-bottom: 10px" onclick="javascript:window.location.href='../buildingInfoServlet?method=newbuilding'" /> <input
				type="button" id="update" value="更新" 
				style="width: 200px ; margin-bottom: 10px" onclick="javascript:window.location.href='../buildingInfoServlet?method=back'" /> <span><input
				id="btnDel" type="button" value="删除选定行" 
				style="width: 200px ; margin-bottom: 10px"  onclick="deld()"/></span>

		</div>
	</div>
	<%
		String role;
		role = request.getSession().getAttribute("role").toString();
		if (role.equals("2")) {
				%>
				<script>
					$("table tr  th #modifi").each(function (index){
						$(this).attr("disabled",true);
					});
					$("#add").attr("disabled",true);
					$("#btnDel").attr("disabled",true);
					//$("#add").remove();
					//$("#btnDel").remove();
					
				</script>
				<%
			}
	 %>
</body>
</html>
