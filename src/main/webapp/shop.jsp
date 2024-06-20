<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Collection, model.Prodotto, model.ProdottoDAO, java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shop</title>
<link rel="stylesheet" href="./CSS/shopcss.css">
</head>
<body>
	<jsp:include page="./fragments/header.jsp"/>
	<section class="products" id="products">
    <div class="heading">
        <h2>Our popular products</h2>
    </div>
    <div class="products_container">
       <% 
                Collection<Prodotto> prodotti = ProdottoDAO.getAllProducts();
                if (prodotti != null && prodotti.size() > 0) {
                    for (Prodotto p : prodotti) {
            %>
            <div class="box">
<img src="./GetPictureServlet?Product_ID=<%= p.getProduct_ID() %>" onerror="this.src='./imgs/nophoto.png'" style="width:100px">                <h3><%= p.getProduct_Name() %></h3>
                	<div class="content">
                	<span>&euro;<%=p.getPrice() %></span>
                <!-- Usa javascript:void(0); per link senza destinazione -->
               			<a href="javascript:void(0);" onclick="/AddToCartServlet(<%= p.getProduct_ID() %>);">Add To Cart</a>
               			<script>
               				const Bytearray_<%=p.getProduct_ID()%> = <% p.getImgProduct(); %>
               				convertArrayToIMG(Bytearray_<%=p.getProduct_ID()%>);
               			</script>
            		</div>
            </div>
        <% 
                } 
            } else {
        %>
            <p>No products available.</p>
        <% 
            }
        %>
    </div>
</section>
<script defer src="./JS/imageConverter.js"></script>
</body>
</html>