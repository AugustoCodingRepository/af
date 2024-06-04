<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<!DOCTYPE html>
<% Prodotto prodotto = ProdottoDAO.getProductByID(request.getParameter("Product_ID"));%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dettaglio Prodotto</title>
    <link rel="icon" type="image/png" href="IMG/Finale.png">
</head>
<body>
    <h1>Dettaglio Prodotto</h1>
    <%-- Recupera il prodotto dalla richiesta --%>
    
    <%-- Visualizza i dettagli del prodotto --%>
    <p>ID Prodotto: <%= prodotto.getProduct_ID()%></p>
    <p>Nome: <%= prodotto.getProduct_Name() %></p>
    <p>Descrizione: <%= prodotto.getDescrizione() %></p>
    <p>Prezzo: <%= prodotto.getPrice() %></p>
    <p>Categoria: <%= prodotto.getCategoria_ID() %></p>
    <p>Brand: <%= prodotto.getBrand() %></p>
    <p>Modello: <%= prodotto.getModel() %></p>
    <p>IVA: <%= prodotto.getIVA() %></p>
    <p>Quantità: <%= prodotto.getQuantity() %></p>
    <p><img src="./GetPictureServlet?Product_ID=<%= prodotto.getProduct_ID() %>" onerror="this.src='./imgs/nophoto.png'" style="width:100px"></p>
</body>
</html>