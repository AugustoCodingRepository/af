<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- custom css file link  -->
    <link rel="stylesheet" href="./CSS/checkout.css">

</head>
<body>

<div class="container">

    <form id="checkoutForm">

        <div class="row">

            <div class="col">

                <h3 class="title">Informazioni di spedizione</h3>

                <div class="inputBox">
                    <span>Nome Cognome :</span>
                    <input type="text" placeholder="john deo" id="nome">
                </div>
                <div class="inputBox">
                    <span>Email :</span>
                    <input type="email" placeholder="example@example.com" id="email">
                </div>
                <div class="inputBox">
                    <span>Indirizzo :</span>
                    <input type="text" placeholder="room - street - locality" id="indirizzo">
                </div>
                <div class="inputBox">
                    <span>Città:</span>
                    <input type="text" placeholder="mumbai" id="citta">
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>Stato :</span>
                        <input type="text" placeholder="india" id="stato">
                    </div>
                    <div class="inputBox">
                        <span>CAP :</span>
                        <input type="text" placeholder="123 456" id="cap">
                    </div>
                </div>

            </div>

            <div class="col">

                <h3 class="title">Pagamento</h3>

                <div class="inputBox">
                    <span>Seleziona il metodo di pagamento:</span>
                    <button type="button" onclick="selectPayment('creditCard')"><img src="./IMG/visa.png"></button>
                    <button type="button" onclick="selectPayment('paypal')"><img src="./IMG/paypal.jpg"></button>
                    <button type="button" onclick="selectPayment('mastercard')"><img src="./IMG/mastercard.png"></button>
                </div>

                <div id="creditCardFields" style="display: none;">
                    <div class="inputBox">
                        <span>Nome sulla carta :</span>
                        <input type="text" placeholder="mr. john deo" id="cardName">
                    </div>
                    <div class="inputBox">
                        <span>Numero carta :</span>
                        <input type="number" placeholder="1111-2222-3333-4444" id="cardNumber">
                    </div>
                    <div class="inputBox">
                        <span>Mese Scadenza :</span>
                        <input type="text" placeholder="january" id="monthExp">
                    </div>

                    <div class="flex">
                        <div class="inputBox">
                            <span>Anno Scadenza :</span>
                            <input type="number" placeholder="2022" id="yearExp">
                        </div>
                        <div class="inputBox">
                            <span>CVV :</span>
                            <input type="text" placeholder="1234" id="cvvExp">
                        </div>
                    </div>
                </div>

                <div id="paypalFields" style="display: none;">
                    <div class="inputBox">
                        <span>Indirizzo email PayPal :</span>
                        <input type="email" placeholder="example@paypal.com" id="paypalEmail">
                    </div>
                </div>

            </div>
    
        </div>
		<input type="checkbox" id="fattura"> Vuoi la fattura?<br>
		<form action="/EffettuaOrdineServlet" method="post">
       	<input type="submit" value="Procedi all'acquisto" class="submit-btn">
		</form>

</div>    
    
<script>
    function selectPayment(method) {
        if (method === 'creditCard') {
            document.getElementById('creditCardFields').style.display = 'block';
            document.getElementById('paypalFields').style.display = 'none';
            document.getElementById('cardName').disabled = false;
            document.getElementById('cardNumber').disabled = false;
            document.getElementById('monthExp').disabled = false;
            document.getElementById('yearExp').disabled = false;
            document.getElementById('cvvExp').disabled = false;
            document.getElementById('paypalEmail').disabled = true;
        } else if (method === 'paypal') {
            document.getElementById('creditCardFields').style.display = 'none';
            document.getElementById('paypalFields').style.display = 'block';
            document.getElementById('cardName').disabled = true;
            document.getElementById('cardNumber').disabled = true;
            document.getElementById('monthExp').disabled = true;
            document.getElementById('yearExp').disabled = true;
            document.getElementById('cvvExp').disabled = true;
            document.getElementById('paypalEmail').disabled = false;
        }
    }
</script>

</body>
</html>
