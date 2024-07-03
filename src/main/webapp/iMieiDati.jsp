	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<% User user = (User) request.getSession().getAttribute("currentSessionUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>I miei dati</title>
<link rel="stylesheet" type="text/css" href="./CSS/UserDatasLabels.css">
</head>
<body>
<jsp:include page="./fragments/header.jsp"/>
<h1>I miei dati</h1>
<form id="updateForm" action="./UpdateUserDatas" method="post">
<div class="input-group">
    <input type="text" name="nome" disabled>
    <label><%=user.getNome() %></label>
</div>
<div class="input-group">
    <input type="text" name="cognome" disabled>
    <label><%= user.getCognome() %></label>
</div>
<div class="input-group">
    <input type="text" name="via" disabled>
    <label><%=user.getVia() == null ? "Inserisci via" :  user.getVia() %></label>
</div> 
<div class="input-group">
    <input type="number" name="civico" disabled>
    <label><%=user.getCivico() == 0 ? "Inserisci civico" :  user.getCivico() %></label>
</div> 
<div class="input-group">
    <input type="number" name="cap" disabled>
    <label><%=user.getCAP() == 0 ? "Inserisci CAP" :  user.getCAP() %></label>
</div>
<div class="input-group">
    <input type="text" name="citta" disabled>
    <label><%=user.getCitta() == null ? "Inserisci città" :  user.getCitta() %></label>
</div>
<div class="input-group">
    <input type="text" name="provincia" disabled>
    <label><%=user.getProvincia() == null ? "Inserisci provincia" :  user.getProvincia() %></label>
</div>
<div class="input-group">
    <input type="text" name="nazione" disabled>
    <label><%=user.getNazione() == null ? "Inserisci nazione" :  user.getNazione() %></label>
</div>
<div class="input-group">
    <input type="text" name="telefono" disabled>
    <label><%=user.getTelefono() == null ? "Inserisci telefono" :  user.getTelefono() %></label>
</div>
<button type="button" class="button" onclick="enableInputs()">
    <span class="button__text">Modifica</span>
    <span class="button__icon">
        <i class='bx bx-pencil'></i>
    </span>
</button>
<button type="submit" class="button">
    <span class="button__text">Salva</span>
    <span class="button__icon">
        <i class='bx bx-cloud-upload'></i>
    </span>
</button>
</form>
	<script defer src="./JS/scriptInput.js"></script>
	<jsp:include page="./fragments/footer.jsp"/>
</body>
</html>