<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@page import="etalenthunt.dbinfo.CrudOperation"%>
<%@page import="java.sql.*"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css" />
<style>
p.decor{
border-style :solid;
border-color: black;
font-size: 20px;
border-radius: 3px;
color: black;
font-style: italic;
font-weight: bold;
text-align: center;
}
.global{
text-decoration: none;
color: yellow;
}

</style>
<script src="/Etalenthunt/bootfiles/jquery-3.1.1.min.js"></script>
<script src="/Etalenthunt/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/bootfiles/bootstrap.min.css">


<script>
$(document).ready(function() {

	$("#aboutus").click(function() {
		
		$("#divright").load("/Etalenthunt/html/aboutus.html"); 
		
	})
	
})
</script>
<script>
var imgarr=new Array(5);
imgarr[0]="/Etalenthunt/images/talent-concept-illustration-depicting-illuminated-neon-sign-456071041.jpg";
imgarr[1]="/Etalenthunt/images/lyt.jpg";
imgarr[2]="/Etalenthunt/images/450918_4af0_3.jpg";
imgarr[3]="/Etalenthunt/images/white-party-background-with-dancing-silhouettes_1048-932.jpg";
imgarr[4]="/Etalenthunt/images/candi.jpg";
imgarr[5]="/Etalenthunt/images/img.jpg";

var idx=0;
function changeImage() {
	
	var im=document.getElementById("img1");
	im.src=imgarr[idx];
	idx++;
	if(idx>4)
		idx=0;
	setTimeout("changeImage()",2000);
}
</script>





</head>
<body bgcolor="black" style="margin: 0px" onload="changeImage()">
<div style="background-color:silver ;width:100%;height:1100px;float:left;"> 
<div style="background-color:black; ;width:100%;height:120px;float:left;"> 
<h1 style="font-family:AR DARLING;font-size: 54px;background-color:silver; " ><b>E-TalentHunt</b></h1>
<p class="decor" style="font-family: Magneto;background-color:silver; ;">Show What You Got!!</p>
</div>
<div style="background-color:black; width:100%; height:35px;float:left;">
<div style="background-color:yellow;width:110px;height:20px;float:left;margin-left:80px;text-align:center;margin-top: 8px;border-radius: 10px;"><a href="#aboutus.html" id="aboutus"><b>About Us</b></a></div>
<div style="background-color:yellow;width:140px;height: 20px;margin-left:15px;float:left;text-align:center;margin-top: 8px;border-radius: 10px;"><a href="/Etalenthunt/html/talentvideos.html"><b>Talent Videos</b></a></div>
<div style="background-color:yellow;width:190px;height:20px;margin-left:15px;float:left;text-align:center;margin-top: 8px;border-radius: 10px;"><a href="/Etalenthunt/html/famous.html"><b>Famous Personalities</b></a></div>
<div style="background-color:yellow;width:130px;height:20px;margin-left:15px;float:left;text-align:center;margin-top: 8px;border-radius: 10px;"><a href="/Etalenthunt/html/institutions.html"><b>Institutions</b></a></div>


<!-- <div style="background-color:yellow;width:180px;height: 20px;margin-left:10px;float:left;text-align:center;"><a href="../jsp/registration_candidate.jsp">Registration Candidate</a></div>
<div style="background-color:yellow;width:180px;height: 20px;margin-left:10px;float:left;text-align:center;"><a href="/jsp/registration_professional.jsp">Registration Professional</a></div> -->
<div style="background-color:yellow;width:110px;height: 20px;margin-left:15px;float:left;text-align:center;margin-top: 8px;border-radius: 10px;"><a href="/Etalenthunt/jsp/login.jsp"><b>Login</b></a></div>
<div style="background-color:yellow;width:110px;height: 20px;margin-left:15px;float:left;text-align:center;margin-top: 8px;border-radius: 10px;"><a href="/Etalenthunt/jsp/feedback.jsp"><b>Feedback</b></a></div>
<div style="background-color:yellow;width:180px;height: 20px;margin-left:15px;float:left;text-align:center;margin-top: 8px;border-radius: 10px;"><a href="/Etalenthunt/jsp/viewcandidates_home.jsp"><b>View Candidates</b></a></div>

<div class="dropdown" style="width:180px;height: 16px;float:left;text-align:center;font-family: Bauhaus 93;margin-top: 2px;">
    <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown" style="background-color: maroon ; border: none;border-radius: 18px;"><b>Registration</b>
    <span class="caret"></span></button>
    <ul class="dropdown-menu" style="border-radius: 30px;">
      <li><a href="../jsp/registration_candidate.jsp"><b>Candidate</b></a></li>
      <li><a href="../jsp/registration_professional.jsp"><b>Professional</b></a></li>
      <li><a href="../jsp/registration_user.jsp"><b>User</b></a></li>
    </ul>
  </div>

</div>
<div style="background-color:black; ;width:30%;height:845px;float:left">
<div style="width:100%;height:250px;float:left;margin-top: 10px;margin-left: 35px;">
<video src="/Etalenthunt/videos/Best Break-Dance Ever (Robot Dance).mp4" autoplay="autoplay" controls="controls" loop="loop" style="border-radius:20px;"></video>
</div>
<div style="width:100%;height:230px;float: left;">
<%
 String strsql="select * from postnews";
ResultSet rs=CrudOperation.getData(strsql);%>
<table class="global"  style="margin-left:10px;background-color: white ;opacity: .9;" cellpadding="3" cellspacing="0" border="1" width="95%">
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Subject</center></th>
<th style="background-color:black ; font-family: cursive;color: white;"><center>News</center></th>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Date</center></th>

</tr >
<% 
while(rs.next())
{
	String id=rs.getString("id");
	String sub=rs.getString("subject");
	
	
	%>
<tr>
<th><a href="/Etalenthunt/jsp/viewnews.jsp?nid=<%=id %>"><font size="3px"><center><%=sub%></center></font></a></th>

 <th style="color: navy;"><center><%=rs.getString("news") %></center></th>
<th style="color: maroon;"><center><%=rs.getString("date") %></center></th>
 </tr>
 <% } %>  
</table>


</div>

<div style="width:100%;height:355px;float:left;background-color: black;margin-left: 10px;border-radius: 20px;">
<img src="/Etalenthunt/images/candi.jpg" style="width:95%;height:100%;border-radius: 20px;" id="img1">
</div>

</div>
<div style="background-image:url('/Etalenthunt/images/dramaticaBackground.jpg') ;width:70%;height:845px;float:left;"  id="divright">

</div>
<div style="background-color:black ;width:100%;height:100px;float:left">
</div>
</div>
</body>
</html>