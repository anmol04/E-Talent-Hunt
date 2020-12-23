<%@page import="java.sql.*,etalenthunt.dbinfo.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Place Details</title>
</head>
<body>
<%
String strsql=null;
ResultSet rs=null;

String ut=request.getParameter("usertype");
System.out.println(ut);
if(ut.equals("all"))
{ strsql="select * from logininfo";
 rs=CrudOperation.getData(strsql);

}
else
{ strsql="select * from logininfo where usertype=?";
rs=CrudOperation.getData(strsql,ut);}
%>
<table class="global"  style="margin-top: 50px;margin-left: 100px ;background-color: white ;opacity: .9" cellpadding="3" cellspacing="0" border="1" width="60%">
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><center>User ID</center></th>
<th style="background-color:black ; font-family: cursive;color: white;"><center>User Password</center></th>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Status</center></th>
</tr>
<%while(rs.next())
	{
	%>
<tr>
<th><center><%=rs.getString("userid") %></center></th>
<th><center><%=rs.getString("userpass") %></center></th>
<th><center><%=rs.getString("status") %></center></th>
</tr>
<%} %>
</table>
</body>
</html>