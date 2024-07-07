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
	            String totalString = request.getParameter("Total");
	            double total = 0;

	            // Verifica che totalString non sia null o vuoto prima di parsare
	            if (totalString != null && !totalString.trim().isEmpty()) {
	                total = Double.parseDouble(totalString.trim());
	            } else {
	                throw new ServletException("Il parametro 'Total' è assente o vuoto.");
	            }

	            Ordine ordine = new Ordine(user.getUser_ID(), new Date(System.currentTimeMillis()), deliveryDate, total);

	            //-- TRANSAZIONE --//
	            Transazione transazione = new Transazione(ordine.getOrder_ID(), user.getUser_ID(), "APPROVATA");

	            //-- SALVA IL METODO DI PAGAMENTO --//
	            if ("true".equals(request.getParameter("paymentSave"))) {
	                MetodoDiPagamento paymentMethod = new MetodoDiPagamento(
	                    request.getParameter("PaymentBy"),
	                    user.getUser_ID(),
	                    request.getParameter("paypalEmail"),
	                    Integer.parseInt(request.getParameter("monthExp")),
	                    Integer.parseInt(request.getParameter("yearExp")),
	                    Long.parseLong(request.getParameter("cardNumber")),
	                    Integer.parseInt(request.getParameter("cvvExp"))
	                );
	                MetodoDiPagamentoDAO.insert(paymentMethod);
	            }

	            OrdineDAO.insert(ordine, user);
	            TransazioneDAO.insert(transazione);

	            // Dopo aver effettuato l'ordine, svuota il carrello
	            carrello.delCart();

	            response.sendRedirect("ordine.jsp");

	        } catch (NumberFormatException e) {
	            throw new ServletException("Errore durante la conversione del parametro 'Total' in double.", e);
	        } catch (SQLException e) {
	            throw new ServletException("Errore di database durante l'inserimento dell'ordine.", e);
	        }
	    } else {
	        response.sendRedirect("LoginAndRegistration.jsp");
	    }
	}
}
