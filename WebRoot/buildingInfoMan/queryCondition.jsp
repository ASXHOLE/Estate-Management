<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>输入查询条件</title>

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
	<div id="data" align="center"
		style="position: relative ;display: block;">
		<form action="buildingInfoServlet?method=querycondition"
			name="querybuildingFrom" method="post">
			<table border="5" cellpadding="1px" cellspacing="1px" id="table1"
				bordercolor="#0080FF">
				<caption>输入查询条件</caption>
				<tr>

					<th width="80px">楼房名称</th>

				</tr>
				<tr>

					<td><input type="text" name="bname" /></td>

				</tr>
				<tr>
					<td bordercolor="#FFFFFF"><input type="submit" value="提交"
						style="width: 150px"></td>
					<td bordercolor="#FFFFFF"><a
						href="./buildingInfoMan/budInfoMan.jsp">返回</a></td>

				</tr>

			</table>
		</form>
	</div>
</body>
</html>
