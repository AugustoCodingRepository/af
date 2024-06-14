<%@ page import="model.*"%>
<head>
<link rel="stylesheet" href="./CSS/header.css">
<div class="container">
    <div class="navbar">
        <img src="./IMG/logo.png" class="logo">
        <nav>
            <ul>
            <% User user = (User) request.getSession().getAttribute("currentSessionUser");
                if(user != null && user.getRuolo() != null){ %>
                    <li><a href="./index.jsp">Home</a></li>
                    <li><a href="./ordine.jsp">I Miei Ordini</a></li>
                    <li><a href="./about.jsp">About Us</a></li>
                    <% if(user.isAmministratore()){ %>
                        <li><a href="./adminPanel.jsp">AdminPanel</a></li>
                    <% } %>
                    <li><a href="./userPanel.jsp">MyAccount</a></li>
                    <li><a href="./Logout.jsp">Logout</a></li>
                <% } else if (user != null) { %>
                    <li><a href="./index.jsp">Home</a></li>
                    <li><a href="./ordine.jsp">I Miei Ordini</a></li>
                    <li><a href="./about.jsp">About Us</a></li>
                    <li><a href="./userPanel.jsp">MyAccount</a></li>
                    <li><a href="<%= request.getContextPath() %>/Logout">Logout</a></li>
                <% } else { %>
                    <li><a href="./LoginAndRegistration.jsp">Login</a></li>
                <% } %>
            </ul>
        </nav>
    </div>
</div>
</head>