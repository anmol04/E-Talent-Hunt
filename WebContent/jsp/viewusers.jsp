<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,etalenthunt.dbinfo.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
<script src="/Etalenthunt/bootfiles/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css" />


	<script>           
	$(document).ready(function()
	{
		
		$("#cmbusertype").change( 
			function(){
				
				var ut=this.value;
			    alert(ut);
				
				$.get("/Etalenthunt/jsp/userdetails.jsp", 
				{
					usertype:ut
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
<body>
<div style="width:100%;height:800px;float:left;">

<select name="cmbusertype" id="cmbusertype" style="margin:20px;">
<option value="def">Select User Type</option>
<option value="admin">Admin</option>
<option value="candidate">Candidate</option>
<option value="professional">Professional</option>
<option value="user">End User</option>
<option value="all">All</option>

</select>

<div style="width:100%;height:780px;float:left" id="div1"></div>
</div>
</body>
</html>