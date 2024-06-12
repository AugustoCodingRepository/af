<!DOCTYPE html>
<%@ page import="model.*"%>
<jsp:include page="fragments/header.jsp"/>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>AdminPanel</title>
	<link rel="stylesheet" type="text/css" href="CSS/adminPanel.css">
</head>
<body>
	<%User user = (User) request.getSession().getAttribute("currentSessionUser");%>
	<div class="name">
		<h1>Ciao <%=user.getNome()%><%=user.getCognome()%>.</h1>
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
				<h1>Utenti</h1>
				<p>Qui sono presenti i dati di tutti gli utenti del sito, accedi a questa pagina per visualizzarli</p>
				<a href="#" class="btn">Utenti</a>
			</div>
		</div>
		<div class="card">
			<img src="IMG/MyOrders.jpg">
			<div class="info">
				<h1>Catalogo</h1>
				<p>Qui sono presenti i prodotti in vendita sul sito, accedi a questa pagina per visualizzarli, modificarli o aggiungerli</p>
				<a href="./catalogo.jsp" class="btn">Catalogo</a>
			</div>
		</div>
		<div class="card">
			<img src="IMG/MyOrders.jpg">
			<div class="info">
				<h1>Ordini</h1>
				<p>Qui sono presenti gli ordini degli utenti, accedi a questa pagina per visualizzarli</p>
				<a href="#" class="btn">Ordini</a>
			</div>
		</div>
		<div class="card">
			<img src=IMG/Logout.jpg>
			<div class="info">
				<h1>Logout</h1>
				<p>Premi il pulsante qui sotto per uscire dal tuo account</p>
				<a href="<%= request.getContextPath() %>/Logout" class="btn">Logout</a>
			</div>
		</div>
	</div>
</body>
</html>