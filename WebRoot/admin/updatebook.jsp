<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="resources/img/css.css">
	

  </head>
  <script language="JavaScript">
		function check11()
			{
				var pattern = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;
				if (document.form1.name.value == "" ) 
				{
					alert("图书名称不能为空!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.author.value == ""  )  
				{
					alert("作者不能为空!");
					document.form1.author.focus();
					return false;
				}
				if (document.form1.publishing.value == ""  )  
				{
					alert("出版社不能为空!");
					document.form1.publishing.focus();
					return false;
				}
				if (document.form1.number.value == ""  )  
				{
					alert("书号不能为空!");
					document.form1.number.focus();
					return false;
				}
				if (!pattern.test(document.form1.dates.value) ) 
				{
					alert("格式错误(例如2008-11-11)!");
					document.form1.dates.focus();
					return false;
				}					
				if (document.form1.price.value == ""  )  
				{
					alert("单价不能为空!");
					document.form1.price.focus();
					return false;
				}				
				if (document.form1.storage.value == ""  )  
				{
					alert("库存量不能为空!");
					document.form1.storage.focus();
					return false;
				}				
				if (document.form1.brief.value == ""  )  
				{
					alert("内容概要不能为空!");
					document.form1.brief.focus();
					return false;
				}
			}
</script>
<%
String ok = (String)request.getAttribute("ok");
if(ok != null && ok.equals("1")){
%><script>alert('修改成功!')</script><%
}
 %> 
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/> 
  <body>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/UpdateBookServlet" method="post" name="form1" onSubmit="return check11()">
	<table border="1" width="47%" bordercolorlight="#C0C0C0">
	<%
	 ArrayList al = (ArrayList)request.getAttribute("bookinf");
 	 ArrayList bookinf = (ArrayList)al.get(0);
 	 ArrayList type = (ArrayList)request.getAttribute("type");
	 %>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="27%">图书名称：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<input type="text" name="name" size="45" value="<%=bookinf.get(1)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="27%">作&nbsp;&nbsp;&nbsp; 者：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<input type="text" name="author" size="45" value="<%=bookinf.get(2)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="27%">出 版 社：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<input type="text" name="publishing" size="45" value="<%=bookinf.get(3)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="27%">书&nbsp;&nbsp;&nbsp; 号：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<input type="text" name="number" size="45" value="<%=bookinf.get(4)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">出版日期：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<input type="text" name="dates" size="45" value="<%=bookinf.get(12).toString().substring(0,10) %>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="27%">每日租金：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<input type="text" name="price" size="45" value="<%=bookinf.get(5)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="27%">库 存 量：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<input type="text" name="storage" size="45" value="<%=bookinf.get(6)%>"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="27%">内容概要：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<textarea rows="12" name="brief" cols="43"><%=bookinf.get(7)%></textarea></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="27%">图书类别：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<select name="type">
			<%
            for(int i = 0;i < type.size();i++){
            	ArrayList alRow = (ArrayList)type.get(i);
            	if(alRow.get(0).equals(bookinf.get(8))){ 
            %>
             <option value="<%=alRow.get(0)%>" selected><%=alRow.get(1)%></option>
              <%}else{
              %><option value="<%=alRow.get(0)%>"><%=alRow.get(1)%></option><%
              } }%>
			</select></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="27%">图书等级：</td>
			<td height="25" bgcolor="#FFE3BB" width="70%">
			<select size="1" name="tate">
			<%
			if(bookinf.get(9).equals("1")){
				%><option value="1" selected>推荐图书</option><%
			}else{
			 %>
			<option value="1">推荐图书</option>
			<%} %>
			<%
			if(bookinf.get(9).equals("2")){
				%><option value="2" selected>新到图书</option><%
			}else{
			 %>
			<option value="2">新到图书</option>
			<%} %>			
			</select></td>
		</tr>
		<tr><input type="hidden" name="id" value="<%=bookinf.get(0)%>"/>
			<td height="25" bgcolor="#66CCFF" align="center" colspan="2">
			<input type="submit" value="修改"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>