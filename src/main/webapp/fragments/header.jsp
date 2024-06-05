<%@ page import="model.*"%>
<div class="container">
        <div class="navbar">
        <img src="./IMG/logo.png" class="logo">
        <nav>
            <ul>
            <li><a href="./index.jsp">HOME</a></li>
            <li><a href="">NEGOZIO</a></li>
            <li><a href="">ABOUT US</a></li>
            <% User user = (User) request.getSession().getAttribute("currentSessionUser");
				if(user != null){ %>
            <%if(user.isAmministratore()){ %>
            <li><a href="./catalogo.jsp">GESTIONE CATALOGO</a>
            <%}}else{%>
            <li><a href="./LoginAndRegistration.jsp">LOGIN</a></li>
            <%}%>
            </ul>
        </nav>
        <img src="./IMG/menu.png" class="menu-icon">
</div>