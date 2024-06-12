package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;
import model.UserDAO;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistrationServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			if(UserDAO.RegistrationCheck(request.getParameter("email"), request.getParameter("password"), request.getParameter("nome"), request.getParameter("cognome"))){
				HttpSession session = request.getSession(true);
				session.setAttribute("Carrello", new Carrello());
				session.setAttribute("currentSessionUser", UserDAO.getUserByEmail(request.getParameter("email")));
				RequestDispatcher view = request.getRequestDispatcher("./index.jsp");
				view.forward(request, response);
			}
		}catch(Exception e) {
			RequestDispatcher view = request.getRequestDispatcher("./index.jsp");
			view.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}