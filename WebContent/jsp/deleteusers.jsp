
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="etalenthunt.dbinfo.CrudOperation"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Users</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css">
</head>
<body style="margin: 0px">

<%
  
 HttpSession hs=request.getSession(false);//existing session
/*  
 ServletContext sc=hs.getServletContext();
 int c=(Integer)sc.getAttribute("count");
  */
 String uid=(String)hs.getAttribute("userinfo");
 if(uid==null || hs.isNew())
 {
	 
	 request.setAttribute("msg", "unauthorise access");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");//request scope
	 rd.forward(request, response);
 }
 else{
 
  %>



<div style="width:100%;height:800px;float:left;">
<form method="post" action="/Etalenthunt/DeleteUser">
<table class="global"  style="margin-top: 20px;margin-left: 70px ;background-color: white ;opacity: .9;margin-left: 150px;margin-top: 80px;" cellpadding="3" cellspacing="0" border="1" width="70%">
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Select</center></th>
<th style="background-color:black ; font-family: cursive;color: white;"><center>User ID</center></th>

<th style="background-color:black ; font-family: cursive;color: white;"><center>User Type</center></th>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Status</center></th>
</tr >
 <%String strsql="select * from logininfo where usertype!='admin'";
ResultSet rs=CrudOperation.getData(strsql);
while(rs.next())
{
	%>
<tr>
<th><center><input type="checkbox" name="chkdel" value="<%=rs.getString("userid") %>"></center></th>
 <th><center><%=rs.getString("userid") %></center></th>
<th><center><%=rs.getString("usertype") %></center></th>
<th><center><%=rs.getString("status") %></center></th>

 </tr>
 <% } %> 
<tr>
<td colspan="4" align="center">
<button type="submit" style="width: 100%;height: 28px;background-color: teal; border: none;"><b>Delete</b></button>
</td>
</tr>

</table>
</form>
</div>
<%} %>
</body>
</html>