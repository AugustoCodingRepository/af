<%@ page import="model.*"%>
<head>
<link rel="stylesheet" href="./CSS/header.css">
<div class="container">
        <div class="navbar">
        <img src="./IMG/logo.png" class="logo">
        <nav>
            <ul>
            <li><a href="./index.jsp">Home</a></li>
            <li><a href="./catalogo.jsp">Shop</a></li>
            <li><a href="">About Us</a></li>
            <% User user = (User) request.getSession().getAttribute("currentSessionUser");
				if(user != null){ %>
            <%if(user.isAmministratore()){ %>
            <li><a href="./adminPanel.jsp">AdminPanel</a>
            <%}else{%>
            <li><a href="./userPanel.jsp">MyAccount</a>
            <%}}else{%>
            <li><a href="./LoginAndRegistration.jsp">Login</a></li>
            <%}%>
            </ul>
        </nav>
</div>
</head>