<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.*, java.util.*, javax.servlet.http.HttpSession"%>
    
<%

User user = (User) request.getSession().getAttribute("currentSessionUser");
Ordine o = OrdineDAO.selectOrdine(Integer.parseInt(request.getParameter("Order_ID")));
String pList = o.getProductList();
List<Integer> prodotti = Ordine.convertStringToArrayList(pList);

%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Ordine  #<%= o.getOrderID() %></title>
</head>
<body>
<br>
<br>
<br>
<br>
<jsp:include page="./fragments/header.jsp" />
	<%
	if (user == null) {
	%>
	<p>Per favore, effettua il login per visualizzare i tuoi ordini.</p>
	<a href="LoginAndRegistration.jsp">Vai alla pagina di login</a>
	<%
	} else if(o!=null) {
	%>

	<table class="table table-striped table-custom">
		<thead class="table-primary table-head-custom">
			<tr>
			<th scope="col">ID Prodotto</th>
				<th scope="col">Prodotto</th>
				<th scope="col">Costo</th>
				<th scope="col">Recensisci</th>
			</tr>
		</thead>
		<tbody class="table-body-custom">
			<%
			for (int p : prodotti) {
				Prodotto pr = ProdottoDAO.getProductByID(String.valueOf(p));
			%>
			<tr>
				<td><%=pr.getProduct_ID()%></td>
				<td><%=pr.getProduct_Name()%></td>
				<td><%=pr.getPrice()%></td>
				<td><a href="RecensioniServlet?ProductID=<%=pr.getProduct_ID()%>&userID=<%=user.getUser_ID()%>">Recensisci</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	} else {
	%>
	<tr>
		<td colspan="4">Nessun ordine effettuato</td>
	</tr>
	<a href="shop.jsp">Torna al negozio</a>
	<%
	}
	%>
	<jsp:include page="./fragments/footer.jsp" />
</body>
</html>