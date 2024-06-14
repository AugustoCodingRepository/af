package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;
import model.Prodotto;
import model.ProdottoDAO;

@WebServlet("/RemoveFromCart")
public class RemoveFromCartServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
	    // Ottieni il carrello dalla sessione, se esiste
	    Carrello cart = (Carrello) request.getSession().getAttribute("carrello");

	    // Se il carrello non esiste, non c'è nulla da rimuovere
	    if (cart == null) {
	        response.sendRedirect(request.getContextPath() + "/catalogo.jsp");
	        return;
	    }

	    // Ottieni l'ID del prodotto dalla richiesta
	    String id = request.getParameter("Product_ID");

	    // Se l'ID del prodotto è valido, cerca e rimuovi l'oggetto prodotto dal carrello
	    if (id != null) {
	        Prodotto prodottoToRemove = ProdottoDAO.getProductByID(id);
	        if (prodottoToRemove != null) {
	            cart.delProduct(prodottoToRemove);
	            request.getSession().setAttribute("carrello", cart);
	        }
	    }

	    // Reindirizza alla pagina del catalogo dopo la rimozione
	    RequestDispatcher view = request.getServletContext().getRequestDispatcher("/catalogo.jsp");
	    view.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}