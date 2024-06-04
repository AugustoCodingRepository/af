<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="IMG/Finale.png">
<meta charset="UTF-8">
<title>UPLOADING...</title>
</head>
<body>
<h3>PHOTO UPLOAD</h3>
<br>
<hr>
<form action="UploadPhotoServlet" enctype="multipart/form-data" method="post">
	Id:
	<input type="text" name="Product_ID">
	<br>
	<input class="file" type="file" name="talkPhoto" value="" maxlength="255">
	<br>
	<input type="submit"><input type="reset">
</form>


</body>
</html>