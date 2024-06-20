<%@ page import="model.*"%>
<head>
<link rel="stylesheet" href="./CSS/header.css">
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
            <li><a href="./PersonalArea.jsp">MyAccount</a>
            <%}else{%>
            <li><a href="./LoginAndRegistration.jsp">Login</a></li>
            <%}%>
            </ul>
        </nav>
</div>
</head>