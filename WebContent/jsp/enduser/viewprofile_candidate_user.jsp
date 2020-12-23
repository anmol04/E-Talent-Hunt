<%@page import="etalenthunt.dbinfo.CrudOperation"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%  String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
    
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Candidate Profile</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/bootfiles/bootstrap.min.css">

</head>
<body style="margin: 0px">
<div style="background-color:teal ;width:100%;height:1000px;">
<div style="background-color: silver;width:60%;height:300px;float:left;margin-left:200px;margin-top:200px; border-radius: 10px;">

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
<div style="width:50%;height:800px">
<% 
String cid=request.getParameter("cid");
String strsql="select * from candidatesinfo where userid=?";
ResultSet rs=CrudOperation.getData(strsql, cid);
String picpath=null;
String imgname="";

if(rs.next())
{
	imgname=rs.getString("pic");
	if(imgname==null)
		picpath="/Etalenthunt/images/defaultpic_candidate.jpg";
	else
		picpath=basePath+cid+"/images/"+imgname;
	System.out.println(picpath);
	%>
	<div style="width:40%;height:200px;float: left;"><img style="width: 80%;height: 200px" src="<%=picpath%>"></div>
	
	<div>
	<table border="2" align="center" cellspacing="4" cellpadding="2">
	<tr><th>Name</th>
	<th><%=rs.getString("name") %></th></tr>
	<tr><th>Address</th>
	<th><%=rs.getString("address") %></th></tr>
    <tr><th>Ph No.</th>
	<th><%=rs.getString("phoneno") %></th></tr>
	<tr><th>Skills</th>
	<th><%=rs.getString("skills") %></th></tr>
	<tr><th>Email</th>
	<th><%=rs.getString("email") %></th></tr>
	<tr><th>Gender</th>
	<th><%=rs.getString("gender") %></th></tr>
	<tr><th>DOR</th>
	<th><%=rs.getString("dor") %></th></tr>
	</table>
	</div>
	
	<%
}
%>
<a href="/Etalenthunt/jsp/professional/viewcandidates.jsp">Back</a>
<%} %>
</div>
</div>
</div>
</body>
</html>