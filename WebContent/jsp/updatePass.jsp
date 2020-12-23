<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="etalenthunt.dbinfo.CrudOperation"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Settings</title>

<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css">
</head>


<body style="margin: 0px">
<div style="width:100%;height:800px;">


<%
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
/* String utype=(String)hs.getAttribute("ut"); */
if(uid==null || hs.isNew())
{
	 
	 request.setAttribute("msg", "unauthorise access");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");//request scope
	 rd.forward(request, response);
}
else
{
%>

<% String strsql="select * from logininfo where userid=?";
ResultSet rs=CrudOperation.getData(strsql, uid);
if(rs.next())
{
	%>
	
	<form method="post" action="/Etalenthunt/jsp/changePass.jsp">
	<table class="global" align="center" style="margin: 70px; background-color: white ;opacity: .9" cellpadding="3" cellspacing="0" border="1" width="50%">
	<tr>
	<th style="background-color:black ; font-family: cursive;color: white;"><b><center>User ID</center></b></th>
	<th><input type="text" name="txtuserpass" value="<%=rs.getString("userid") %>" disabled="disabled" style="width: 100%"></th>
	</tr>
	<tr><th style="background-color:black ; font-family: cursive;color: white;"><b><center>Password</center></b></th>
	<th><input type="text" name="txtuserpass" value="<%=rs.getString("userpass") %> " style="width: 100%"></th>
	</tr>
	<tr><td align="center" colspan=2>
<button type="submit" style="width: 100%;height: 28px;background-color: teal; border: none;"><b>Update</b></button>
</td>
</tr>
<%-- <tr><th><input type="hidden" name="utype" value=<%=utype %>></th></tr> --%>
 </table>
	</form>
	<%
}
}
%>
</div>
</body>
</html>