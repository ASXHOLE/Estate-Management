<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<base href="<%=basePath%>">
    
    <title>录入失败！请重新录入！</title>
    



  </head>
  
  <body>
       录入失败！请重新录入！ <br>
    <a href="./BlackList/BlackList.jsp">返回</a>
  </body>
</html>
