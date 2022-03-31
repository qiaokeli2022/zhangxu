<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书在线借阅后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="resources/img/css.css">
	

  </head>
  
  <body topmargin="0" leftmargin="0" rightmargin="0">
	<div align="center">
	<table style="border-style: dotted; border-width: 1px">
	<tr><td background="resources/img/bg1111.jpg" width="795" height="100"></td></tr>
  <tr>
  <td align="center" valign="top">
  <table width="100%">
  <tr><td align="center" bgcolor="#C0C0C0">
  <table>
  <tr>
  <td><a href="admin/booklist.jsp">图书管理|</a></td>
  <td><a href="admin/typelist.jsp">图书类别管理|</a></td>
  <td><a href="admin/userlist.jsp">会员管理|</a></td>
  <td><a href="admin/leave_word.jsp">留言管理|</a></td>
  <td><a href="admin/kuxiao.jsp">库存查询|</a></td>
  <td><a href="admin/order.jsp">借阅信息查询|</a></td>  
  <td><a href="admin/order1.jsp">预借信息查询|</a></td>
  <td><a href="admin/modifypwd.jsp">用户管理|</a></td>
  <td><a href="servlet/RemoveServlet?admin=1">注销退出|</a></td> 
  </tr>
  </table>
  </td></tr>
  </table>
  </td>
  </tr>
  </table>
  	</div>
  </body>
</html>