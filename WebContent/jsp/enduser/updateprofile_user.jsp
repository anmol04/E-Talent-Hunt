<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="etalenthunt.dbinfo.CrudOperation"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>

<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css">
</head>


<body style="margin: 0px">
<div style="width:100%;height:800px;">
<!-- <div style="background-color: silver;width:60%;height:300px;float:left;margin-left:200px;margin-top:200px; border-radius: 10px;"> -->

<%
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
if(uid==null || hs.isNew())
{
	 
	 request.setAttribute("msg", "unauthorise access");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");//request scope
	 rd.forward(request, response);
}
else
{
%>
<!-- <div style="width:50%;height:800px"> -->
<% String strsql="select * from userinfo where userid=?";
ResultSet rs=CrudOperation.getData(strsql, uid);
if(rs.next())
{
	%>
	
	<form method="post" action="/Etalenthunt/UpdateProfileUser">
	<table class="global"  style="background-color: white ;opacity: .8;margin: 70px;" cellpadding="3" cellspacing="0" border="1" width="60%">
	<tr><th style="background-color:black ; font-family: cursive;color: white;"><center>Phone No.</center></th>
	<th colspan=2><input type="text" name="txtuserphno" value="<%=rs.getLong("phoneno") %>" style="width: 100%;"></th>
	</tr>
	<tr><th style="background-color:black ; font-family: cursive;color: white;"><center>Email</center></th>
	<th colspan=2><input type="text" name="txtuseremail" value="<%=rs.getString("email") %>" style="width: 100%;"></th>
	</tr>
    
	<tr>
    <th style="background-color:black ; font-family: cursive;color: white;"><center>Gender</center></th>
    <th style="background-color:black ; font-family: cursive;color: white;"><input type="radio" id="rdosmale" name="rdos" value="Male">Male</th>
    <th style="background-color:black ; font-family: cursive;color: white;"><input type="radio" id="rdosfemale" name="rdos" value="Female">Female</th>
    </tr>
    <tr>
<td align="center" colspan="3">
<button type="submit" style="width: 100%;height: 28px;background-color: teal; border: none;"><b>Update</b></button>
</td>
</tr>
 </table>
	</form>
	<%
}
}
%>
<!-- </div> -->
<!-- </div> -->
</div>
</body>
</html>