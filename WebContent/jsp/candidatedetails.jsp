<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="etalenthunt.dbinfo.CrudOperation"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Details</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css">
<script src="/Etalenthunt/bootfiles/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function showProfile(uid)
{
	
	window.open("/Etalenthunt/jsp/professional/viewprofile_candidate_pro.jsp?cid="+uid);
}

</script>
</head>
<body>
<div style="width:100%;height:400px;margin-top: 100px;">

<%
 String skill=request.getParameter("cmbskill");
System.out.println(skill);
 String strsql="select * from candidatesinfo where skills like?";
ResultSet rs=CrudOperation.getData(strsql,skill+"%");%>
<table class="global" align="center" style="background-color: white ;opacity: .9" cellpadding="3" cellspacing="0" border="1" width="60%">
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><b><center>User ID</center></b></th>
<th style="background-color:black ; font-family: cursive;color: white;"><b><center>Name</center></b></th>
<th style="background-color:black ; font-family: cursive;color: white;"><b><center>Skills</center></b></th>

</tr >
<% 
while(rs.next())
{
	
	String caid=rs.getString("userid");
	System.out.println(caid);
	
	%>
<tr>
<th><a href="javascript:showProfile('<%=caid%>')"><center><%=caid%></center></a></th>
<%-- <a href="/Etalenthunt/jsp/professional/viewprofile_candidate_pro.jsp?cid=<%=caid %>"><center><%=caid%></center></a> --%>
 <th><center><%=rs.getString("name") %></center></th>
<th><center><%=rs.getString("skills") %></center></th>
 </tr>
 <% } %>  
</table>
</div>

</body>
</html>