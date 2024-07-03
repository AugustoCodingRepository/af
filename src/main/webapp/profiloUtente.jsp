<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo Utente</title>
    <link rel="stylesheet" href="userpage.css">
</head>
<body>
    <div class="container">
        <h1>Profilo Utente</h1>

        <section class="user-info">
            <h2>I tuoi dati</h2>
            <form id="user-form">
                <label for="name">Nome:</label>
                <input type="text" id="name" name="name" value="Mario Rossi">

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="mario.rossi@example.com">

                <label for="phone">Telefono:</label>
                <input type="tel" id="phone" name="phone" value="1234567890">

                <button type="submit">Salva Modifiche</button>
            </form>
        </section>

        <section class="payment-methods">
            <h2>Metodi di Pagamento</h2>
            <form id="payment-form">
                <label for="card-number">Numero di Carta:</label>
                <input type="text" id="card-number" name="card-number" placeholder="XXXX-XXXX-XXXX-XXXX">

                <label for="expiry-date">Data di Scadenza:</label>
                <input type="month" id="expiry-date" name="expiry-date">

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" placeholder="XXX">

                <button type="submit">Aggiungi Metodo di Pagamento</button>
            </form>
        </section>

        <section class="contact-info">
            <h2>Recapiti</h2>
            <form id="contact-form">
                <label for="address">Indirizzo:</label>
                <input type="text" id="address" name="address" value="Via Roma 1, 00100 Roma">

                <label for="city">Città:</label>
                <input type="text" id="city" name="city" value="Roma">

                <label for="postal-code">Codice Postale:</label>
                <input type="text" id="postal-code" name="postal-code" value="00100">

                <label for="country">Paese:</label>
                <input type="text" id="country" name="country" value="Italia">

                <button type="submit">Salva Recapiti</button>
            </form>
        </section>
    </div>
</body>
</html>
