<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Errore 404 - Pagina non trovata</title>
    <link rel="icon" type="image/png" href="IMG/Finale.png">
    <link rel="stylesheet" type="text/css" href="./CSS/PaginaDiErrore.css">
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>

    <div class="container">
        <h1>Errore 404</h1>
        <p>Siamo spiacenti, la pagina che stai cercando non esiste.</p>
        <a href="index.jsp">Torna alla homepage</a>
    </div>
    
    <jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>