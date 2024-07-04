<%@page import="model.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% Collection<User> users = UserDAO.getAllUsers(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Utenti del sito</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="CSS/catalogoAndCarrello.css" rel="stylesheet">
<link rel="icon" type="image/png" href="IMG/Finale.png">
</head>
<body>
	<jsp:include page="./fragments/header.jsp" />
	<h1 align="center">
		Utenti (<%= users.size() %>)
	</h1>
	<table class="table table-striped table-custom">
		<thead class="table-primary table-head-custom">
			<tr>
				<th scope="col">Nome</th>
				<th scope="col">Cognome</th>
				<th scope="col">Via</th>
				<th scope="col">Civico</th>
				<th scope="col">Città</th>
				<th scope="col">Cap</th>
				<th scope="col">Provincia</th>
				<th scope="col">Nazione</th>
				<th scope="col">Telefono</th>
				<th scope="col">Ruolo</th>
				<th scope="col">ToAdmin</th>
			</tr>
		</thead>
		<tbody class="table-body-custom">
			<% // Itera sui prodotti e popola la tabella HTML
    if (users != null && users.size() > 0) {
        for (User u : users) {
    %>
			<tr>
				<td scope="row"><%= u.getNome()  %></a></td>
				<td><%= u.getCognome() %></td>
				<td><%= u.getVia() %></td>
				<td><%= u.getCivico() %></td>
				<td><%= u.getCitta() %></td>
				<td><%= u.getCAP() %></td>
				<td><%= u.getProvincia() %></td>
				<td><%= u.getNazione() %></td>
				<td><%= u.getTelefono() %></td>
				<td><%= u.getRuolo() %></td>
				<td>
					<form action="./MakeAdmin=<%= u.getUser_ID() %>" method="post">
						<button type="submit" class="btn">-> Admin</button>
					</form>
				</td>
			</tr>
			<% }
    } else { %>
			<tr>
				<td colspan="10">Nessun utente disponibile</td>
			</tr>
			<% } %>
		</tbody>
	</table>
	<jsp:include page="./fragments/footer.jsp" />
</body>
</html>