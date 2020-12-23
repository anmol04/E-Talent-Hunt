<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose</title>
<link rel="stylesheet" type="text/css" href="/Etalenthunt/css/mystyle.css">

</head>

<body>


<div style="width:100%; height:800px;float:left;border-radius:5px ">
<form action="/Etalenthunt/Compose" method="post">
<table class="global"  style="background-color: white ;opacity: .9;margin-left: 150px;margin-top: 80px;" cellpadding="3" cellspacing="0" border="1" width="70%">
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Receiver ID</center></th>
<th><input type="text" id="txtrecid" name="txtrecid" required="required" placeholder="enter receiver id" style="width: 100%;"></th>
</tr>
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Subject</center></th>
<th><input type="text" id="txtsub" name="txtsub" required="required" placeholder="enter subject" style="width: 100%"></th>
</tr>
<tr>
<th style="background-color:black ; font-family: cursive;color: white;"><center>Message</center></th>
<th><textarea rows=4 cols=20 name="txtarea" id="txtarea" required="required" style="width: 100%" placeholder="enter message"></textarea></th>
</tr>
<tr>
<td align="center">
<button type="reset" style="width: 100%;height: 28px;background-color: teal; border: none;"><b>Reset</b></button>
</td>
<td align="center">
<button type="submit" style="width: 100%;height: 28px;background-color: teal; border: none;"><b>Send</b></button>
</td>

</tr>
</table>
</form>
</div>
</body>
</html>