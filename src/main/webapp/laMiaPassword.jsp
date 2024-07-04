<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%
User user = (User) request.getSession().getAttribute("currentSessionUser");
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./CSS/UserDatasLabels.css">
<link rel="icon" type="image/png" href="IMG/Finale.png">
</head>
<body>
	<jsp:include page="./fragments/header.jsp" />
	<h1>La mia password</h1>
	<form id="updatePassword" action="./UpdateUserPassword" method="post">
		<div class="input-group">
			<input type="text" name="oldPassword" disabled> <label>Old
				Password</label>
		</div>
		<div class="input-group">
			<input type="text" name="NewPassword" disabled> <label>New
				Password</label>
		</div>
		<div class="input-group">
			<input type="text" name="ConfirmNewPassword" disabled> <label>Confirm
				New Password</label>
		</div>
		<button type="button" class="button" onclick="enableInputs()">
			<span class="button__text">Modifica</span> <span class="button__icon">
				<i class='bx bx-pencil'></i>
			</span>
		</button>
		<button type="submit" class="button" id="activateButton">
			<span class="button__text">Salva</span> <span class="button__icon">
				<i class='bx bx-cloud-upload'></i>
			</span>
		</button>
	</form>
	<script defer src="./JS/scriptInput.js"></script>
	<jsp:include page="./fragments/footer.jsp" />
</body>
</html>