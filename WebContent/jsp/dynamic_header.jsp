<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String name=request.getParameter("pic");
String data=request.getParameter("msg");
String path="/Etalenthunt/images/"+name;
System.out.println(path);
%>

<div style="color:white; width:100%;height: 100%; background-image: url('<%=path %>'); margin-top:0px;float:left;">
<h2 style="color: red;font-family: AR BERKLEY;margin-top: 50px;"><center><%=data %></center></h2>
</div>