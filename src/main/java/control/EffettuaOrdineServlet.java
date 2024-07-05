package control;

import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

@WebServlet("./EffettuaOrdineServlet")
public class EffettuaOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = -5807495226920968083L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentSessionUser");
        Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
        if (user != null && carrello != null) {
        	
        	//-- ORDINE --//
            // Imposta la data di consegna prevista a 3 giorni dalla data corrente
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DATE, 5);
            Date deliveryDate = new Date(calendar.getTimeInMillis());
            Ordine ordine = new Ordine(user.getUser_ID(), new Date(System.currentTimeMillis()), deliveryDate, Double.parseDouble(request.getParameter("Total")));
            
            //-- TRANSAZIONE --//
             Transazione transazione = new Transazione(ordine.getOrder_ID(), user.getUser_ID(), "APPROVATA");
            
            //-- SALVA IL METODO DI PAGAMENTO --//
            if(request.getParameter("paymentSave").equals("true")) {
            	MetodoDiPagamento paymentMethod = new MetodoDiPagamento(request.getParameter("PaymentBy"), user.getUser_ID(), request.getParameter("paypalEmail"), Integer.parseInt(request.getParameter("monthExp")), Integer.parseInt(request.getParameter("yearExp")),Long.parseLong(request.getParameter("cardNumber")), Integer.parseInt(request.getParameter("cvvExp")));       
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
        } else {
            response.sendRedirect("./LoginAndRegistration.jsp");
        }
    }
}