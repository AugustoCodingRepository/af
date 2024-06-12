<%@ page import="model.*"%>
<head>
<link rel="stylesheet" href="./CSS/style.css">
<div class="container">
        <div class="navbar">
        <img src="./IMG/logo.png" class="logo">
        <nav>
            <ul>
            <li><a href="./index.jsp">Home</a></li>
            <li><a href="">Shop</a></li>
            <li><a href="">About Us</a></li>
            <% User user = (User) request.getSession().getAttribute("currentSessionUser");
				if(user != null){ %>
            <%if(user.isAmministratore()){ %>
            <li><a href="./catalogo.jsp">Catalogo</a>
            <li><a href="./catalogo.jsp">AdminPanel</a>
            <%}else{%>
            <li><a href="./AccountManagement.jsp">MyAccount</a>
            <%}}else{%>
            <li><a href="./LoginAndRegistration.jsp">Login</a></li>
            <%}%>
            </ul>
        </nav>
        <img src="./IMG/menu.png" class="menu-icon">
</div>
</head>