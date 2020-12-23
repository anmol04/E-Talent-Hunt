<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,etalenthunt.dbinfo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Registration</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css">
<script src="/Etalenthunt/js/validation.js"></script>
<script src="/Etalenthunt/bootfiles/jquery-3.1.1.min.js"></script>
<script>
var c=0;
function blink() {
	if(c==0)
    	document.getElementById("h1").style.color="green";
	else
		document.getElementById("h1").style.color="aqua";
	c++;
	if(c>1)
		c=0;
	setTimeout("blink()",1000);
	
}

function main()
{
  	var userid=document.getElementById("txtuserid").value;
	 var userpass=document.getElementById("txtuserpass").value;
	var username=document.getElementById("txtusername").value;
	var useradd=document.getElementById("txtuseradd").value;
	var userphno=document.getElementById("txtuserphno").value;
	 var cmbskill=document.getElementById("cmbskills").value;
	
	
	// alert(userid+userpass);
if(checkEmpty(userid)==false)
	{
//	alert("userid needed");
	document.getElementById("msgid").innerHTML="User ID needed.";
	document.getElementById("txtuserid").focus();
	return false;
	}
  if(checkEmpty(userpass)==false)
{
//alert("userpass needed");
	document.getElementById("msgid").innerHTML="User Password needed.";
document.getElementById("txtuserpass").focus();
return false;
}
if(checkLength(userpass,8)==false)
{
document.getElementById("msgid").innerHTML="User Password less than 8 charaters.";
document.getElementById("txtuserpass").focus();
return false;
}

if(checkEmpty(username)==false)
{
//alert("userpass needed");
	document.getElementById("msgid").innerHTML="User Name needed.";
document.getElementById("txtusername").focus();
return false;
}
if(checkEmpty(useradd)==false)
{
//alert("userpass needed");
	document.getElementById("msgid").innerHTML="User Address needed.";
document.getElementById("txtuseradd").focus();
return false;
}


if(checkEmpty(userphno)==false)
{
//alert("userpass needed");
	document.getElementById("msgid").innerHTML="User Phone no. needed.";
document.getElementById("txtuserphno").focus();
return false;
}

if(userphno.length!=10)
{
document.getElementById("msgid").innerHTML="User Ph no. must be of 10 digits.";
document.getElementById("txtuserphno").focus();
return false;
}

if(checkCombo(cmbskill)==false)
{
document.getElementById("msgid").innerHTML="Select a valid skill!!";
document.getElementById("cmbskills").focus();

return false;
}


 
var chkar=document.getElementsByName("rdos");
if(checkCtrl(chkar)==false)
{
	document.getElementById("msgid").innerHTML="Select Gender!!";
	return false;
	
	} 
 
 return true;
	}
	</script>
<!--   	 <script>
 function call()
{
	
	//alert("in fun");

var cmbskill=document.getElementsByName("cmbskills");
	
var flag=0;
for(i=0;i<cmbskill.length;i++)
	{
	
	
	
	if(cmbskill[i].value=="Other")
		{
		
document.getElementById("other").style.display="block";
		
		document.getElementById("otherskill").style.display="block";
		
		
		}
alert(cmbskill[i].value);
	
//	alert(flag);

if(cmbskill[i].value=="def")
{
	
	flag=1;
	break;
}
	}

if(flag==1)
		{
		document.getElementById("msgid").innerHTML="Select a valid skill!!";
		
		}
	
	
	} 


</script>
 -->
<script>
$(document).ready(function()
{

	
	$("#txtuserid").blur( 
		function(){
			
			var ui=this.value;
//		alert(ui);
			
			$.get("/Etalenthunt/RegistrationCandidate",  
			{
				userid:ui
			},
			function(data,status){
				$("#divmsg").html(data);
		
				$("#divmsg").show();
				//$("#divmsg").hide(10000);
			});
		});
	});





</script>


