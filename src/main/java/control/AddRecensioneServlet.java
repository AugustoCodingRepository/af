package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

@WebServlet("/addRecensione")
public class AddRecensioneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletExceptions, IOException {
        // Ottiene i dati dalla richiesta
        String userName = request.getParameter("userName");
        int valutazione = Integer.parseInt(request.getParameter("valutazione"));
        String descrizione = request.getParameter("descrizione");
        int userID = Integer.parseInt(request.getParameter("userID"));
        int productID = Integer.parseInt(request.getParameter("productID"));
        
        // Crea un oggetto Recensione
        Recensione nuovaRecensione = new Recensione(userName, valutazione, descrizione, userID, productID);
        
        // Inserisce la nuova recensione nel database
		boolean success = RecensioneDAO.insertRecensione(nuovaRecensione);
		
		if (success) {
		    // Redirect alla pagina di successo o lista delle recensioni
		    response.sendRedirect("recensioniSuccesso.jsp");
		} else {
		    // Gestisci il fallimento dell'inserimento
		    response.sendRedirect("erroreInserimento.jsp");
		}
    }
}

