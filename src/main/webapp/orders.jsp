<%@page import="model.*" import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% List<Ordine> orders = OrdineDAO.getAll(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ordini del sito</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="CSS/catalogoAndCarrello.css" rel="stylesheet">
</head>
<body>
<jsp:include page="./fragments/header.jsp"/>
	<h1 align="center">Ordini (<%= orders.size() %>)</h1>
	<table class="table table-striped table-custom">
    <thead class="table-primary table-head-custom">
    <tr>
        <th scope="col">ID Ordine</th>
        <th scope="col">ID Utente</th>
        <th scope="col">Data Ordine</th>
        <th scope="col">Data Consegna</th>
        <th scope="col">Speso</th>
    </tr>
    </thead>
    <tbody class="table-body-custom">
    <% // Itera sui prodotti e popola la tabella HTML
    if (orders != null && orders.size() > 0) {
        for (Ordine o : orders) {
    %>
    <tr>
        <td scope="row"><%= o.getOrder_ID()  %></td>
        <td><%= o.getUser_ID() %></td>
        <td><%= o.getOrder_Data() %></td>
        <td><%= o.getDelivery_Data() %></td>
        <td><%= o.getCost() %></td>
    </tr>
    <% }
    } else { %>
    <tr><td colspan="10">Nessun ordine disponibile</td></tr>
    <% } %>
    </tbody>
</table>
</body>
</html>