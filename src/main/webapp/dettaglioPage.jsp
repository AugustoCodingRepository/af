<%@page import="java.io.Console"%>
<%@page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.*, java.util.*, javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<%
	Prodotto p = ProdottoDAO.getProductByID(request.getParameter("Product_ID"));
	List<String> favorites = (List<String>) session.getAttribute("favorites");
	 boolean isFavorite = false;
	    if (favorites != null) {
	        for (String favoriteId : favorites) {
	        	String pid = (String.valueOf(p.getProduct_ID()));
	            if (favoriteId.equals(pid)){
	                isFavorite = true;
	                break;
	            }
	        }
	    }
%>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link rel="stylesheet" href="./CSS/detail.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
  <section>
    <div class="container flex">
      <div class="left">
        <div class="main_image">
          <img src="./GetPictureServlet?Product_ID=<%=p.getProduct_ID() %>" width=450 height=450 class="slide">
        </div>
      </div>
      <div class="right">
        <h3><%=p.getProduct_Name() %></h3>
        <input type="text" value=<%= p.getProduct_ID() %> hidden=true id="IDP"/>
        <h4> <small>€</small><%=p.getPrice() %> </h4>
        <p> <%=p.getDescrizione() %> </p>
        <h5>Quantity</h5>
        <span><input type="number" id="quantity" min="0" max="<%= p.getQuantity() %>" value=0/></span>
        <br><i class='<%= isFavorite ? "bx bxs-heart" : "bx bx-heart" %>' id="<%= isFavorite ? "prefSi" : "prefNo" %>">Preferiti</i>
        <form action="./AddToCartServlet?Product_ID=<%= p.getProduct_ID() %>" method="post">
		<button type="submit" class="button">Aggiungi al carrello</button>
		</form>
      </div>
    </div>
  </section>
  <script src="./JS/detailPage.js" defer></script>
</body>
</html>
