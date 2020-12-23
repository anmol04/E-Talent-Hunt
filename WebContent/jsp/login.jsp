<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css" />
<script src="/Etalenthunt/js/validation.js"></script>

<script>
function main()
{
	var userid=document.getElementById("txtuserid").value;
	var userpass=document.getElementById("txtuserpass").value;
// alert(userid+userpass);
if(checkEmpty(userid)==false)
	{
	//alert("userid needed");
	document.getElementById("msgid").innerHTML="User_Id needed!!";
	document.getElementById("txtuserid").focus();
	return false;
	}
if(checkEmpty(userpass)==false)
{
//alert("userpass needed");
	document.getElementById("msgid").innerHTML="User_Pass needed!!";
document.getElementById("txtuserpass").focus();
return false;
}
 return true;
	}
</script>
</head>
<body style="margin: 0px">
<div style="background-image:url('/Etalenthunt/images/wpid-wp-14227228500471.jpeg') ;width:100%;height:800px;">
<div style="background-color: black ;width:90%;height:80px;float:left; border-radius: 5px;">
<h1 style="color: white;">Login</h1>
</div>
<div style="float: right;background-color: white;width: 10%;height: 80px;">
<h1><a href="/Etalenthunt/jsp/index.jsp" >Home</a></h1>
</div>

<% String message=(String)request.getAttribute("msg");
    if(message!=null)
    {
    	%>
    	
    	<h2 style="color:white"><%=message %></h2>
<%} %>   

<%-- <%
Cookie[]co=request.getCookies();
String ui="";
String upass="";
if(co!=null)
{
	String data="";
	if(co.length>0)
	for(int i=0;i<co.length;i++)
	{
		
		Cookie c=co[i];
		if(c.getName().equals("mycookie"))
		{
			data=c.getValue();
			break;
			
		}
		
	}
	if (data!=null){
	String[]carray=data.split("@");
	ui=carray[0];
	upass=carray[1];
	System.out.println(ui);
	System.out.println(upass);}

}
%>
 --%>


	<!-- 
		String data=null;
		Cookie[] c=request.getCookies();
		for(int i=0;i<c.length;i++)
		{
			Cookie co=c[i];
			if(co.getName().equals("mycookie"))
			{
				data=co.getValue();
				break;
			}
		}
		String[]arr=data.split("@");

 -->
<!-- <div style="background-color:silver; width:40%; height:220px;float:left;margin-left: 350px;margin-top: 180px;border-radius:5px "> -->
<form onsubmit="return main()" action="/Etalenthunt/Login" method="post">
<table class="global" align="center" style="background:none ; width:40%; height:220px;float:left;margin-left: 350px;margin-top: 180px;border: 2px ; border-color: black; " cellpadding=7 width="70%">
<tr>
<th>User_ID</th>
<th><input type="text" id="txtuserid" name="txtuserid"  placeholder="enter user id"></th>
<!-- <h6  id="msgid"></h6> -->
</tr>
<tr>
<th>User_Pass</th>
<th><input type="password" id="txtuserpass" name="txtuserpass"  placeholder="enter user password">
<!-- <h6  id="msgid"></h6> -->
</tr>
<!-- <tr>
<td align="center" colspan="2">
<input type="checkbox" name="chk" value="ok" id="rmbrme">Remember Me
</td>
</tr> -->
<tr>
<td colspan="2" align="center">
<button type="submit" style="border-radius:20px;width: 40%;height: 28px;background-color: teal; border: none;"><b>Submit</b></button>
</td>
</tr>
</table>
</form>
<!-- </div> -->
<div id="msgid" style="width=20%;float:left;margin-top:220px;margin-left=800px;color:white;"></div>
</div>
</body>
</html>