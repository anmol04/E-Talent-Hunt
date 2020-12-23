<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Picture</title>
</head>
<body>
<div style="width:100%;height:800px;float:left;"> 
<!-- <div style="background-color:navy; width:100%;height:200px;float:left;margin-left: 40px"> -->
<form action="/Etalenthunt/UploadPic" method="post" enctype="multipart/form-data"> <!-- enctype="multipart/form-data" -for uploading data -->
<table class="global" style="margin: 70px; background-color: white ;opacity: .9"  border="1" width="50%">
<tr><th style="background-color:black ; font-family: cursive;color: white;"><b><center>Profile Picture</center></b></th></tr>
<tr><th><input type="file" name="fl" style="width: 100%"></th></tr>
<!-- <tr><th><input type="hidden" name="file" value="pic"></th></tr> -->
<tr><th><button type="submit" style="width: 100%;height: 28px;background-color: teal; border: none;">Upload</button></th></tr>
 </table>
 </form>
 <!-- </div> -->


 </div>
</body>
</html>