<%@ page import="model.*"%>
    <div class="container">
            <div class="navbar">
            <img src="logo.png" class="logo">
            <nav>
               <ul>
                <li><a href="">HOME</a></li>
                <li><a href="">NEGOZIO</a></li>
                <li><a href="">ABOUT US</a></li>
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
        
            <video class="video-bg" src="video.mp4" autoplay muted loop></video>
        
            <!--SCROLL CON VIDEO2-->
            <div class="section watch in-page">       
                <h1 class="title">UNA NUOVA ERA<br>SUONI SENZA CONFINI
                </h1>
            </div>
    </div>