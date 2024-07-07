package control;

import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;

@WebServlet("/EffettuaOrdineServlet")
public class EffettuaOrdineServlet extends HttpServlet {
    private static final long serialVersionUID = -5807495226920968083L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentSessionUser");
        Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");

        if (user != null && carrello != null) {
            try {
                //-- ORDINE --//
                Calendar calendar = Calendar.getInstance();
                calendar.add(Calendar.DATE, 5);
                Date deliveryDate = new Date(calendar.getTimeInMillis());

                // Recupera il parametro "Amount"
                Double totalString = carrello.getCosto();
                // Recupera il parametro "Total"
                
                System.out.println("Total string from request: " + totalString);
                
                
                    

                
                // Stampa i valori degli altri parametri
                String paymentSave = request.getParameter("paymentSave");
                String paymentBy = request.getParameter("PaymentBy");
                String paypalEmail = request.getParameter("paypalEmail");
                String cardNumberStr = request.getParameter("cardNumber");
                String cvvExpStr = request.getParameter("cvvExp");
                String monthExpStr = request.getParameter("monthExp");
                String yearExpStr = request.getParameter("yearExp");
                // Verifica se "paymentSave" è true e gestisci il metodo di pagamento salvato
                if ("true".equals(paymentSave)) {
                    // Verifica che i parametri necessari non siano nulli o vuoti
                    if ((
                            cardNumberStr != null && !cardNumberStr.isEmpty() &&
                            cvvExpStr != null && !cvvExpStr.isEmpty() &&
                            monthExpStr != null && !monthExpStr.isEmpty() &&
                            yearExpStr != null && !yearExpStr.isEmpty()) ){

                        // Converti i parametri necessari
                        long cardNumber = Long.parseLong(cardNumberStr);
                        int cvvExp = Integer.parseInt(cvvExpStr);
                        int monthExp = Integer.parseInt(monthExpStr);
                        int yearExp = Integer.parseInt(yearExpStr);


                        // Crea l'oggetto MetodoDiPagamento
                        MetodoDiPagamento paymentMethod = new MetodoDiPagamento(paymentBy, user.getUser_ID(), paypalEmail, monthExp, yearExp, cardNumber, cvvExp);
                        MetodoDiPagamentoDAO.insert(paymentMethod);
                    } else {
                        throw new ServletException("Uno o più parametri per il metodo di pagamento sono assenti o vuoti.");
                    }
                }
                
                Collection<ProdottoCarrello> prodotti = carrello.getProductsInCart();
                Collection<Integer> prodottiAcquistati = null;
                for(ProdottoCarrello p : prodotti) {
                	prodottiAcquistati.add(p.getProdotto().getProduct_ID());
                }
                
                // Crea e inserisci l'ordine
                Ordine ordine = new Ordine(user.getUser_ID(), new Date(System.currentTimeMillis()), deliveryDate, totalString, prodottiAcquistati);
                OrdineDAO.insert(ordine, user);

                // Crea e inserisci la transazione
                Transazione transazione = new Transazione(ordine.getOrder_ID(), user.getUser_ID(), "APPROVATA");
                TransazioneDAO.insert(transazione);

                // Svuota il carrello dopo aver effettuato l'ordine
                carrello.delCart();

                // Reindirizza alla pagina di conferma ordine
                response.sendRedirect("ordine.jsp");

            } catch (NumberFormatException e) {
                throw new ServletException("Errore durante la conversione del parametro 'Amount' in double.", e);
            } catch (SQLException e) {
                throw new ServletException("Errore di database durante l'inserimento dell'ordine.", e);
            } catch (Exception e) {
                // Aggiungi del logging per identificare la causa dell'eccezione
                e.printStackTrace();
                throw new ServletException("Errore durante l'elaborazione dell'ordine.", e);
            }
        } else {
            response.sendRedirect("LoginAndRegistration.jsp");
        }
    }
}
