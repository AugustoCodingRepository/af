<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Collection, model.*" %>
<%
// Ottieni la lista dei prodotti utilizzando ProdottoDAO
Collection<Prodotto> prodotti = ProdottoDAO.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<meta charset="ISO-8859-1">
<title>Shop</title>
<link rel="stylesheet" href="./CSS/parea.css">
</head>
<body>
	    
	<div class="container">
		<jsp:include page="./fragments/header.jsp"/>
    <h1 class="heading">our products</h1>

    <div class="box-container">
<% // Itera sui prodotti e popola la tabella HTML
    if (prodotti != null && prodotti.size() > 0) {
        for (Prodotto p : prodotti) {
    %>
        <div class="box">
            <img src="./GetPictureServlet?Product_ID=<%=p.getProduct_ID() %>" alt="">
            <h3><%= p.getProduct_Name() %></h3>
            <p><%= p.getPrice() %></p>
            <a href="./DettaglioShopPageServlet?Product_ID=<%= p.getProduct_ID() %>" class="btn">Scopri di più</a>
            <form action="./AddToCartServlet?Product_ID=<%= p.getProduct_ID() %>" method="post">
                <button type="submit" class="btn"><i class='bx bx-cart-add'></i></button>
            </form>
        </div><% }
    } else { %>
    Nessun prodotto disponibile
    <% } %>
	</div>
	</div>
	
</html>