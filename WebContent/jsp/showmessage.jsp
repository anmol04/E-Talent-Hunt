<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Message</title>
 <%@page import="etalenthunt.dbinfo.CrudOperation"%>
<%@page import="java.sql.*"%>
   
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


<div style="width:100%;height:625px;background-image:url('/Etalenthunt/images/6360601827905642211440182592_Martial-Arts-Training.jpg') ;">
<%String pagename=request.getParameter("pname");
String msgid=request.getParameter("mid");
int id=Integer.parseInt(msgid);
String url=null,strsql=null;
if(pagename.equals("sent"))
{
	strsql="select subject,msgtxt from sentitems where msgid=?";
	/* url="/Etalenthunt/jsp/sentitem.jsp"; */
			
}

if(pagename.equals("inbox"))
{
	strsql="select subject,msgtxt from inbox where msgid=?";
	/* url="/Etalenthunt/jsp/inbox.jsp"; */
			
}
ResultSet rs=CrudOperation.getData(strsql, id);
if(rs.next())
{
%>
<div style="background-color:white ;height:250px;width:60%;float: left;opacity: .8;margin-top: 70px;margin-left: 120px;border-radius: 30px;">
<div style="color: black;font-size: 40px;background-color: black;color: white;width: 100%;font-family:lucida calligraphy;"> <center><%=rs.getString("subject") %> </center></div>
<div style="margin:40px;color: black;font-size: 30px;">
<%=rs.getString("msgtxt") %>
</div>
</div>
</div>
<%} %>
<%-- <a href="<%=url %>">back</a> --%>
<%} %>
</body>
</html>