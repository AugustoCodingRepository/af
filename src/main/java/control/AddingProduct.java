package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoDAO;

@WebServlet("/AddingProduct")
public class AddingProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddingProduct() {
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProdottoDAO.addProductONdb(request.getParameter("product_name"), request.getParameter("brand"),
				request.getParameter("model"), Integer.parseInt(request.getParameter("qt")),
				Double.parseDouble(request.getParameter("prize")), Integer.parseInt(request.getParameter("IVA")),
				Integer.parseInt(request.getParameter("idCat")), request.getParameter("description"), null);
		RequestDispatcher view = request.getRequestDispatcher("/catalogo.jsp");
		view.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}