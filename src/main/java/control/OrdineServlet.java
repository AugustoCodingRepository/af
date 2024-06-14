package control;

import model.Ordine;
import model.OrdineDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/OrdineServlet")
public class OrdineServlet extends HttpServlet {
    private final OrdineDAO ordineDAO = new OrdineDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null && user.isRegistered()) {
            try {
                List<Ordine> ordini = ordineDAO.getOrdiniByUser(user);
                request.setAttribute("ordini", ordini);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ordini.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}