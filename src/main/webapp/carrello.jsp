<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.*,control.*"%>

<%
Carrello cart = (Carrello) request.getSession().getAttribute("carrello");
Collection<ProdottoCarrello> prodotti = null;
double total = 0;
if (cart != null) {
	prodotti = cart.getProductsInCart();
	log(String.valueOf(prodotti.size()));
}
%>
<html>
<head>
<title>Shopping Bag</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">
<link href="./CSS/carrello.css" type="text/css" rel="stylesheet">
<link rel="icon" type="image/png" href="IMG/Finale.png">
</head>
<body>
<jsp:include page="./fragments/header.jsp"></jsp:include>
<div class="container mt-5 mb-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-8">
            <div class="p-2">
            	<br>
                <h4>Shopping cart</h4>
            </div>
            <div class="settings">
                <button type="submit" onclick="svuotaCarrello()" class="category">Svuota</button>
                <button type="submit" onclick="aggiorna()" class="category">Aggiorna</button>
            </div>
            <% if (prodotti != null && prodotti.size() > 0) {
                for (ProdottoCarrello p : prodotti) {
            %>
            <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                <div class="mr-1"><img src="./GetPictureServlet?Product_ID=<%= p.getProdotto().getProduct_ID() %>" onerror="this.src='./imgs/nophoto.png'" style="width:70px"></div>
                <div class="d-flex flex-column align-items-center product-details"><span class="font-weight-bold"><%=p.getProdotto().getProduct_Name() %></span>
                    <div class="d-flex flex-row product-desc">
                        <div class="size mr-1"><span class="text-grey">Model:</span><span class="font-weight-bold">&nbsp;<%=p.getProdotto().getModel() %></span></div>
                        <div class="color"><span class="text-grey">Brand:</span><span class="font-weight-bold">&nbsp;<%=p.getProdotto().getBrand() %></span></div>
                    </div>
                </div>
                <div class="d-flex flex-row align-items-center qty">
                    <i class="fa fa-minus text-danger"></i>
                    <h5 class="text-grey mt-1 mr-1 ml-1">
                        <input type="number" min=1 max=<%=p.getProdotto().getQuantity()%> value=1 class="quantity" data-price="<%=p.getProdotto().getPrice()%>">
                    </h5>
                    <i class="fa fa-plus text-success"></i>
                </div>
                <div>
                    <h5 class="text-grey"><%= p.getProdotto().getPrice() %></h5>
                </div>
                <div>
                    <form action="./RemoveFromCart?Product_ID=<%= p.getProdotto().getProduct_ID() %>" method="post">
                        <h5 class="text-grey"><button type="submit">Rimuovi</button></h5>
                    </form>
                </div>
                <div class="d-flex align-items-center"><i class="fa fa-trash mb-1 text-danger"></i></div>
            </div>
            <% total += p.getProdotto().getPrice();}} else {%>
            <p>Il carrello è vuoto</p>
            <% } %>
        </div>
    </div>
    <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
        <input type="text" class="form-control border-0 gift-card" placeholder="discount code/gift card" value="Il totale da pagare per il tuo ordine è di <%=total %> euro" style="text-align:center; font-weight: 900;" disabled>
    </div>
    <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded">
    <a href="./checkout.jsp" id="checkoutLink"><button class="btn btn-warning btn-block btn-lg ml-2 pay-button" id="payButton" type="button">Proceed to Pay</button></a>
</div>

</div>
<!-- jQuery (necessario per Bootstrap) -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- Popper.js (necessario per alcuni componenti Bootstrap) -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<!-- Bootstrap Bundle JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

	<script>
		function aggiorna() {
			location.reload();
		}

		function svuotaCarrello() {
			const xhr = new XMLHttpRequest();
			xhr.open("GET", "./SvuotaCarrelloServlet", true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					location.reload();
				}
			};
			xhr.send();
		}

		function ricalcolaTotale() {
			let total = 0;
			const quantities = document.querySelectorAll('.quantity');

			quantities.forEach(function(input) {
				const quantity = parseInt(input.value);
				const price = parseFloat(input.getAttribute('data-price'));
				total += quantity * price;
			});

			// Aggiorna il campo del totale
			const totalField = document.querySelector('.gift-card');
			totalField.value = "Il totale da pagare per il tuo ordine è di "
					+ total.toFixed(2) + " euro";
		}

		document.addEventListener('DOMContentLoaded', function() {
			const quantities = document.querySelectorAll('.quantity');

			quantities.forEach(function(input) {
				input.addEventListener('change', ricalcolaTotale);
				input.addEventListener('input', ricalcolaTotale); // Aggiungi anche l'evento input per ricalcoli più immediati
			});

			// Chiamare ricalcolaTotale inizialmente per calcolare il totale al caricamento della pagina
			ricalcolaTotale();
		});
		
		document.addEventListener('DOMContentLoaded', function() {
		    const quantities = document.querySelectorAll('.quantity');
		    const checkoutLink = document.getElementById('checkoutLink');

		    function ricalcolaTotale() {
		        let total = 0;
		        quantities.forEach(function(input) {
		            const quantity = parseInt(input.value);
		            const price = parseFloat(input.getAttribute('data-price'));
		            total += quantity * price;
		        });

		        // Aggiorna il campo del totale
		        const totalField = document.querySelector('.gift-card');
		        totalField.value = "Il totale da pagare per il tuo ordine è di " + total.toFixed(2) + " euro";

		        // Imposta il link di checkout con il valore totale
		        checkoutLink.href = "./checkout.jsp?total=" + total.toFixed(2);
		    }

		    quantities.forEach(function(input) {
		        input.addEventListener('change', ricalcolaTotale);
		        input.addEventListener('input', ricalcolaTotale);
		    });

		    // Chiamare ricalcolaTotale inizialmente per calcolare il totale al caricamento della pagina
		    ricalcolaTotale();
		});

	</script>
	<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>
