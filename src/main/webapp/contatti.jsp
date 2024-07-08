<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contatti</title>
    <link rel="stylesheet" href="./CSS/contatti.css">
    <link rel="icon" type="image/png" href="IMG/Finale.png">
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
    <div class="contact-wrapper">
        <section class="contact">
            <div class="contact__info">
                <div class="descrizione">
                    <h2>Contattaci</h2>
                    <p>
                    Benvenuto nella sezione di contatto di Alta Frequenza! Siamo qui per aiutarti con ogni tua esigenza riguardante strumenti elettrici di alta qualità. Non esitare a contattarci per informazioni, supporto tecnico o per richieste di preventivi personalizzati.
                    
                    </p>
                </div>
                <div class="contact__details">
                    <img src="./IMG/map.png" alt="Location Icon">
                    <h3>Telefono:  </h3>
                    <br>
                    <p>081 2727002</p>
                    
                </div>
                <div class="contact__details">
                    <img src="./IMG/tel.png" alt="Phone Icon">
                    <h3>Email:</h3>
                    <br>
                    <p>altafrequenza27@gmail.com</p>
                </div>
                <div class="contact__details">
                    <img src="./IMG/mail.png" alt="Email Icon">
                    <h3>Indirizzo:  </h3>
                    <br>
                    <p>Via Giovanni Paolo II, 132, 84084 Fisciano SA</p>
                    
                </div>
            </div>
            <div class="contact__form">
                <h3>Manda un messaggio</h3>
                <form>
                    <input type="text" placeholder="Nome" required>
                    <input type="email" placeholder="Email" required>
                    <textarea placeholder="Scrivi il tuo messaggio..." required></textarea>
                    <button type="submit">Invia</button>
                </form>
            </div>
        </section>
        <div class="contact__map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3021.577776677542!2d14.788140575963588!3d40.77131037138472!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc5c7456b88bd%3A0x80bab96149d2993d!2sUniversit%C3%A0%20degli%20Studi%20di%20Salerno!5e0!3m2!1sit!2sit!4v1720396187550!5m2!1sit!2sit" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
    <footer class="footer">
        <jsp:include page="./fragments/footer.jsp"></jsp:include>
    </footer>
</body>
</html>
