<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="etalenthunt.dbinfo.CrudOperation"%>
<%@page import="java.sql.*"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inbox</title>

<script type="text/javascript">
function showMsg(mid)
{
	
	window.open("/Etalenthunt/jsp/showmessage.jsp?mid="+mid+"&pname=inbox");
}

</script>

<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css">
</head>
<body style="margin: 0px">

<%
  
 HttpSession hs=request.getSession(false);//existing session
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
<form method="post" action="/Etalenthunt/DeleteMsg">
<table class="global"  style="background-color: white ;opacity: .9;margin-left: 150px;margin-top: 80px;" cellpadding="3" cellspacing="0" border="1" width="70%">
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Select</center></th>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Sender-ID</center></th>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Subject</center></th>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Date</center></th>
</tr >
 <%String strsql="select * from inbox where receiverid=?";
ResultSet rs=CrudOperation.getData(strsql,uid);
while(rs.next())
{
	String msid=rs.getString("msgid");
	%>
<tr>
<th><center><input type="checkbox" name="chkdel" value="<%=rs.getString("msgid") %>"></center></th>
 <th><center><%=rs.getString("senderid") %></center></th>
<th><a href="javascript:showMsg('<%=msid%>')"><center><%=rs.getString("subject")%></center></a></th>
<th><center><%=rs.getString("date") %></center></th>
 </tr>
 <% } %> 
<tr>
<td colspan="4" align="center">
<button type="submit" style="width: 100%;height: 28px;background-color: teal; border: none;"><b>Delete</b></button>
</td>
</tr>
<tr><input type="hidden" name="txtid" value="inbox"></tr>

</table>
</form>
</div>

<%} %>

</body>
</html>