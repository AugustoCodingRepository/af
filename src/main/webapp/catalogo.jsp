<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Collection, model.Prodotto, model.ProdottoDAO" %>
<%
// Ottieni la lista dei prodotti utilizzando ProdottoDAO
Collection<Prodotto> prodotti = ProdottoDAO.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Catalogo AltaFrequenza</title>
    <link rel="icon" type="image/png" href="IMG/Finale.png">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./CSS/carrello.css" type="text/css" rel="stylesheet">
</head>
<body>
<h1 align="center" >Catalogo dei Prodotti (<%= prodotti.size() %>)</h1>
<h2 align="center">
   
</h2>
<div class="container">
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
        <th scope="col">Add product</th>
    </tr>
    <tr>
        <form action="./AddingProduct" method="get">
            <th scope="col"><input class="form-control" type="text" name="product_name" placeholder="nome prodotto" required /></th>
            <th scope="col"><input class="form-control" type="text" name="brand" placeholder="brand" required /></th>
            <th scope="col"><input class="form-control" type="text" name="model" placeholder="modello" required /></th>
            <th scope="col"><input class="form-control" type="number" name="qt" placeholder="quantità" min="1" value="1" required /></th>
            <th scope="col"><input class="form-control" type="number" name="prize" placeholder="prezzo" min="0" value="0.00" step="0.01" required /></th>
            <th scope="col"><input class="form-control" type="number" name="IVA" placeholder="IVA" min="3" max="100" value="0.00" step="0.25" required /></th>
            <th scope="col"><input class="form-control" type="number" name="idCat" placeholder="id categoria" min="0" value="0" required /></th>
            <th scope="col"><input class="form-control" type="text" name="description" placeholder="descrizione" required /></th>
			<th scope="col"><input class="form-control" type="file" name="talkPhoto" value="" maxlength="255"></th>
            <th scope="col" colspan="2"><input class="form-control" type="submit" value="Aggiugni" required /></th>
        </form>
    </tr>
    </thead>
    <tbody class="table-body-custom">
    <% // Itera sui prodotti e popola la tabella HTML
    if (prodotti != null && prodotti.size() > 0) {
        for (Prodotto p : prodotti) {
    %>
    <tr>
        <td scope="row"><a href="./DettaglioPageServlet?Product_ID=<%= p.getProduct_ID() %>"><%= p.getProduct_Name() %></a></td>
        <td><%= p.getBrand() %></td>
        <td><%= p.getModel() %></td>
        <td><%= p.getQuantity() %></td>
        <td>&euro; <%= p.getPrice() %></td>
        <td><%= p.getIVA() %></td>
        <td><%= p.getCategoria_ID() %></td>
        <td><img src="./GetPictureServlet?Product_ID=<%= p.getProduct_ID() %>" onerror="this.src='./imgs/nophoto.png'" style="width:100px"></td>
        <td>
            <form action="./DeleteProductServlet?Product_ID=<%=p.getProduct_ID()%>" method="post">
                <button type="submit" class="btn"><i class='bx bxs-message-square-x'></i></button>
            </form>
        </td>
        <td></td>
    </tr>
    <% }
    } else { %>
    <tr><td colspan="10">Nessun prodotto disponibile</td></tr>
    <% } %>
    </tbody>
</table>
</div>
</body>
</html>