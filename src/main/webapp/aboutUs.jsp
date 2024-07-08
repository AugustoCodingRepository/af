<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="./CSS/aboutUs.css">
</head>
<body>
	<jsp:include page="./fragments/header.jsp"></jsp:include>
    <header>
        <h1>About Us</h1>
    </header>
    <section class="description">
        <h2>La nostra storia</h2>
        <p>
            Augusto, Antonio, Federica e Francesco si incontrarono per la prima volta durante il loro secondo anno di università. L'incontro avvenne durante una lezione di progettazione di tecnologie e software per il web. La professoressa assegnò loro un progetto di gruppo: sviluppare un sito web innovativo. La passione comune per la musica elettrica li spinse a lavorare insieme, dando inizio a una collaborazione che avrebbe cambiato le loro vite.
        </p>
    </section>
    <section class="description">
        <h2>Da dove nasce il nostro brand</h2>
        <p>
            Durante una delle loro prime riunioni, i quattro amici notarono che le iniziali dei loro nomi formavano un acronimo interessante: A e A per Antonio e Augusto, F e F per Francesco e Federica. Fu così che nacque l'idea di chiamare il loro sito web "Alta Frequenza", un nome che riflette sia l'acronimo delle loro iniziali (AF) sia la loro passione per gli strumenti musicali elettrici.
        
            Decisero di creare un sito che non solo vendesse strumenti musicali, ma fosse anche una risorsa educativa e una comunità per musicisti. Il loro obiettivo era offrire tastiere, chitarre elettriche, mixer, amplificatori e cuffie, insieme a contenuti di alta qualità.
        </p>
    </section>
    <section class="team">
        <h2>Il nostro Team</h2>
        <div class="card">
            <h3>Augusto Persico - Database Developer</h3>
            <p>
                Augusto è uno sviluppatore che si è interfcciato soprattutto nella gestione di tutto ciò che riguarda il lato back-end, ovvero: database, Java e JSP. 
                La sua competenza in Java e JSP gli consente di creare soluzioni scalabili e robuste, garantendo al contempo un'integrazione fluida con l'infrastruttura esistente.
            </p>    
            </div>
        <div class="card">
            <h3>Antonio Picarella - Project Proposal and Content Specialist</h3>
            <p>
            Antonio è una sviluppatore con una passione per la proposta di progetti e la cura dei testi. La sua abilità nel redigere proposte chiare e persuasive ha contribuito a ottenere finanziamenti e supporto per numerosi progetti innovativi. Inoltre, la sua attenzione ai dettagli e la capacità di creare contenuti coinvolgenti garantiscono che ogni progetto sia presentato in modo professionale e accattivante.
           </p>
        </div>
        <div class="card">
            <h3>Federica Iuliano - Front-End Developer & Graphic Designer</h3>
            <p>
                Federica è una sviluppatrice talentuosa specializzata nella grafica e nella realizzazione di pagine HTML e CSS. Con un occhio attento al design e all'usabilità, Federica crea interfacce utente esteticamente piacevoli e funzionali. La sua esperienza nella combinazione di elementi grafici con codici HTML e CSS garantisce siti web moderni, reattivi e visivamente accattivanti.
            </p>
        </div>
        <div class="card">
            <h3>Francesco Di Flumeri - Responsive Web Developer</h3>
            <p>
                Francesco è uno sviluppatore esperto in CSS e HTML, specializzato nel rendere le pagine web completamente responsive. La sua competenza nel creare design fluidi e adattabili assicura che i siti web offrano un'esperienza utente ottimale su qualsiasi dispositivo. Con una profonda conoscenza delle tecniche di responsive design, Francesco garantisce che ogni progetto mantenga un aspetto professionale e funzionale, indipendentemente dalla dimensione dello schermo.
            </p>
        </div>
    </section>
     <jsp:include page="./fragments/footer.jsp"></jsp:include>
</body>
</html>