</head>
<body style="margin: 0px" onload="blink()">
<div style="background-image:url('/Etalenthunt/images/ncBBp9rpi1.jpg') ;width:100%;height:800px;">

<div style="background-color:black;width:90%;height:80px;float:left;">
<h1 id="h1">Registration</h1>
</div>
<div style="float: right;background-color: white;width: 10%;height: 80px;">
<h1><a href="/Etalenthunt/jsp/index.jsp" >Home</a></h1>
</div>

<!-- <div style=" width:40%;float:left;background-color:gray;opacity:.9 ;margin-left:400px ;border-radius:5px; "> -->
<form onsubmit="return main()" action="/Etalenthunt/RegistrationCandidate" method="post" style="">
<table class="global" align="center" style="background:none ; width:45%; height:250px;float:left;margin-left: 380px;margin-top: 100px;border: 2px ; border-color: black; " cellpadding=7 width="70%">
<tr>
<th><font color="red"><b>User ID :</b></font></th>
<th colspan=3><input type="text" id="txtuserid" name="txtuserid"  placeholder="Enter your ID"></th>
</tr>
<tr>
<th><font color="red"><b>User Password :</b></font></th>
<th colspan=3><input type="password" id="txtuserpass" name="txtuserpass"  placeholder="Enter your password"></th>
</tr>
<tr>
<th><font color="red"><b>Name :</b></font></th>
<th colspan=3><input type="text" id="txtusername" name="txtusername"  placeholder="Enter your name"></th>
</tr>
<tr>
<th><font color="red"><b>Address :</b></font></th>
<th colspan=3><input type="text" id="txtuseradd" name="txtuseradd"  placeholder="Enter your address"></th>
</tr>
<tr>
<th><font color="red"><b>Phone No. :</b></font></th>
<th colspan=3><input type="number" id="txtuserphno" name="txtuserphno"  placeholder="Enter your phone no."></th>
</tr>
<tr>
<th><font color="red"><b>Skill :</b></font></th>
<!-- <th colspan=3><input type="text" id="txtuserskills" name="txtuserskills"  placeholder="Enter your skills"></th> -->
<th colspan="3">
<!-- size="5" multiple="multiple" onchange="call()" -->
<select name="cmbskills" id="cmbskills" style="width: 54%;">
<option value="def">Select Skill</option>
<%String strsql="select * from skills";
ResultSet rs=CrudOperation.getData(strsql);
while(rs.next())
{
%>
<option value="<%=rs.getString("skillname") %>"><%=rs.getString("skillname") %></option>

<%} %>
</select>
</th>
</tr>
<!-- <tr>
<th><label style="display: none;" id="other"><font color="red"><b>Other :</b></font></label></th>
<th  align="right"><input type="text" name="otherskill" id="otherskill" style="display: none;"></th>
</tr>
 -->
 <tr>
<tr>
<th><font color="red"><b>Email :</b></font></th>
<th colspan=3><input type="email" id="txtuseremail" name="txtuseremail"  placeholder="Enter your email"></th>
</tr>
<tr>
<th><font color="red"><b>Gender :</b></font></th>
<th><input type="radio" id="rdosmale" name="rdos" value="Male">Male</th>
<th><input type="radio" id="rdosfemale" name="rdos" value="Female">Female</th>
</tr>
<tr>
<td align="center" colspan=2>
<button type="submit" style="border-radius:20px;width: 45%;height: 28px;background-color: teal; border: none;"><b>Submit</b></button>
</td>
<td align="center" colspan=2>
<button type="reset" style="border-radius:20px;width: 100%;height: 28px;background-color: teal; border: none;"><b>Reset</b></button>
</td>
</tr>
</table>
</form>
<!-- </div> -->
<div id="divmsg" style="width:15%;height: 50px;color:red;display: none; margin-top: 80px;font-size: 20px;float: right;"></div>
<div id="msgid" style="width:15%;float:right;margin-top:100px;color:red;font-size: 20px;"></div>
</div>
</body>
</html>