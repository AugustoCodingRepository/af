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
import model.User;
import model.UserDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User u = UserDAO.LoginCheck(request.getParameter("username"), request.getParameter("password"));
			if ("Amministratore".equals(u.getRuolo()))
				request.setAttribute("Role", "admin");
			else
				request.setAttribute("Role", "user");
			HttpSession session = request.getSession(true);
			session.setAttribute("Carrello", new Carrello());
			RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
			view.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}