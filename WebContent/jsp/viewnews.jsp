<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Message</title>
 <%@page import="etalenthunt.dbinfo.CrudOperation"%>
<%@page import="java.sql.*"%>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css" />   
</head>
<body style="margin: 0px;">

<div style="width:100%;height:625px;background-image:url('/Etalenthunt/images/6360601827905642211440182592_Martial-Arts-Training.jpg') ;">


<%
String nid=request.getParameter("nid");
int id=Integer.parseInt(nid);

String	strsql="select subject,news from postnews where id=?";
ResultSet rs=CrudOperation.getData(strsql, id);
if(rs.next())
{
%>
<div style="background-color:white ;height:250px;width:60%;float: left;opacity: .8;margin-top: 70px;margin-left: 120px;border-radius: 30px;">
<div style="color: black;font-size: 40px;background-color: black;color: white;width: 100%;font-family:lucida calligraphy;"> <center><%=rs.getString("subject") %> </center></div>
<div style="margin:40px;color: black;font-size: 30px;"><%=rs.getString("news") %>
</div>
</div>
<% } %>



<div style="float: right;background-color: white;width: 10%;height: 80px;">
<h1><a href="/Etalenthunt/jsp/index.jsp" >Home</a></h1>
</div>


</div>
</body>
</html>