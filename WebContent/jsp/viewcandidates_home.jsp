<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="etalenthunt.dbinfo.CrudOperation"%>
<%@page import="java.sql.*"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Candidates</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css" />
<script src="/Etalenthunt/bootfiles/jquery-3.1.1.min.js"></script>
	<script>           
	$(document).ready(function()
	{
		
		$("#cmbskills").change( 
			function(){
				
				var skill=this.value;
			    alert(skill);
				
				 $.get("/Etalenthunt/jsp/candidatedetails_home.jsp", 
				{
					cmbskill:skill
			
				},
				function(data,status){
					$("#div1").html(data);
					$("#div1").show();
			    	//$("#div1").hide(10000);
				}); 
			});
		});

	
	
	
</script>



</head>
<body style="margin: 0px;">
<div style="background-image:url('/Etalenthunt/images/Untitled.png') ;width: 100%; height: 700px;">
<div style="background-color:black;width:90%;height:80px;float:left;">
<h1 style="color: white" >Candidates</h1>
</div>
<div style="float: right;background-color: white;width: 10%;height: 80px;">
<h1><a href="/Etalenthunt/jsp/index.jsp" >Home</a></h1>
</div>


<%-- <%
  
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
 --%>

<div style="float: left;margin: 50px;">
<select name="cmbskills" id="cmbskills">
<option value="def">Select Skill</option>
<%String strsql="select * from skills";
ResultSet rs=CrudOperation.getData(strsql);
while(rs.next())
{
%>
<option value="<%=rs.getString("skillname") %>"><%=rs.getString("skillname") %></option>

<%} %>
</select>


</div>
<%-- <%} %> --%>

<div id="div1" style="height: 500px;width: 60%;">



</div>
</div>
</body>
</html>