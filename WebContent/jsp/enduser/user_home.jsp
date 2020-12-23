<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="text/HTML; charset=ISO-8859-1;">
<title>User</title>

<% response.setHeader("cache-control","no-cache");
response.setHeader("cache-control","no-store");
response.setHeader("pragma","no-cache");
response.setDateHeader("expires",0);

%>


<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css">

<script src="/Etalenthunt/bootfiles/jquery-3.1.1.min.js"></script>
<script src="/Etalenthunt/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/bootfiles/bootstrap.min.css">
<script>

$(document).ready(function() {

	$("#viewprofile").click(function() {
		
		$("#div1").load("/Etalenthunt/jsp/enduser/viewprofile_user.jsp"); // loads in a division
		
	})
	
})


$(document).ready(function() {

	$("#updateprofile").click(function() {
		
		$("#div1").load("/Etalenthunt/jsp/enduser/updateprofile_user.jsp"); // loads in a division
		
	})
	
})




$(document).ready(function() {

	$("#btnlogoff").click(function() {
		
		window.location.href="/Etalenthunt/Logout";//page src
		
	})
	
})

$(document).ready(function() {

	$("#upload").click(function() {
		$("#div1").load("/Etalenthunt/jsp/uploadpic.jsp");
		//window.location.href="/Etourism/Logout";//page src
		
	})
	
})

$(document).ready(function() {

	$("#account").click(function() {
		$("#div1").load("/Etalenthunt/jsp/updatePass.jsp");
		//window.location.href="/Etourism/Logout";//page src
		
	})
	
})

$(document).ready(function() {

	$("#view").click(function() {
		$("#div1").load("/Etalenthunt/jsp/viewcandidates.jsp");
		//window.location.href="/Etourism/Logout";//page src
		
	})
	
})

$(document).ready(function() {

	$("#btnhome").click(function() {
		
		window.location.href="/Etalenthunt/jsp/index.jsp";//page src
		
	})
	
})


</script>
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
 //new SessionList().sessionCreated(null);
  String utype=(String)hs.getAttribute("ut");
  String picname=utype+".jpg";
  %>
  
<div style="background-color: black; width:100%;height:1250px;float:left;"> 

<%-- <div style=" width:100%; height:100px;"><%@include file="/html/header.html" %></div> --%>

<div style="width:100%;height:230px;float:left;">
<jsp:include page="/jsp/dynamic_header.jsp">
<jsp:param value="<%=picname %>" name="pic"/>
<jsp:param value="Show what you got!!" name="msg"/>
</jsp:include>
</div>

<div style=" width:100%;height:120px;float:left;"> 
<div  style="float:left;width: 30%;background-color: black;height: 120px;"><h1 style="margin: 30px;font-family:lucida calligraphy ;color: white;">hello <%=uid %></h1></div>
<div  style="float:left ;width:20%;background-color:black;height:120px;" ><b style="background-color: white;color: navy;font-size: 15px;margin-top: 50px;margin-left: 30px;"><%=new java.util.Date() %></b></div>
<div style="float:left ;width:50%;background-color:black;height: 120px;" >
<div style="height:60px;width:50%;float: left;"><button type="button" class="btn btn-danger"  style="float:left ; margin-top: 70px;width: 50%;margin-left: 160px;" id="btnlogoff">Log Off</button></div>
<div style="height:60px;width:50%;float: left;"><button type="button" class="btn btn-primary "  style="float:left ;margin-top: 70px;width: 50%;margin-left: 70px;" id="btnhome">Home</button></div>
</div>
</div>

<div style="background-color:black;width:20%;height:800px;float:left">
 <button type="button" class="btn btn-success" style="float:left;width:100%" id="viewprofile">View Profile</button>
  <button type="button" class="btn btn-success"  style="float:left;width:100%" id="updateprofile">Update Profile</button>
 <button type="button" class="btn btn-success"  style="float:left;width:100%" id="upload">Upload Profile Picture</button>
 <button type="button" class="btn btn-success"  style="float:left;width:100%" id="account">Account Settings</button>
<button type="button" class="btn btn-success"  style="float:left;width:100%" id="view">View Candidates</button>
 
</div>
<div style="width:80%;height:800px;float:right;background-image:url('/Etalenthunt/images/ERiDlnP.jpg') ;" id="div1">

</div>

<div style="background-color:black;width:100%;height:100px;float:left">
</div>
</div>
<%} %>
</body>
</html>