<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
  </head>
<script language="JavaScript">
function login()
{	
	var pattern = /^[0-9]{4}$/;
	if (!pattern.test(document.form1.dates.value) )  
	{
		alert("����ֻ��������(����2008)!");
		document.form1.dates.focus();
		return false;
	}
	else
	{
		form1.action="servlet/SearchServlet";
		form1.submit();
	}
}
</script>  
  <body>
  <jsp:include flush="true" page="top.jsp"/>
  	<form name="form1" method="post" action="servlet/SearchServlet">
  		<div align="center">
  		<table width="770" border="0" cellspacing="0" cellpadding="10" bordercolor="#EDECEC" style="border-style: solid; border-width: 1px">
	<tr>
		<td align="center">
		<table border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" bordercolor="#C0C0C0" width="300">
			<tr>
				<td colspan="3" align="center" valign="middle">
				<font color="#FF0000">ͼ&nbsp; ��&nbsp; ��&nbsp; ��</font></td>
			</tr>
			<tr>
				<td align="right">��ͼ�����ƣ�</td>
				<td>
				<input class="input7" type="text" name="name" /></td>
				<td align="center"><input type="submit" value="����"></td>
			</tr>
			<tr>
				<td align="right">�����ߣ�</td>
				<td>
				<input class="input7" type="text" name="author" /></td>
				<td align="center"><input type="submit" value="����"></td>
			</tr>
			<tr>
				<td align="right">�����������ƣ�</td>
				<td>
				<input class="input7" type="text" name="cuban" /></td>
				<td align="center"><input type="submit" value="����"></td>
			</tr>
			<tr>
				<td align="right">����������(���)��</td>
				<td>
				<input class="input7" type="text" name="dates" /></td>
				<td align="center"><input type="button" value="����" onclick="login()"></td>
			</tr>
			<jsp:include flush="false" page="/servlet/ListServlet"></jsp:include>
			<%
			ArrayList alType = (ArrayList)request.getAttribute("type");
			%>
			<tr>
				<td align="right">ͼ�����</td>
				<td>
				<select name="types">
				<option value="">�������</option>
				<%
				for(int i = 0;i<alType.size();i++){
				ArrayList alTypeRow = (ArrayList)alType.get(i);
				%>
				<option value="<%=alTypeRow.get(0)%>"><%=alTypeRow.get(1)%></option>
				<%}%>
				</select></td>
				<td align="center"><input type="submit" value="����"></td>
			</tr>
			</table>
		</td>
	</tr>
</table><br>
<table width="750" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFCC00">
				<tr>
					<td align="center">ͼ������</td>
					<td align="center">����</td>
					<td align="center">������</td>
					<td align="center">��������</td>
					<td align="center">ÿ�����(Ԫ)</td>
					<td align="center">ͼ�����</td>
					<td align="center">����</td>
				</tr>				
				<%
				ArrayList bookSearch = (ArrayList)request.getAttribute("search");
				if(bookSearch != null){
				for(int i = 0;i < bookSearch.size();i++){
				ArrayList alRow = (ArrayList)bookSearch.get(i);
				%>
				<tr bgcolor="#FFFFFF">
					<td align="center"><a href="servlet/BookinfServlet?id=<%=alRow.get(0)%>" title="����鿴��ϸ��Ϣ"><%=alRow.get(1)%></a></td>
					<td align="center"><%=alRow.get(2)%></td>
					<td align="center"><%=alRow.get(3)%></td>
					<td align="center"><%=alRow.get(12).toString().substring(0,10) %></td>
					<td align="center"><%=alRow.get(5)%></td>
					<td align="center">
					<%
            for(int j = 0;j < alType.size();j++){
            	ArrayList alTypeRow = (ArrayList)alType.get(j);
            	if(alTypeRow.get(0).equals(alRow.get(8))){ 
            %><a href="servlet/SearchServlet?types=<%=alTypeRow.get(0)%>"><%=alTypeRow.get(1)%></a>
              <%break;}} %>
					</td>
					<td align="center">						
						<%
						if(!alRow.get(6).equals("0")){
							%><a href="qiantai/loan_book.jsp?bookId=<%=alRow.get(0)%>"><img src="img/goumai.gif" border="0" /><%
						}else{
						 %>
                        	<a href="qiantai/beforehand_book.jsp?bookId=<%=alRow.get(0)%>"><img src="img/goumai1.gif" border="0" />
                        	<%} %>
                        </a>
					</td>
				</tr>
				<%}}%>
			</table>
		</div>
	</form>
<jsp:include flush="true" page="Copyright.jsp"/>
  </body>
</html>