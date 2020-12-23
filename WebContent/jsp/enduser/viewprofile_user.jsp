<%@page import="etalenthunt.dbinfo.CrudOperation"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%  String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%--     
Path is: <%=basePath %>  
 --%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/bootfiles/bootstrap.min.css">

</head>
<body style="margin: 0px">
<div style="width:100%;height:800px;float: right;">
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
<div style="width:90%;height:700px;margin:50px;">
<% String strsql="select * from userinfo where userid=?";
ResultSet rs=CrudOperation.getData(strsql, uid);
String picpath=null;
String imgname="";

if(rs.next())
{
	imgname=rs.getString("pic");
	if(imgname==null)
		picpath="/Etalenthunt/images/defaultpic_user.png";
	else
		picpath=basePath+uid+"/images/"+imgname;
	System.out.println(picpath);
	%>
	
	<div style="width:100%;height:200px;">
	<div style="width:25%;height:200px;float: left;"><img style="width: 80%;height: 180px" src="<%=picpath%>"></div>
	
	 <div style="width:75%;height:200px;float:right;">

	<table class="global"  style="background-color: white ;opacity: .8;" cellpadding="3" cellspacing="0" border="1" width="100%">

	
	
	<tr><th style="background-color:black ; font-family: cursive;color: white;"><center>Email</center></th>
	<th><%=rs.getString("email") %></th></tr>
	<tr><th style="background-color:black ; font-family: cursive;color: white;"><center>Phone No.</center></th>
	<th><%=rs.getString("phoneno") %></th></tr>
	<tr><th style="background-color:black ; font-family: cursive;color: white;"><center>Gender</center></th>
	<th><%=rs.getString("gender") %></th></tr>
	<tr><th style="background-color:black ; font-family: cursive;color: white;"><center>DOR</center></th>
	<th><%=rs.getString("dor") %></th></tr>
	</table>
	</div>
	
	<%
}
}
%>
</div>
<!-- </div> -->
</div>
</div>
</body>
</html>