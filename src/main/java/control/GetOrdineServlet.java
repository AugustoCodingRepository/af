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

@WebServlet("/GetOrdineServlet")
public class GetOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentSessionUser");
        if (user != null) {
			@SuppressWarnings("unused")
			OrdineDAO ordineDAO = new OrdineDAO();
            try {
                List<Ordine> ordini = OrdineDAO.getOrdiniByUser(user);
                request.setAttribute("ordini", ordini);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ordine.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        } else {
            response.sendRedirect("LoginAndRegistration.jsp");
        }
    }
}