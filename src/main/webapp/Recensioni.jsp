<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aggiungi Recensione</title>
    <link rel="stylesheet" href="./CSS/recensioni.css">
    <link rel="icon" type="image/png" href="IMG/Finale.png">
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
	
    <main>
<<<<<<< HEAD
        <form action="./AddRecensioneServlet" method="post">
=======
        <form action="/AddRecensione" method="post">
>>>>>>> branch 'main' of https://github.com/AugustoCodingRepository/af.git
            <div class="form-group">
            <h1 id="intes">Aggiungi una recensione</h1>
                <label for="userName">Nome Utente:</label>
                <input type="text" id="userName" name="userName" required>
            </div>

            <div class="form-group">
                <label for="valutazione">Valutazione:</label>
                <div class="rating">
                    <input type="radio" id="star1" name="valutazione" value="1">
                    <label for="star1"></label>
                    <input type="radio" id="star2" name="valutazione" value="2">
                    <label for="star2"></label>
                    <input type="radio" id="star3" name="valutazione" value="3">
                    <label for="star3"></label>
                    <input type="radio" id="star4" name="valutazione" value="4">
                    <label for="star4"></label>
                    <input type="radio" id="star5" name="valutazione" value="5">
                    <label for="star5"></label>
                </div>
            </div>

            <div class="form-group">
                <label for="descrizione">Descrizione:</label>
                <textarea id="descrizione" name="descrizione" rows="4" cols="50" required></textarea>
            </div>

            <!-- Altri campi come userID e productID se necessario -->

            <button type="submit">Aggiungi Recensione</button>
        </form>
    </main>
    <jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>