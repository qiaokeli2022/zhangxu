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
					alert("ͼ�����Ʋ���Ϊ��!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.author.value == ""  )  
				{
					alert("���߲���Ϊ��!");
					document.form1.author.focus();
					return false;
				}
				if (document.form1.publishing.value == ""  )  
				{
					alert("�����粻��Ϊ��!");
					document.form1.publishing.focus();
					return false;
				}
				if (document.form1.number.value == ""  )  
				{
					alert("��Ų���Ϊ��!");
					document.form1.number.focus();
					return false;
				}
				if (!pattern.test(document.form1.dates.value) ) 
				{
					alert("��ʽ����(����2008-11-11)!");
					document.form1.dates.focus();
					return false;
				}				
				if (document.form1.price.value == ""  )  
				{
					alert("���۲���Ϊ��!");
					document.form1.price.focus();
					return false;
				}				
				if (document.form1.storage.value == ""  )  
				{
					alert("���������Ϊ��!");
					document.form1.storage.focus();
					return false;
				}				
				if (document.form1.brief.value == ""  )  
				{
					alert("���ݸ�Ҫ����Ϊ��!");
					document.form1.brief.focus();
					return false;
				}
								
				if (document.form1.img.value == ""  )  
				{
					alert("�ϴ��ļ�����Ϊ��!");
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
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">ͼ�����ƣ�</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="name" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">��&nbsp;&nbsp;&nbsp; �ߣ�</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="author" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">�� �� �磺</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="publishing" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">��&nbsp;&nbsp;&nbsp; �ţ�</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="number" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">�������ڣ�</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="dates" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">ÿ�����</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="price" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">�� �� ����</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<input type="text" name="storage" size="45"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">���ݸ�Ҫ��</td>
			<td height="25" bgcolor="#FFE3BB" width="66%">
			<textarea rows="12" name="brief" cols="43"></textarea></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">ͼ�����</td>
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
			ͼ��ȼ���</td>
			<td height="25" bgcolor="#66CCFF" width="66%">
			<select size="1" name="tate">
			<option value="1">�Ƽ�ͼ��</option>
			<option value="2">�µ�ͼ��</option>
			</select></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="right" width="31%">
			�ϴ�ͼƬ��</td>
			<td height="25" bgcolor="#66CCFF" width="66%">
			<input type="file" name="img" size="34"></td>
		</tr>
		<tr>
			<td height="25" bgcolor="#66CCFF" align="center" colspan="2">
			<input type="submit" value="���"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>