<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>
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

$(document).ready(function()
		{
			
			$("#txtuserid").blur( 
				function(){
					
					var ui=this.value;
//				alert(ui);
					
					$.get("/Etalenthunt/RegistrationUser",   
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
<script>

function main()
{
	var userid=document.getElementById("txtuserid").value;
	var userpass=document.getElementById("txtuserpass").value;

	var userphno=document.getElementById("txtuserphno").value;
	var useremail=document.getElementById("txtuseremail").value;
	
	// alert(userid+userpass);
if(checkEmpty(userid)==false)
	{
	//alert("userid needed");
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

if(checkEmpty(userphno)==false)
{
//alert("userpass needed");
	document.getElementById("msgid").innerHTML="User Phone no. needed.";
document.getElementById("txtuserphno").focus();
return false;
}

if(userphno.length!=10)
{
document.getElementById("msgid").innerHTML="User Ph no. less than 10 digits.";
document.getElementById("txtuserphno").focus();
return false;
}
if(checkEmpty(useremail)==false)
{
//alert("userpass needed");
	document.getElementById("msgid").innerHTML="User Email needed";
document.getElementById("txtuseremail").focus();
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




</head>
<body style="margin: 0px" onload="blink()" bgcolor="white">
<div style="background-image:url('/Etalenthunt/images/IMG_3327241.jpg') ;width:100%;height:700px;float:left;">
<div style="background-color:black;width:90%;height:80px;float:left;">
<h1 id="h1">Registration</h1>
</div>
<div style="float: right;background-color: white;width: 10%;height: 80px;">
<h1><a href="/Etalenthunt/jsp/index.jsp" >Home</a></h1>
</div>

<!-- <div style="background-color:silver; width:35%; height:280px;float:left;margin-left: 400px;margin-top: 100px;border-radius:5px "> -->
<form onsubmit="return main()" action="/Etalenthunt/RegistrationUser" method="post">
<table class="global" align="center" style="background:none ; width:45%; height:250px;float:left;margin-left: 350px;margin-top: 100px;border: 2px ; border-color: black; " cellpadding=7 width="70%">
<tr>
<th>User ID:</th>
<th colspan=3><input type="text" id="txtuserid" name="txtuserid"  placeholder="Enter your ID"></th>
</tr>
<tr>
<th>User Password:</th>
<th colspan=3><input type="password" id="txtuserpass" name="txtuserpass"  placeholder="Enter your password"></th>
</tr>

<tr>
<th>Phone No. :</th>
<th colspan=3><input type="number" id="txtuserphno" name="txtuserphno"  placeholder="Enter your phone no."></th>
</tr>
<tr>
<th>Email:</th>
<th colspan=3><input type="email" id="txtuseremail" name="txtuseremail"  placeholder="Enter your email"></th>
</tr>
<tr>
<th>Gender:</th>
<th><input type="radio" id="rdosmale" name="rdos" value="Male">Male</th>
<th><input type="radio" id="rdosfemale" name="rdos" value="Female">Female</th>
</tr>

<tr>
<td align="center" colspan=2>
<button type="submit" style="border-radius:20px;width: 38%;height: 28px;background-color: teal; border: none;"><b>Submit</b></button>
</td>
<td align="center" colspan=2>
<button type="reset" style="border-radius:20px;width: 80%;height: 28px;background-color: teal; border: none;"><b>Reset</b></button>
</td>
</tr>

</table>
</form>
<!-- </div> -->
<div id="divmsg" style="width:15%;height: 50px;color:red;display: none; margin-top: 80px;margin-left: 0px;font-size: 20px;float: right;"></div>
<div id="msgid" style="width:15%;float:right;margin-top:100px;margin-left:0px;color:red;font-size: 20px;"></div>
</div>
</body>
</html>