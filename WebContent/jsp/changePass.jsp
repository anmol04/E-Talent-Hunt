<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>  <!-- prefix-write anything --> <!-- uri-"http://java.sun.com/jsp/jstl/core" -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="s"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<%
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
String ut=(String)hs.getAttribute("ut");
if(uid==null || hs.isNew())
{
	 
	 request.setAttribute("msg", "unauthorise access");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");//request scope
	 rd.forward(request, response);
}
else
{
%>
<s:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/etalenthunt" user="root" password="root" scope="application"/>
<c:set var="ui" value="<%=uid %>"></c:set>
<c:set var="upass" value="${param.txtuserpass }"></c:set>
<s:update dataSource="${con }" var="rw"> 
update logininfo set userpass=? where userid=?
<s:param value="${upass }"></s:param>
<s:param value="${ui }"></s:param>
</s:update>
<%
String pro=null;
if(ut.equalsIgnoreCase("candidate"))
{pro="/jsp/candidate/candidate_home.jsp";}
else	  if(ut.equalsIgnoreCase("professional"))
{ pro="/jsp/professional/professional_home.jsp";}
else  if(ut.equalsIgnoreCase("user"))
{ pro="/jsp/enduser/user_home.jsp";}


%>

<c:if test="${rw>0 }">
<%-- <c:out value="Password Changed!!" /> --%>
<c:redirect url="<%=pro %>"></c:redirect>
</c:if>
<%} %>
</body>
</html>