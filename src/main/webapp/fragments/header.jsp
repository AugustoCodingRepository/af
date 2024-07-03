		<link href="./CSS/header.css" rel="stylesheet" type="text/css">
		<header class="header">
            <div class="header__content">
              <a class="header__logo" href="">
                <img src="./IMG/logo.png" class="logo">
                </a>
              <ul class="header__menu">
                <li><a href="./index.jsp">Home</a></li>
                <li><a href="./shop.jsp">Shop</a></li>
                <li><a href="./aboutUs.html">About us</a></li>
                <li><a href="./contact.jsp">Contatti</a></li>
              </ul>
              <div class="header__icons">
                <img src="./IMG/shoppingbag.png" class="menu-icon">
                 
                  <div class="icon-hamburger">
                    <span></span>
                    <span></span>
                  </div>
                  <img src="./IMG/menu2.png" class="menu-icon" id="dropdownIcon">
                  <div class="dropdown-menu" id="dropdownMenu">
                      <ul>
                          <li><a href="./LoginAndRegistration.html">Accedi</a></li>
                          <li><a href="./LoginAndRegistration.html">Registrati</a></li>
                      </ul>
                  </div>
              </div>
            </div>
        </header>
        <script>
      //TENDINA
        document.addEventListener("DOMContentLoaded", function() {
var dropdownIcon = document.getElementById('dropdownIcon');
var dropdownMenu = document.getElementById('dropdownMenu');

dropdownIcon.addEventListener('click', function() {
    console.log('Icon clicked'); // Debug message
    if (dropdownMenu.style.display === "block") {
        dropdownMenu.style.display = "none";
    } else {
        dropdownMenu.style.display = "block";
    }
});

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
    if (!event.target.closest('#dropdownIcon')) {
        if (dropdownMenu.style.display === "block") {
            dropdownMenu.style.display = "none";
        }
    }
}
});


        //FINE TENDINA
        </script>