<!DOCTYPE html>
<%@ page import="model.*"%>
<jsp:include page="fragments/header.jsp"/>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>My Account</title>
	<link rel="stylesheet" type="text/css" href="CSS/accountmanagement.css">
</head>
<body>
	<%User user = (User) request.getSession().getAttribute("currentSessionUser");%>
	<div class="name">
		<h1>Ciao <%=user.getNome()%>, sei nella tua area personale.</h1>
	</div>
	<div class="wrapper">
		<div class="card">
			<img src="IMG/MyDatas.jpg">
			<div class="info">
				<h1>I tuoi dati</h1>
				<p>Qui sono presenti i tuoi dati, accedi a questa pagina per visualizzarli o modificarli</p>
				<a href="#" class="btn">I tuoi dati</a>
			</div>
		</div>
		<div class="card">
			<img src="IMG/MyOrders.jpg">
			<div class="info">
				<h1>I tuoi ordini</h1>
				<p>Qui sono presenti i tuoi ordini, accedi a questa pagina per visualizzarli</p>
				<a href="#" class="btn">I tuoi ordini</a>
			</div>
		</div>
		<div class="card">
			<img src="IMG/MyDatas.jpg">
			<div class="info">
				<h1></h1>
				<p>Qui sono presenti i tuoi dati, accedi a questa pagina per visualizzarli o modificarli</p>
				<a href="#" class="btn">I tuoi dati</a>
			</div>
		</div>
	</div>
</body>
</html>