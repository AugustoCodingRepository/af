package control;

import model.Ordine;
import model.OrdineDAO;
import model.User;
import model.Carrello;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

@WebServlet("/EffettuaOrdineServlet")
public class EffettuaOrdineServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentSessionUser");
        Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
        if (user != null && carrello != null) {
            // Calcola il costo totale del carrello
            double cost = carrello.getCosto();
            // Imposta la data di consegna prevista a 3 giorni dalla data corrente
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DATE, 3);
            Date deliveryDate = new Date(calendar.getTimeInMillis());
            Ordine ordine = new Ordine(0, user.getUser_ID(), new Date(System.currentTimeMillis()), deliveryDate, cost);
            try {
                OrdineDAO.insert(ordine, user);
                // Dopo aver effettuato l'ordine, svuota il carrello
                carrello.delCart();
                response.sendRedirect("ordine.jsp");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            response.sendRedirect("LoginAndRegistration.jsp");
        }
    }
}