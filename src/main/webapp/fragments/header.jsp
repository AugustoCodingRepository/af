<%@ page import="model.*"%>
<link href="./CSS/index.css" rel="stylesheet" type="text/css">

            <div class="navbar">
            <img src="logo.png" class="logo">
            <nav>
               <ul>
                <li><a href="./index.jsp">Home</a></li>
                <li><a href="./shop.jsp">Shop</a></li>
                <li><a href="#">About Us</a></li>
             <% User user = (User) request.getSession().getAttribute("currentSessionUser");
				if(user != null){ %>
            	<li><a href="./PersonalArea.jsp">MyAccount</a>
            <%}else{%>
            	<li><a href="./LoginAndRegistration.jsp">Login</a></li>
            <%}%>
               </ul>
            </nav>
            <img src="menu.png" class="menu-icon">
            </div>
        
            