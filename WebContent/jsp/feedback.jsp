<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css" />
</head>
<body style="margin: 0px">
<div style="background-image:url('/Etalenthunt/images/8iGbejj8T.png') ; ;width:100%;height:800px;">

<div style="background-color: black ;width:90%;height:80px;float:left;">
<h2 class="fnt">Feedback</h2>
</div>
<div style="float: right;background-color: white;width: 10%;height: 80px;">
<h1><a href="/Etalenthunt/jsp/index.jsp" >Home</a></h1>
</div>


<!-- <div style="background-color:silver; width:35%; height:280px;float:left;margin-left: 450px;margin-top: 180px;border-radius:5px "> -->
<form action="/Etalenthunt/Feedback" method="post">
<table class="global" align="center" style="background-color:silver; width:35%; height:280px;float:left;margin-left: 450px;margin-top: 180px;background: none; " cellpadding=7>
<tr>
<th><font color="red"><b>Email</b></font></th>
<th><input type="email" id="txtuseremail" name="txtuseremail"  placeholder="enter email" required="required"></th>
</tr>
<tr>
<th><font color="red"><b>Name</b></font></th>
<th><input type="text" id="txtusername" name="txtusername"  placeholder="enter name" required="required"></th>
</tr>
<tr>
<th><font color="red"><b>Feedback</b></font></th>
<th><textarea rows=5 cols=22 placeholder="enter feedback" required="required" name="feedback" id="feedback"></textarea></th>
</tr>
<tr>
<td align="center" colspan=4>
<button type="submit" style="border-radius:20px;width: 40%;height: 28px;background-color: gray; border: none;"><b>Submit</b></button>
</td>
</tr>
</table>
</form>
<!-- </div> -->
</div>
</body>
</html>