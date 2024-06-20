<%@ page import="model.*"%>
<% User user = (User) request.getSession().getAttribute("currentSessionUser"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- custom css file link  -->
    <link rel="stylesheet" href="./CSS/parea.css">

</head>
<body>
	<jsp:include page="./fragments/header.jsp"/>
    
<div class="container">

    <h1 class="heading">our services</h1>

    <div class="box-container">

        <div class="box">
            <img src="image/icon-1.png" alt="">
            <h3>I tuoi dati</h3>
            <p>In questa sezione puoi visualizzare e modificare tutti i tuoi dati.</p>
            <a href="./iMieiDati.jsp" class="btn">Apri</a>
        </div>

        <div class="box">
            <img src="image/icon-2.png" alt="">
            <h3>La tua password</h3>
            <p>In questa sezione puoi visualizzare e modificare la tua password.</p>
            <a href="./laMiaPassword" class="btn">Apri</a>
        </div>

        <div class="box">
            <img src="image/icon-3.png" alt="">
            <h3>I tuoi ordini</h3>
            <p>Qui puoi visualizzare i tuoi ordini e i dettagli.</p>
            <a href="./iTuoiOrdini" class="btn">Apri</a>
        </div>
	<% if(user.isAmministratore()){%>
        <div class="box">
            <img src="image/icon-5.png" alt="">
            <h3>Catalogo</h3>
            <p>Qui puoi vedere i prodotti sul tuo sito, rimuoverli e aggiungerli.</p>
            <a href="./catalogo.jsp" class="btn">Apri</a>
        </div>

        <div class="box">
            <img src="image/icon-6.png" alt="">
            <h3>Utenti del sito</h3>
            <p>Qui troverai tutti gli utenti iscritti al sito e modificarne il ruolo.</p>
            <a href="#" class="btn">Apri</a>
        </div>
        
        <div class="box">
            <img src="image/icon-6.png" alt="">
            <h3>Ordini del sito</h3>
            <p>Qui troverai tutti gli ordini degli utenti iscritti al sito.</p>
            <a href="#" class="btn">Apri</a>
        </div>
	<% }%>
    </div>

</div>

</body>
</html>