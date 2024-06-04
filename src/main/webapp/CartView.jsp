<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,model.*, control.*"%>

<%
Carrello cart = (Carrello) request.getSession().getAttribute("carrello");
Collection<ProdottoCarrello> prodotti = null;
if (cart != null) {
    prodotti = cart.getProductsInCart();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="icon" type="image/png" href="IMG/Finale.png">
    <title>Catalogo AltaFrequenza</title>
</head>
<body>
	<% // Itera sui prodotti e popola la tabella HTML
            if (prodotti != null && !prodotti.isEmpty()) {
                for (ProdottoCarrello pc : prodotti) {
                    Prodotto p = pc.getProdotto();
     %>
    <h1 align="center">Prodotti nel carrello(<%= prodotti.size() %>)</h1>
    <table class="table table-striped">
        <thead class="table-primary">
            <tr>
                <th scope="col">Nome Prodotto</th>
                <th scope="col">Brand</th>
                <th scope="col">Modello</th>
                <th scope="col">Quantità</th>
                <th scope="col">Prezzo</th>
                <th scope="col">IVA</th>
                <th scope="col">Categoria</th>
                <th scope="col">Immagine</th>
                <th scope="col">Delete Product</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td scope="row"><a href="./DettaglioPageServlet?Product_ID=<%= p.getProduct_ID() %>"><%= p.getProduct_Name() %></a></td>
                <td><%= p.getBrand() %></td>
                <td><%= p.getModel() %></td>
                <td><%= pc.getQuantita() %></td>
                <td>&euro; <%= p.getPrice() %></td>
                <td><%= p.getIVA() %></td>
                <td><%= p.getCategoria_ID() %></td>
                <td><img src="./GetPictureServlet?Product_ID=<%= p.getProduct_ID() %>" onerror="this.src='./imgs/nophoto.png'" style="width:100px"></td>
                <td>
                    <form action="./RemoveFromCart?Product_ID=<%=p.getProduct_ID()%>" method="post" >
                        <button type="submit">X</button>
                    </form>
                </td>
            </tr>
            <% } %>
            <% } else { %>
            <tr><td colspan="9">Nessun prodotto nel carrello</td></tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>