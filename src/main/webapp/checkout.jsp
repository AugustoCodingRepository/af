<%@page import="java.io.Console"%>
<%@ page import="java.util.*,model.*,control.*"%>
<!DOCTYPE html>
<html lang="it">
<head>
<script src="https://www.paypal.com/sdk/js?client-id=AYjJGkGaetC60H2yZ0JXPurBl-jy2OxgCyV0J7bK1TWOcpUdQtjhm1nksG2-qG6CCQ2HwU4dkWJdRjPC&currency=EUR"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="IMG/Finale.png">

<!-- custom css file link  -->
<link rel="stylesheet" href="./CSS/checkout.css">
<%
Carrello cart = (Carrello) request.getSession().getAttribute("carrello");
Double total = Double.parseDouble(request.getParameter("PaymentAmount"));
log(total + "totale1");
if (total == 0) {
    total = 0.00; // Imposta un valore predefinito se il totale non è presente
}
%>
<script>
    // Passa il valore totale al client-side
    var totalAmount = "<%= total %>";
</script>
</head>
<body>
    <jsp:include page="./fragments/header.jsp" />
    <div class="container">

        <form id="payment" action="./EffettuaOrdineServlet" method="post">

            <div class="row">

                <div class="col">

                    <h3 class="title">Informazioni di spedizione</h3>

                    <div class="inputBox">
                        <span>Nome e Cognome :</span> <input type="text"
                            placeholder="john deo" id="nome" name="nome" required>
                    </div>
                    <div class="inputBox">
                        <span>Email :</span> <input type="email"
                            placeholder="example@example.com" id="email" name="email"
                            required>
                    </div>
                    <div class="inputBox">
                        <span>Indirizzo :</span> <input type="text"
                            placeholder="room - street - locality" id="indirizzo"
                            name="indirizzo" required>
                    </div>
                    <div class="inputBox">
                        <span>Città:</span> <input type="text" placeholder="mumbai"
                            id="citta" name="citta" required>
                    </div>

                    <div class="flex">
                        <div class="inputBox">
                            <span>Stato :</span> <input type="text" placeholder="india"
                                id="stato" name="stato" required>
                        </div>
                        <div class="inputBox">
                            <span>CAP :</span> <input type="text" placeholder="123 456"
                                id="cap" name="cap" required>
                        </div>
                    </div>

                </div>

                <div class="col">

                    <h3 class="title">Pagamento</h3>

                    <div class="inputBox">
                        <span>Seleziona il metodo di pagamento:</span>
                        <button type="button" onclick="selectPayment('creditCard')">
                            <img src="./IMG/visa.png">
                        </button>
                        <button type="button" onclick="selectPayment('paypal')">
                            <img src="./IMG/paypal.jpg">
                        </button>
                        <button type="button" onclick="selectPayment('creditCard')">
                            <img src="./IMG/mastercard.png">
                        </button>
                        <input type="hidden" value="none" id="PaymentBy" name="PaymentBy">
                    </div>

                    <div id="creditCardFields" style="display: none;">
                        <div class="inputBox">
                            <span>Nome sulla carta :</span> <input type="text"
                                value="" id="cardName" name="cardName"
                                required>
                        </div>
                        <div class="inputBox">
                            <span>Numero carta :</span> <input type="number"
                                placeholder="1111-2222-3333-4444" id="cardNumber"
                                name="cardNumber" required>
                        </div>
                        <div class="inputBox">
                            <span>Mese Scadenza :</span> <input type="number"
                                placeholder="01" id="monthExp" name="monthExp" min=01 max=12 required>
                        </div>

                        <div class="flex">
                            <div class="inputBox">
                                <span>Anno Scadenza :</span> <input type="number"
                                    placeholder="2022" id="yearExp" name="yearExp" required>
                            </div>
                            <div class="inputBox">
                                <span>CVV :</span> <input type="number" placeholder="123" max=999 min=001
                                    id="cvvExp" name="cvvExp" required>
                            </div>
                        </div>
                    </div>

                    <div id="paypalFields" style="display: none;">
                        <div class="inputBox">
                            <span>Indirizzo email PayPal :</span> <input type="email"
                                placeholder="example@paypal.com" id="paypalEmail"
                                name="paypalEmail" required>
                               
                        </div>
                        <div class="paypal-button-container" id="paypal-button-container"></div>
                    </div>

                </div>

            </div>
            <input type="checkbox" id="paymentSave">Vuoi salvare il tuo
            metodo di pagamento?<br>
            <br> <input type="hidden" value="none" id="paymentSaved"
                name="paymentSaved"> Vuoi la fattura? Puoi richiederla nella
            sezione 'I miei ordini' selezionando l'ordine e cliccando 'Fattura'.<br>
			<input type="hidden" name="Amount" value="<%=total%>">
            <input type="button" value="Procedi all'acquisto" class="submit-btn" onclick="validateAndSubmitForm();">

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
                document.getElementById('PaymentBy').value = 'creditCard';
            } else if (method === 'paypal') {
                document.getElementById('creditCardFields').style.display = 'none';
                document.getElementById('paypalFields').style.display = 'block';
                document.getElementById('cardName').disabled = true;
                document.getElementById('cardNumber').disabled = true;
                document.getElementById('monthExp').disabled = true;
                document.getElementById('yearExp').disabled = true;
                document.getElementById('cvvExp').disabled = true;
                document.getElementById('paypalEmail').disabled = false;
                document.getElementById('PaymentBy').value = 'PayPal';
            }
        }

        function validateAndSubmitForm() {
            var isChecked = document.getElementById('paymentSave').checked;
            if (isChecked) {
                document.getElementById('paymentSaved').value = 'true';
            } else {
                document.getElementById('paymentSaved').value = 'false';
            }

            // Assicurati che il metodo di pagamento sia selezionato
            var paymentMethod = document.getElementById('PaymentBy').value;
            if (paymentMethod === 'none') {
                alert('Seleziona un metodo di pagamento');
                return; // Prevenire l'invio del form se non è selezionato un metodo di pagamento
            }

            // Aggiungi il valore total come attributo "Amount" alla richiesta
            var form = document.getElementById('payment');
            

            // Se tutto è corretto, invia il form manualmente
            form.submit();
        }

        paypal.Buttons({
            createOrder: function(data, actions) {
                // Usa il valore totale passato dal server-side
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: totalAmount // Utilizza il valore totale dinamico
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    alert('Transaction completed by ' + details.payer.name.given_name);
                    // Aggiungi qui il codice per gestire il pagamento completato
                });
            }
        }).render('#paypal-button-container'); // Renderizza il pulsante PayPal
    </script>
    <jsp:include page="./fragments/footer.jsp" />
</body>
</html>
