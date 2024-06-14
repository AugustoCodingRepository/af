package control;

import model.Ordine;
import model.OrdineDAO;
import model.User;

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
        if (user != null) {
            OrdineDAO ordineDAO = new OrdineDAO();
            // Imposta la data di consegna prevista a 3 giorni dalla data corrente
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DATE, 3);
            Date deliveryDate = new Date(calendar.getTimeInMillis());
            Ordine ordine = new Ordine(0, user.getUser_ID(), new Date(System.currentTimeMillis()), deliveryDate);
            try {
                ordineDAO.insert(ordine, user);
                response.sendRedirect("ordine.jsp");
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            response.sendRedirect("LoginAndRegistration.jsp");
        }
    }
}