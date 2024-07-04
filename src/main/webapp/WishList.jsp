<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*, control.*"%>
<%
List<String> favorites = (List<String>) session.getAttribute("favorites");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./CSS/shopcss.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/dbed6b6114.js"
	crossorigin="anonymous"></script>
<link rel="icon" type="image/png" href="IMG/Finale.png">
</head>
<body>
	<jsp:include page="./fragments/header.jsp" />
	<div class="products" id="products">
		<div class="container" id="container">
			<h1 class="lg-title">I miei preferiti</h1>
			<p class="text-light">Qui troverai tutti i tuoi prodotti
				preferiti</p>
			<div class="filters">
				<select class="category" id="categories" name="options">
					<option value="all" disabled selected hidden>Categoria</option>
					<option value="Amplificatori">Amplificatori</option>
					<option value="Cuffie">Cuffie</option>
					<option value="Mixer">Mixer</option>
					<option value="Tastiere">Tastiere</option>
					<option value="Chitarre Elettriche">Chitarre Elettriche</option>
				</select> <input type="number" class="category" id="minPrice" min="0"
					max="10000" placeholder="Min Price"> <input type="number"
					class="category" id="maxPrice" min="0" max="10000"
					placeholder="Max Price"> <select class="category" id="sort"
					name="sorts">
					<option value="" disabled selected hidden>Sort By</option>
					<option value="AZ">Alfabetico - A..Z</option>
					<option value="ZA">Alfabetico - Z..A</option>
					<option value="MaxMin">Prezzo - Max..Min</option>
					<option value="MinMax">Prezzo - Min..Max</option>
				</select>
				<button type="submit" onclick="filter()" class="category">FILTRA</button>
			</div>
			<%
			if (favorites != null && favorites.size() > 0) {
				int cont = 0;
				for (String s : favorites) {
					Prodotto p = ProdottoDAO.getProductByID(s);
					if (cont % 3 == 0) {
			%>
			<div class="product-items">
				<!-- Open new row -->
				<%
				}
				%>
				<!-- single product -->
				<div class="product">
					<div class="product-content">
						<div class="product-img">
							<img src="./GetPictureServlet?Product_ID=<%=p.getProduct_ID()%>" />
						</div>
						<div class="product-btns">
							<button type="button" class="btn-cart">
								Add to Cart <span><i class="fas fa-shopping-cart"></i></span>
							</button>
							<button type="button" class="btn-buy">
								<a
									href="./DettaglioPageServlet?Product_ID=<%=p.getProduct_ID()%>">Scopri</a>
								<span><i class="fas fa-plus"></i></span>
							</button>
						</div>
					</div>

					<div class="product-info">
						<div class="product-info-top">
							<h2 class="sm-title">Extreme Sound</h2>

						</div>
						<a href="#" class="product-name"><%=p.getProduct_Name()%></a>
						<p class="product-price">
							€
							<%=p.getPrice() + 20%></p>
						<p class="product-price">
							€
							<%=p.getPrice()%></p>
					</div>

					<div class="off-info">
						<h2 class="sm-title">25% off</h2>
					</div>
				</div>
				<!-- end of single product -->
				<%
				cont++;
				if (cont % 3 == 0) {
				%>
			</div>
			<!-- Close row -->
			<%
			}
			}

			// Close the last row if it was not closed
			if (cont % 3 != 0) {
			%>
		</div>
		<!-- Close the last row -->
		<%
		}
		} else {
		%>
		<p>Nessun prodotto nei preferiti</p>
		<%
		}
		%>
	</div>

	<script src="./JS/shopScript.js" defer></script>
	<jsp:include page="./fragments/footer.jsp" />
</body>
</html>
