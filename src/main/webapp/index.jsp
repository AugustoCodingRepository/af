<!DOCTYPE htlm>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" contex="ie=edge">

<title>Home Page</title>
<link href="./CSS/index.css" rel="stylesheet" type="text/css">
<link REL="icon" HREF="./IMG/c++.png" TYPE="image/gif">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap"
	rel="stylesheet">
</head>

<body>

	<jsp:include page="./fragments/header.jsp"></jsp:include>

	<!--SCROLL CON VIDEO2-->
	<div class="section watch in-page">
		<video class="video-bg" src="./IMG/video.mp4" autoplay muted loop></video>
		<h1 class="title">
			UNA NUOVA ERA<br>SUONI SENZA CONFINI
		</h1>
	</div>
	<div class="section watch in-page">
		<h1 class="title" style="margin-left: 25%;">FATTI TRASPORTARE
			DALLE NOSTRE FREQUENZE</h1>
	</div>
	<div class="section watch in-page">
		<h1 class="title" style="margin-left: 33%;">ALTA FREQUENZA</h1>
	</div>

	<!--separatore-->
	<div class="panel2">
		<div class="contenitore">
			<h2 class="watch fade-in titolo">La Nostra Storia</h2>
		</div>
	</div>

	<div class="panel">
		<div class="div-separato">

			<section class="about" id="about">
				<div class="about-img">
					<img class="watch fade-in" src="./IMG/aboutus.png" alt=""
						height="500px" width="700px">
				</div>
				<div class="watch fade-in about-text">
					<p class="watch fade-in">Augusto, Antonio, Federica e Francesco
						si incontrarono per la prima volta durante il loro secondo anno di
						università. L'incontro avvenne durante una lezione di
						progettazione di tecnologie e software per il web. La
						professoressa assegnò loro un progetto di gruppo: sviluppare un
						sito web innovativo. La passione comune per la musica elettrica li
						spinse a lavorare insieme, dando inizio a una collaborazione che
						avrebbe cambiato le loro vite...</p>

					<div class="button-container ">
						<button style="margin-left: auto;">Scopri di pi&uacute;</button>
					</div>
				</div>

			</section>
		</div>
	</div>



	<!--separatore-->
	<div class="panel2">
		<div class="contenitore">
			<h2 class="watch fade-in titolo">I Nostri Prodotti</h2>
		</div>
	</div>

	<!--Card-->
	<div class="panel">
		<div class="card-grid">
			<a class="card" href="shop.jsp">
				<div class="card__background"
					style="background-image: url(./IMG/img3.jpeg)"></div>
				<div class="card__content">
					<p class="card__category">Categoria</p>
					<h3 class="card__heading">Amplificatori</h3>
				</div>
			</a> <a class="card" href="shop.jsp">
				<div class="card__background"
					style="background-image: url(./IMG/img4.jpg)"></div>
				<div class="card__content">
					<p class="card__category">Categoria</p>
					<h3 class="card__heading">Chitarre elettriche</h3>
				</div>
			</a> <a class="card" href="shop.jsp">
				<div class="card__background"
					style="background-image: url(./IMG/img2.jpg)"></div>
				<div class="card__content">
					<p class="card__category">Categoria</p>
					<h3 class="card__heading">Tastiere</h3>
				</div>
				</li> <a class="card" href="shop.jsp">
					<div class="card__background"
						style="background-image: url(./IMG/img1\ \(2\).jfif)"></div>
					<div class="card__content">
						<p class="card__category">Categoria</p>
						<h3 class="card__heading">Mixer</h3>
					</div>
			</a>
		</div>
	</div>

	<!--separatore-->
	<div class="panel2">
		<div class="contenitore">
			<h2 class="watch fade-in titolo">Nuovi Arrivi</h2>
		</div>
	</div>

	<!--NUOVI-->
	<div class="panel">
		<div class="container">
			<div class="watch fade-in imgBx">
				<img src="./IMG/43.png" alt="">
			</div>
			<div class="watch fade-in details">
				<div class="watch fade-in content">
					<h2>
						Che suono ha la magia?<br> <span>PureTune</span>
					</h2>
					<p>Siamo entusiasti di annunciare il lancio delle nostre nuove
						cuffie Alta Frequenza 'PureTune', pronte a rivoluzionare
						l'esperienza audio. Con un design elegante e moderno, le PureTune
						combinano tecnologia avanzata e comfort superiore, rendendole
						l'articolo dell'anno per tutti gli appassionati di musica.</p>
					<h3>A partire da: 100 &euro;</h3>
					<button class="button1">Scopri di pi&uacute;</button>
				</div>
			</div>
		</div>
	</div>

	<!--separatore
  <div class="panel2">
    <div class="contenitore">
      <h2 class="watch fade-in titolo">
        Nuovi Arrivi
      </h2>
    </div>
    </div>-->


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
	<jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>
