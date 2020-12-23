<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post Event News</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css">

</head>

<body>

<div style="width:100%; height:800px;float:left;">
<form action="/Etalenthunt/Post" method="post">
<table class="global"  style="background-color: white ;opacity: .9;margin-left: 150px;margin-top: 80px;" cellpadding="3" cellspacing="0" border="1" width="50%">
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Subject</center></th>
<th><input type="text" id="txtsub" name="txtsub" required="required" placeholder="enter subject" style="color: black;width: 100%;"></th>
</tr>
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Event News</center></th>
<th><textarea rows=4 cols=19 name="txtarea" id="txtarea" required="required" placeholder="enter event news" style="color: black;width: 100%;"></textarea></th>
</tr>
<tr>
<td align="center">
<button type="reset" style="width: 100%;height: 28px;background-color: teal; border: none;"><b>Reset</b></button>
</td>
<td align="center">
<button type="submit" style="width: 100%;height: 28px;background-color: teal; border: none;"><b>Post</b></button>
</td>

</tr>
</table>
</form>
</div>

</body>
</html>