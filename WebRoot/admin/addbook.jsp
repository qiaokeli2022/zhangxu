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
	
	<link rel="stylesheet" type="text/css" href="img/css.css">
	

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
								
				if (document.form1.img.value == ""  )  
				{
					alert("上传文件不能为空!");
					document.form1.img.focus();
					return false;
				}
			}
</script> 
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/> 
  <body>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/AddBookServlet" method="post" name="form1" onSubmit="return check11()" enctype="multipart/form-data">
	<table border="1" width="50%" bordercolorlight="#C0C0C0">
	<%
 	 ArrayList type = (ArrayList)request.getAttribute("type");
	 %>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">图书名称：</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="name" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">作&nbsp;&nbsp;&nbsp; 者：</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="author" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">出 版 社：</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="publishing" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">书&nbsp;&nbsp;&nbsp; 号：</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="number" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">出版日期：</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="dates" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">每日租金：</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="price" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">库 存 量：</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="storage" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">内容概要：</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<textarea rows="12" name="brief" cols="43"></textarea></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">图书类别：</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<select name="type">
			<%
            for(int i = 0;i < type.size();i++){
            	ArrayList alRow = (ArrayList)type.get(i);
            %>
             <option value="<%=alRow.get(0)%>"><%=alRow.get(1)%></option>
             <%}%>
			</select>
			</td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">
			图书等级：</td>
			<td height="25" bgcolor="#66CCFF" width="66%">
			<select size="1" name="tate">
			<option value="1">推荐图书</option>
			<option value="2">新到图书</option>
			</select></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">
			上传图片：</td>
			<td height="25" bgcolor="#66CCFF" width="66%">
			<input type="file" name="img" size="34"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="center" colspan="2">
			<input type="submit" value="添加"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>