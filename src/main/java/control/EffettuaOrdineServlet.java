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
import java.util.List;

@WebServlet("/EffettuaOrdineServlet")
public class EffettuaOrdineServlet extends HttpServlet {
    private static final long serialVersionUID = -5807495226920968083L;

    @SuppressWarnings("null")
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentSessionUser");
        Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");

        if (user != null && carrello != null) {
            try {
                // Calcolo della data di consegna
                Calendar calendar = Calendar.getInstance();
                calendar.add(Calendar.DATE, 5);
                Date deliveryDate = new Date(calendar.getTimeInMillis());

                // Recupero il costo totale dal carrello
                Double totalAmount = carrello.getCosto();

                // Recupero dei parametri dalla richiesta
                String paymentSave = request.getParameter("paymentSave");
                String paymentBy = request.getParameter("PaymentBy");
                String paypalEmail = request.getParameter("paypalEmail");
                String cardNumberStr = request.getParameter("cardNumber");
                String cvvExpStr = request.getParameter("cvvExp");
                String monthExpStr = request.getParameter("monthExp");
                String yearExpStr = request.getParameter("yearExp");

                // Se il pagamento deve essere salvato, verifica i parametri
                if ("true".equals(paymentSave)) {
                    savePaymentMethod(paymentBy, user, paypalEmail, cardNumberStr, cvvExpStr, monthExpStr, yearExpStr);
                }

                // Preparazione dei prodotti per l'ordine
                Collection<ProdottoCarrello> prodotti = carrello.getProductsInCart();
                String prodottiAcquistati = "";
                for (ProdottoCarrello p : prodotti) {
                    prodottiAcquistati = p.getProdotto().getProduct_ID()+"-";
                }

                // Creazione e inserimento dell'ordine
                Ordine ordine = new Ordine(user.getUser_ID(), new Date(System.currentTimeMillis()), deliveryDate, totalAmount, prodottiAcquistati);
                OrdineDAO.insert(ordine, user);

                // Creazione e inserimento della transazione
                Transazione transazione = new Transazione(ordine.getOrder_ID(), user.getUser_ID(), "APPROVATA");
                TransazioneDAO.insert(transazione);

                // Svuotare il carrello dopo aver effettuato l'ordine
                carrello.delCart();

                // Reindirizza alla pagina di conferma ordine
                response.sendRedirect("ordine.jsp");

            } catch (NumberFormatException e) {
                throw new ServletException("Errore durante la conversione dei parametri della carta di credito.", e);
            } catch (SQLException e) {
                throw new ServletException("Errore di database durante l'inserimento dell'ordine.", e);
            } catch (Exception e) {
                e.printStackTrace();
                throw new ServletException("Errore durante l'elaborazione dell'ordine.", e);
            }
        } else {
            response.sendRedirect("LoginAndRegistration.jsp");
        }
    }

    private void savePaymentMethod(String paymentBy, User user, String paypalEmail, String cardNumberStr, String cvvExpStr, String monthExpStr, String yearExpStr) throws ServletException, SQLException {
        if ("creditCard".equalsIgnoreCase(paymentBy)) {
            // Verifica che i parametri della carta di credito non siano nulli o vuoti
            if (cardNumberStr != null && !cardNumberStr.isEmpty() &&
                cvvExpStr != null && !cvvExpStr.isEmpty() &&
                monthExpStr != null && !monthExpStr.isEmpty() &&
                yearExpStr != null && !yearExpStr.isEmpty()) {

                long cardNumber = Long.parseLong(cardNumberStr);
                int cvvExp = Integer.parseInt(cvvExpStr);
                int monthExp = Integer.parseInt(monthExpStr);
                int yearExp = Integer.parseInt(yearExpStr);

                MetodoDiPagamento paymentMethod = new MetodoDiPagamento(paymentBy, user.getUser_ID(), paypalEmail, monthExp, yearExp, cardNumber, cvvExp);
                MetodoDiPagamentoDAO.insert(paymentMethod);
            } else {
                throw new ServletException("Uno o più parametri per il metodo di pagamento con carta di credito sono assenti o vuoti.");
            }
        } else if ("paypal".equalsIgnoreCase(paymentBy)) {
            // Verifica che l'email PayPal non sia nulla o vuota
            if (paypalEmail != null && !paypalEmail.isEmpty()) {
                MetodoDiPagamento paymentMethod = new MetodoDiPagamento(paymentBy, user.getUser_ID(), paypalEmail, 0, 0, 0, 0);
                MetodoDiPagamentoDAO.insert(paymentMethod);
            } else {
                throw new ServletException("L'email PayPal è assente o vuota.");
            }
        }
    }
}
