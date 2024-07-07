package control;

import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

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

                // Recupera il parametro "Total"
                String totalString = request.getParameter("Amount");
                System.out.println("Total string from request: " + totalString);
                double total = 0;
                // Verifica che totalString non sia null o vuoto prima di parsare
                if (totalString != null) {
                   total= Double.parseDouble(totalString);
                    Ordine ordine = new Ordine(user.getUser_ID(), new Date(System.currentTimeMillis()), deliveryDate, total, carrello.getProductsInCart());

                    //-- TRANSAZIONE --//
                    Transazione transazione = new Transazione(ordine.getOrder_ID(), user.getUser_ID(), "APPROVATA");

                    //-- SALVA IL METODO DI PAGAMENTO --//
                    if ("true".equals(request.getParameter("paymentSave"))) {
                        String paymentBy = request.getParameter("PaymentBy");
                        String paypalEmail = request.getParameter("paypalEmail");
                        String cardNumberStr = request.getParameter("cardNumber");
                        String cvvExpStr = request.getParameter("cvvExp");
                        String monthExpStr = request.getParameter("monthExp");
                        String yearExpStr = request.getParameter("yearExp");

                        // Verifica che i parametri necessari non siano nulli o vuoti
                        
                            // Converti i parametri necessari
                            long cardNumber = Long.parseLong(cardNumberStr);
                            int cvvExp = Integer.parseInt(cvvExpStr);
                            int monthExp = Integer.parseInt(monthExpStr);
                            int yearExp = Integer.parseInt(yearExpStr);

                            // Crea l'oggetto MetodoDiPagamento
                            MetodoDiPagamento paymentMethod = new MetodoDiPagamento(paymentBy, user.getUser_ID(), paypalEmail, monthExp, yearExp, cardNumber, cvvExp);
                            MetodoDiPagamentoDAO.insert(paymentMethod);
                        } else {
                            throw new ServletException("Uno o più parametri per il metodo di pagamento sono assenti, vuoti o non sono numeri.");
                        }
                    

                    OrdineDAO.insert(ordine, user);
                    TransazioneDAO.insert(transazione);

                    // Dopo aver effettuato l'ordine, svuota il carrello
                    carrello.delCart();

                    response.sendRedirect("ordine.jsp");

                } else {
                    throw new ServletException("Il parametro 'totaleOrdine' è assente o vuoto.");
                }

            } catch (NumberFormatException e) {
                throw new ServletException("Errore durante la conversione del parametro 'Total' in double.", e);
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