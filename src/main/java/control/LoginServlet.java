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
			if(UserDAO.LoginCheck(request.getParameter("email"), request.getParameter("password"))){
				HttpSession session = request.getSession(true);
				session.setAttribute("Carrello", new Carrello());
				RequestDispatcher view = request.getRequestDispatcher("./index.jsp");
				view.forward(request, response);
			}else{
				RequestDispatcher view = request.getRequestDispatcher("./LoginAndRegistration.html");
				view.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}