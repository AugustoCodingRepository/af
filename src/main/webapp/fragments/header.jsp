<!DOCTYPE html>
<html lang="it">
<head>
    <%@ page import="model.User" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="./CSS/header.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!-- HEADER -->
    <header class="header">
        <div class="header__content">
            <a class="header__logo" href="">
                <img src="./IMG/logo.png" class="logo" alt="Logo">
            </a>
            <ul class="header__menu">
                <li><a href="./index.jsp">Home</a></li>
                <li><a href="./shop.jsp">Shop</a></li>
                <li><a href="./aboutUs.html">About us</a></li>
                <li><a href="./contact.jsp">Contatti</a></li>
            </ul>
            <div class="header__icons">
                <a href="./carrello.jsp"><img src="./IMG/shoppingbag.png" class="menu-icon" id="carrello" alt="Carrello"></a>
                <img src="./IMG/menu2.png" class="menu-icon" id="dropdownIcon" alt="Menu">
                <div class="dropdown-menu" id="dropdownMenu">
                    <ul>
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

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var dropdownIcon = document.getElementById('dropdownIcon');
            var dropdownMenu = document.getElementById('dropdownMenu');
            var headerMenu = document.querySelector('.header__menu');

            // Toggle dropdown menu
            dropdownIcon.addEventListener('click', function() {
                if (dropdownMenu.style.display === "block") {
                    dropdownMenu.style.display = "none";
                } else {
                    dropdownMenu.style.display = "block";
                }
            });

            // Close the dropdown and mobile menu if the user clicks outside of them
            window.onclick = function(event) {
                if (!event.target.closest('.header__icons')) {
                    if (dropdownMenu.style.display === "block") {
                        dropdownMenu.style.display = "none";
                    }
                }
            };
        });
    </script>
</body>
</html>