<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.*, control.*"%>

<%
User user = (User) request.getSession().getAttribute("currentSessionUser");
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="CSS/catalogoAndCarrello.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="IMG/Finale.png">
    <title>Catalogo AltaFrequenza</title>
</head>
<body>
	<% if (user != null && prodotti != null && !prodotti.isEmpty()) { %>
	<h1 align="center">Prodotti nel carrello(<%= prodotti.size() %>)</h1>
    <table class="table table-striped table-custom">
        <thead class="table-primary table-head-custom">
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
        <tbody class="table-body-custom">
            <% for (ProdottoCarrello pc : prodotti) {
                Prodotto p = pc.getProdotto();
            %>
            <tr>
                <td scope="row"><a href="./DettaglioPageServlet?Product_ID=<%= p.getProduct_ID() %>"><%= p.getProduct_Name() %></a></td>
                <td><%= p.getBrand() %></td>
                <td><%= p.getModel() %></td>
                <td><%= pc.getQuantita() %></td>
                <td>€ <%= p.getPrice() %></td>
                <td><%= p.getIVA() %></td>
                <td><%= p.getCategoria_ID() %></td>
                <td><img src="./GetPictureServlet?Product_ID=<%= p.getProduct_ID() %>" onerror="this.src='./imgs/nophoto.png'" style="width:100px"></td>
                <td>
                    <form action="./RemoveFromCart?Product_ID=<%=p.getProduct_ID()%>" method="post" >
                        <button type="submit" class="btn">-</button>
                    </form>
                </td>
            </tr>
            <% } %>
            <form action="./EffettuaOrdineServlet" method="post">
                <button type="submit">Acquista</button>
            </form>
        </tbody>
    	</table>
    	<% } else if (user == null) { %>
    	<p><a href="LoginAndRegistration.jsp">Per favore, effettua il login per acquistare i prodotti.</a></p>
    	<% } else { %>
    	<tr><td colspan="9">Nessun prodotto nel carrello</td></tr>
    	<a href="catalogo.jsp">Torna al catalogo</a>
    	<% } %>
        </tbody>
    </table>
</body>
</html>