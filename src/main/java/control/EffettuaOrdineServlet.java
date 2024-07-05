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
                // Imposta la data di consegna prevista a 3 giorni dalla data corrente
                Calendar calendar = Calendar.getInstance();
                calendar.add(Calendar.DATE, 5);
                Date deliveryDate = new Date(calendar.getTimeInMillis());

                // Controlla se il parametro "Total" è null o vuoto
                String totalParam = request.getParameter("Total");
                double totalAmount = 0.0;
                if (totalParam != null && !totalParam.trim().isEmpty()) {
                    totalAmount = Double.parseDouble(totalParam);
                }

                Ordine ordine = new Ordine(user.getUser_ID(), new Date(System.currentTimeMillis()), deliveryDate, totalAmount);

                // Aggiungi i prodotti del carrello all'ordine
                ordine.setProdottiAcquistati(new ArrayList<>(carrello.getProductsInCart()));

                //-- TRANSAZIONE --//
                Transazione transazione = new Transazione(ordine.getOrder_ID(), user.getUser_ID(), "APPROVATA");

                //-- SALVA IL METODO DI PAGAMENTO --//
                if ("true".equals(request.getParameter("paymentSave"))) {
                    MetodoDiPagamento paymentMethod = new MetodoDiPagamento(
                        request.getParameter("PaymentBy"),
                        user.getUser_ID(),
                        request.getParameter("paypalEmail"),
                        parseIntOrDefault(request.getParameter("monthExp"), 0),
                        parseIntOrDefault(request.getParameter("yearExp"), 0),
                        parseLongOrDefault(request.getParameter("cardNumber"), 0L),
                        parseIntOrDefault(request.getParameter("cvvExp"), 0)
                    );

                    try {
                        MetodoDiPagamentoDAO.insert(paymentMethod);
                    } catch (SQLException e) {                
                        e.printStackTrace();
                    }
                }

                try {
                    OrdineDAO.insert(ordine, user);
                    TransazioneDAO.insert(transazione);
                    // Dopo aver effettuato l'ordine, svuota il carrello
                    carrello.delCart();
                    response.sendRedirect("ordine.jsp");
                } catch (SQLException e) {
                    throw new ServletException(e);
                }
            } catch (NumberFormatException e) {
                // Gestisci errori di formattazione del numero
                e.printStackTrace();
                response.sendRedirect("errore.jsp");
            }
        } else {
            response.sendRedirect("LoginAndRegistration.jsp");
        }
    }

    // Funzione di utilità per analizzare un int con un valore predefinito
    private int parseIntOrDefault(String str, int defaultValue) {
        try {
            return str != null ? Integer.parseInt(str) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    // Funzione di utilità per analizzare un long con un valore predefinito
    private long parseLongOrDefault(String str, long defaultValue) {
        try {
            return str != null ? Long.parseLong(str) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
