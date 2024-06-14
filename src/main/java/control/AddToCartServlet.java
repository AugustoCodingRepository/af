package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;
import model.Prodotto;
import model.ProdottoDAO;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Ottieni il carrello dalla sessione, se esiste
        Carrello cart = (Carrello) request.getSession().getAttribute("carrello");

        // Se il carrello non esiste, creane uno nuovo e salvalo nella sessione
        if (cart == null) {
            cart = new Carrello();
            request.getSession().setAttribute("carrello", cart);
        }

        // Ottieni l'ID del prodotto dalla richiesta
        String id = request.getParameter("Product_ID");

        // Se l'ID del prodotto è valido, aggiungi il prodotto al carrello
        if (id != null) {
            Prodotto product = ProdottoDAO.getProductByID(id);
            if (product != null) {
                cart.addProduct(product);
            }
        }

        // Reindirizza alla pagina del catalogo dopo l'aggiunta del prodotto
        response.sendRedirect(request.getContextPath() + "/catalogo.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request, response);
    }
}