<!DOCTYPE html>
<html lang="it">
<head>
    <%@ page import="model.User" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="./CSS/header.css" rel="stylesheet" type="text/css">
    <script src="./JS/header.js"></script>
</head>
<body>
    <!-- HEADER -->
    <header class="header">
        <div class="header__content">
            <a class="header__logo" href="">
                <img src="./IMG/logo.png" class="logo" alt="Logo">
            </a>
            <ul class="header__menu desktop-only">
                <li><a href="./index.jsp">Home</a></li>
                <li><a href="./shop.jsp">Shop</a></li>
                <li><a href="./aboutUs.html">About us</a></li>
                <li><a href="./contact.jsp">Contatti</a></li>
            </ul>
            <div class="header__icons">
                <a href="./carrello.jsp" aria-label="Visualizza il carrello">
                    <img src="./IMG/shoppingbag.png" class="menu-icon" id="carrello" alt="Carrello">
                </a>
                <img src="./IMG/menu2.png" class="menu-icon" id="dropdownIcon" alt="Menu" tabindex="0" aria-expanded="false" aria-controls="dropdownMenu">
                <div class="dropdown-menu" id="dropdownMenu" role="menu" aria-hidden="true">
                    <ul>
                        <li class="mobile-only"><a href="./index.jsp">Home</a></li>
                        <li class="mobile-only"><a href="./shop.jsp">Shop</a></li>
                        <li class="mobile-only"><a href="./aboutUs.html">About us</a></li>
                        <li class="mobile-only"><a href="./contact.jsp">Contatti</a></li>
                        <% User user = (User) request.getSession().getAttribute("currentSessionUser"); 
                           if (user == null) { %>
                            <li><a href="./LoginAndRegistration.jsp">Accedi</a></li>
                            <li><a href="./LoginAndRegistration.jsp">Registrati</a></li>
                        <% } else { %>
                            <li><a href="./PersonalArea.jsp">Profilo</a></li>
                            <li><a href="Logout">Logout</a></li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>
    </header>
</body>
</html>