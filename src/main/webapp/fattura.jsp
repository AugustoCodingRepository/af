<%@ page import="java.util.*,model.*,control.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fattura</title>
  <link rel="stylesheet" href="./CSS/fatturacss.css" type="text/css" media="all" />
</head>

<body>
  <div>
    <div class="py-4">
      <div class="px-14 py-6">
        <table class="w-full border-collapse border-spacing-0">
          <tbody>
            <tr>
              <td class="w-full align-top">
                <div>
                  <img src="./IMG/logoblack.png" class="h-12" /> A L T A  F R E Q U E N Z A
                </div>
              </td>

              <td class="align-top">
                <div class="text-sm">
                  <table class="border-collapse border-spacing-0">
                    <tbody>
                      <tr>
                        <td class="border-r pr-4">
                          <div>
                            <p class="whitespace-nowrap text-slate-400 text-right">Date</p>
                            <p class="whitespace-nowrap font-bold text-main text-right">April 26, 2023</p>
                          </div>
                        </td>
                        <td class="pl-4">
                          <div>
                            <p class="whitespace-nowrap text-slate-400 text-right">Invoice #</p>
                            <p class="whitespace-nowrap font-bold text-main text-right">BRA-00335</p>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="bg-slate-100 px-14 py-6 text-sm">
        <table class="w-full border-collapse border-spacing-0">
          <tbody>
            <tr>
              <td class="w-1/2 align-top">
                <div class="text-sm text-neutral-600">
                  <p class="font-bold">Alta Frequenza S.P.A.</p>
                  <p>Number: 4839201</p>
                  <p>VAT: 5940394</p>
                  <p>Via Giovanni Paolo II</p>
                  <p>Fisciano, 80084</p>
                  <p>Italia</p>
                </div>
              </td>
              <td class="w-1/2 align-top text-right">
                <div class="text-sm text-neutral-600">
                  <p class="font-bold">Cliente</p>
                  <p>Nome: </p> 
                  <p>Cognome: </p>
                  <p>Indirizzo:</p>
                  <p>Città, CAP:</p>
                  <p></p>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="px-14 py-10 text-sm text-neutral-700">
        <table class="w-full border-collapse border-spacing-0">
          <thead>
            <tr>
              <td class="border-b-2 border-main pb-3 pl-3 font-bold text-main">#</td>
              <td class="border-b-2 border-main pb-3 pl-2 font-bold text-main">Prodotto</td>
              <td class="border-b-2 border-main pb-3 pl-2 text-right font-bold text-main">Prezzo</td>
              <td class="border-b-2 border-main pb-3 pl-2 text-center font-bold text-main">Qty.</td>
              <td class="border-b-2 border-main pb-3 pl-2 text-center font-bold text-main">IVA</td>
              <td class="border-b-2 border-main pb-3 pl-2 text-right font-bold text-main">Subtotale</td>
              <td class="border-b-2 border-main pb-3 pl-2 pr-3 text-right font-bold text-main">Subtotal + IVA</td>
            </tr>
          </thead>
          <tbody>
          <%
          	for(Prodotto p : prodotti){
          %>
            <tr>
              <td class="border-b py-3 pl-3">1.</td>
              <td class="border-b py-3 pl-2">Montly accountinc services</td>
              <td class="border-b py-3 pl-2 text-right">$150.00</td>
              <td class="border-b py-3 pl-2 text-center">1</td>
              <td class="border-b py-3 pl-2 text-center">20%</td>
              <td class="border-b py-3 pl-2 text-right">$150.00</td>
              <td class="border-b py-3 pl-2 pr-3 text-right">$180.00</td>
            </tr>
            <%} %>
            <tr>
              <td colspan="7">
                <table class="w-full border-collapse border-spacing-0">
                  <tbody>
                    <tr>
                      <td class="w-full"></td>
                      <td>
                        <table class="w-full border-collapse border-spacing-0">
                          <tbody>
                            <tr>
                              <td class="border-b p-3">
                                <div class="whitespace-nowrap text-slate-400">Totale netto:</div>
                              </td>
                              <td class="border-b p-3 text-right">
                                <div class="whitespace-nowrap font-bold text-main">$320.00</div>
                              </td>
                            </tr>
                            <tr>
                              <td class="p-3">
                                <div class="whitespace-nowrap text-slate-400">Totale IVA:</div>
                              </td>
                              <td class="p-3 text-right">
                                <div class="whitespace-nowrap font-bold text-main">$64.00</div>
                              </td>
                            </tr>
                            <tr>
                              <td class="bg-main p-3">
                                <div class="whitespace-nowrap font-bold text-white">Totale:</div>
                              </td>
                              <td class="bg-main p-3 text-right">
                                <div class="whitespace-nowrap font-bold text-white">$384.00</div>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="px-14 text-sm text-neutral-700">
        <p class="text-main font-bold">DETTAGLI PAGAMENTO</p>
        <p>Intesa San Paolo</p>
        <p>Account numero: 78976 </p>
        <p>Pagamento numero: </p>
      </div>

      <div class="px-14 py-10 text-sm text-neutral-700">
        <p class="text-main font-bold">Note</p>
        <p class="italic">Questa fattura è un documento che attesta l'avvenuto pagamento presso la società Alta Frequenza S.P.A. ed
        è valido come documento fiscale.</p>
        </div>

        <footer class="fixed bottom-0 left-0 bg-slate-100 w-full text-neutral-600 text-center text-xs py-3">
          Alta Frequenza S.P.A.
          <span class="text-slate-300 px-2">|</span>
          info@altafrequenza.it
          <span class="text-slate-300 px-2">|</span>
          +39-081-999-090
        </footer>
      </div>
    </div>
</body>

</html>
