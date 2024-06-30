package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.UserDAO;

@WebServlet("/UpdateUserDatas")
public class UpdateUserDatas extends HttpServlet{
	private static final long serialVersionUID = -5217655590787849786L;

	public UpdateUserDatas() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user = (User) request.getSession().getAttribute("currentSessionUser");
			if(user!=null) {
			if(UserDAO.UpdateUser(
					user.getUser_ID(),
					request.getParameter("nome"),
					request.getParameter("cognome"),
					request.getParameter("via"),
					Integer.parseInt(request.getParameter("civico")),
					Integer.parseInt(request.getParameter("cap")),
					request.getParameter("citta"),
					request.getParameter("provincia"),
					request.getParameter("nazione"),
					request.getParameter("telefono")
					)){
				
				RequestDispatcher view = request.getRequestDispatcher("./myDatas.jsp");
				view.forward(request, response);
			}else{
				RequestDispatcher view = request.getRequestDispatcher("./index.jsp");
				view.forward(request, response);
			}}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
