<%@ page import="model.*"%>
<head>
<link rel="stylesheet" href="./CSS/header.css">
 <div class="container">
    <div class="navbar">
        <img src="./IMG/logo.png" class="logo">
        <nav>
            <ul>
            <% User user = (User) request.getSession().getAttribute("currentSessionUser");%>
                    <li><a href="./index.jsp">Home</a></li>
                    <li><a href="./about.jsp">About Us</a></li>
                    <%if(user != null){ %>
                    <% if(user.isAmministratore()){ %>
                        <li><a href="./adminPanel.jsp">AdminPanel</a></li>
                       	<li><a href="<%= request.getContextPath() %>/Logout.jsp">Logout</a></li>
                    <% }else{ %>
                    	<li><a href="./userPanel.jsp">MyAccount</a></li>
                    	<li><a href="<%= request.getContextPath() %>/Logout.jsp">Logout</a></li>
                <% }}else{%>
                	<li><a href="./LoginAndRegistration.jsp">Login</a></li>
                <% } %>
            </ul>
        </nav>
    </div>
</div>
</head>