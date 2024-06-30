<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.*, control.*"%>

<%
User user = (User) request.getSession().getAttribute("currentSessionUser");
Collection<Ordine> ordini = null;
if (user != null) {
    OrdineDAO ordineDAO = new OrdineDAO();
    ordini = OrdineDAO.getOrdiniByUser(user);
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
    <title>I tuoi ordini</title>
</head>
<body>
    <% if (user == null) { %>
    <p>Per favore, effettua il login per visualizzare i tuoi ordini.</p>
    <a href="LoginAndRegistration.jsp">Vai alla pagina di login</a>
    <% } else if (ordini != null && !ordini.isEmpty()) { %>
    <h1 align="center">I tuoi ordini(<%= ordini.size() %>)</h1>
    <table class="table table-striped table-custom">
        <thead class="table-primary table-head-custom">
            <tr>
                <th scope="col">ID Ordine</th>
                <th scope="col">Data Ordine</th>
                <th scope="col">Data Consegna</th>
                <th scope="col">Costo</th>
            </tr>
        </thead>
        <tbody class="table-body-custom">
            <% for (Ordine o : ordini) { %>
            <tr>
                <td scope="row"><%= o.getOrder_ID() %></td>
                <td><%= o.getOrder_Data() %></td>
                <td><%= o.getDelivery_Data() %></td>
                <td><%= o.getCost() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <tr>
    	<td colspan="4">Nessun ordine effettuato</td>
    </tr>
    <a href="shop.jsp">Torna al negozio</a>
    <% } %>
</body>
</html>