<%@page import="etalenthunt.list.SessionList"%>
<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="text/HTML; charset=ISO-8859-1;">
<title>Admin</title>

<% response.setHeader("cache-control","no-cache");
response.setHeader("cache-control","no-store");
response.setHeader("pragma","no-cache");
response.setDateHeader("expires",0);

%>

<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css" />

<script src="/Etalenthunt/bootfiles/jquery-3.1.1.min.js"></script>
<script src="/Etalenthunt/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/bootfiles/bootstrap.min.css" />

<script>
$(document).ready(function() {

	$("#deleteusers").click(function() {
		
	$("#div1").load("/Etalenthunt/jsp/deleteusers.jsp"); // loads in a division
		
	})
	
})

 $(document).ready(function() {

	$("#viewusers").click(function() {
		
		$("#div1").load("/Etalenthunt/jsp/viewusers.jsp"); // loads in a division
		
	})
	
})
 
 $(document).ready(function() {

	$("#compose").click(function() {
		
	$("#div1").load("/Etalenthunt/jsp/compose.jsp"); // loads in a division
		
	})
	
})

$(document).ready(function() {

	$("#inbox").click(function() {
		
	$("#div1").load("/Etalenthunt/jsp/inbox.jsp"); // loads in a division
		
	})
	
})

$(document).ready(function() {

	$("#sentitem").click(function() {
		
	$("#div1").load("/Etalenthunt/jsp/sentitem.jsp"); // loads in a division
		
	})
	
})

$(document).ready(function() {

	$("#verify").click(function() {
		
	$("#div1").load("/Etalenthunt/jsp/admin/verify_users.jsp"); 
	})
	
})

$(document).ready(function() {

	$("#feedback").click(function() {
		
	$("#div1").load("/Etalenthunt/jsp/viewfeedback.jsp"); 
	})
	
})

$(document).ready(function() {

	$("#post").click(function() {
		
	$("#div1").load("/Etalenthunt/jsp/admin/post.jsp"); 
	})
	
})



 
$(document).ready(function() {

	$("#btnlogoff").click(function() {
		
		window.location.href="/Etalenthunt/Logout";//page src
		
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
  
 /*  ServletContext sc=hs.getServletContext();
 int c=(Integer)sc.getAttribute("count"); */
 
 String uid=(String)hs.getAttribute("userinfo");
 if(uid==null || hs.isNew())
 {
	 
	 request.setAttribute("msg", "unauthorise access");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");//request scope
	 rd.forward(request, response);
 }
 else{
 //new SessionList().sessionCreated(null);
 String pageinfo=(String)request.getAttribute("msg1");
 
	System.out.println(pageinfo);	 
	
	
	if(pageinfo!=null)
	{
	%>

<input type="hidden" value="<%=pageinfo %>" id="txthid" />	
	<script>

	$(document).ready(function() {

		var data=document.getElementById("txthid").value;
		//alert(data);
		
			
		$("#div1").load("/Etalenthunt/jsp/"+data); 
		
		
	})

	</script>




	<%}
	
	
 
  %>
  
<div style="background-image:url('/Etalenthunt/images/hh.jpg') ; width:100%;height:1020px;float:left;"> 
<div style="background-color:black ; width:100%;height:120px;float:left;"> 
<div  style="float:left;width: 30%;background-color: black;height: 120px;"><h1 style="margin: 30px;font-family:lucida calligraphy ;color: white;">hello <%=uid %></h1></div>
<div  style="float:left ;width:20%;background-color:black;height:120px;" ><b style="background-color: white;color: navy;font-size: 15px;margin-top: 50px;margin-left: 30px;"><%=new java.util.Date() %></b></div>
<div style="float:left ;width:50%;background-color:black;height: 120px;" >
<div style="height:60px;width:50%;float: left;"><button type="button" class="btn btn-danger"  style="float:left ; margin-top: 70px;width: 50%;margin-left: 160px;" id="btnlogoff">Log Off</button></div>
<div style="height:60px;width:50%;float: left;"><button type="button" class="btn btn-primary "  style="float:left ;margin-top: 70px;width: 50%;margin-left: 70px;" id="btnhome">Home</button></div>
</div>
</div>

<div style="background-color:black ;width:20%;height:800px;float:left">
 <button type="button" class="btn btn-success" style="float:left;width:100%" id="viewusers">View Users</button>
 <button type="button" class="btn btn-success" style="float:left;width:100%" id="deleteusers">Delete Users</button>
 <button type="button" class="btn btn-success" style="float:left;width:100%" id="compose">Compose</button>
 <button type="button" class="btn btn-success" style="float:left;width:100%" id="inbox">Inbox</button>
 <button type="button" class="btn btn-success" style="float:left;width:100%" id="sentitem">Sent Item</button>
 <button type="button" class="btn btn-success" style="float:left;width:100%" id="verify">Verify Users</button>
 <button type="button" class="btn btn-success" style="float:left;width:100%" id="feedback">Feedbacks</button>
 <button type="button" class="btn btn-success" style="float:left;width:100%" id="post">Post Event News</button>

</div><%-- 
  <h1>total users:<%=c %></h1> --%> 
<div style="width:80%;height:800px;float:right;" id="div1"></div>
<div style="background-color:black;width:100%;height:100px;float:left"></div>

</div>



<% } %>
</body>
</html>