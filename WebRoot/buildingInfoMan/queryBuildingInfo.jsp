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

<title>查询楼房信息</title>

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
	<table align="center" border="5" cellpadding="1px" cellspacing="1px"
		id="table1" bordercolor="#0080FF">

		<caption>楼房详细信息</caption>
		<tr>

			<th width="80px">楼宇编号</th>
			<th width="80px">楼房名称</th>
			<th width="80px">楼房地址</th>
			<th width="80px">邮编</th>
			<th width="80px">层数</th>
			<th width="80px">房间数</th>
			<th width="80px">电梯数</th>

		</tr>

		<jsp:useBean id="buildingInfo" scope="page"
			class="com.buildingInfo_bean.building_Info" />
		<jsp:setProperty property="*" name="buildingInfo" />
		<%
			String bname = request.getAttribute("condition").toString();
			//out.println(bname);
			Vector QBI = buildingInfo.budInfo(bname);
			int index = 0;

			try {
				while (QBI.size() > 0 && index < QBI.size()) {
		%>
		<tr>

			<%
				Vector qbi = (Vector) QBI.get(index);

						//out.println("<th align='left' style='color:#999999' id='"+qbi.get(1).toString()+"'>"+qbi.get(1).toString()+"</th>");
						for (int i = 1; i < 8; i++) {
			%>

			<td><%=qbi.get(i).toString()%></td>
			<%
				}
						index++;
			%>
		</tr>
		<%
			}
			} catch (ArrayIndexOutOfBoundsException ex) {

			}
		%>

	</table>

</body>
</html>
