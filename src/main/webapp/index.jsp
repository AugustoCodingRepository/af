<!DOCTYPE htlm>
<html >
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" contex="ie=edge">
    
        <title>
            Home Page
        </title>
        <link href="./CSS/index.css" rel="stylesheet" type="text/css">
        <link REL="icon" HREF="c++.png" TYPE="image/gif">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
    </head>

    <body> 
		
<div class="container">
           <jsp:include page="./fragments/header.jsp"/>

<!-- <div class="navbar">
            <img src="logo.png" class="logo">
            <nav>
                <ul>
                <li><a href="">HOME</a></li>
                <li><a href="">NEGOZIO</a></li>
                <li><a href="">ABOUT US</a></li>
                </ul>
            </nav>
            <img src="menu.png" class="menu-icon">
            </div>-->
        
            <video class="video-bg" src="video.mp4" autoplay muted loop></video> 
        
            <!--SCROLL CON VIDEO2-->
            <div class="section watch in-page">       
                <h1 class="title">UNA NUOVA ERA<br>SUONI SENZA CONFINI
                </h1>
            </div>
    </div>
    	<div class="section watch in-page">       
                <h1 class="title">UNA NUOVA ERA<br>SUONI SENZA CONFINI
                </h1>
            </div>
        <div class="section watch in-page">
            <h1 class="title">FATTI TRASPORTARE DALLE NOSTRE FREQUENZE</h1>
        </div>
        <div class="section watch in-page">
            <div class="content">
            <h1 class="title">ALTA FREQUENZA</h1>
            
            </div>
            <!--BOTTONE
            <div id="button">
                ESPLORA
            </div>
            -->
        </div>
        
        <div class="panel">
        <section class="about" id="about">
            <div class="about-img">
                <img src="aboutus.png" alt="" height="500px" width="700px">
            </div>
            <div class="about-text">
                <h2 class="title-big">La nostra storia</h2>
                <p>
                    Chiamarono il negozio "Riflessi di Tempo", specializzato in articoli vintage e artigianali. Marco si occupava degli oggetti antichi, 
                </p>
                <p>
                    Elena creava gioielli artigianali, Luca curava l'allestimento, e Sara gestiva le finanze.
                
                    Il negozio divenne presto un punto di riferimento nella comunità, grazie alla passione e all'abilità dei quattro amici. Organizzavano
                    anche laboratori creativi per coinvolgere i clienti. "Riflessi di Tempo" prosperò, dimostrando che con amicizia e impegno, anche i 
                    sogni più ambiziosi possono diventare realtà.
                </p>
                <button class="my-button">Scopri di più</button>
                <a href="#"  >Scopri di più</a>
            </div>
        </section>
        <!--
            <div id="card-area">
                <div class="wrapper">
                    <div class="box-area">
                        <img src="tastieracard.jpg" alt="">
                        <div class="overlay">
                            <h3>Tastiere</h3>
                            <p>
                                tastiera prova
                            </p>
                            <a href="#">BOOK</a>
                        </div>
                    </div>
                </div>
            </div>
        -->
        </div>
        
        


        

          
   

        <!--JAVA CODE-->
        <script>
            //elements
            var elements_to_watch = document.querySelectorAll('.watch');
            
            //callback
            var callback = function(items)
            {
                items.forEach((item) => 
                {
                    if(item.isIntersecting)
                    {
                        item.target.classList.add("in-page");
                    }
                    else
                    {
                        item.target.classList.remove("in-page");
                    }
                });
            }
            
            //observer
            var observer = new IntersectionObserver(callback, { threshold: 0.6});
        
            //apply
            elements_to_watch.forEach((element) =>
            {
                observer.observe(element);
            });
        </script>   
    </body>
</html>    