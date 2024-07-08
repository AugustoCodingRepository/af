package control;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

@WebServlet("/AddRecensione")
public class AddRecensioneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        User user = (User) request.getSession().getAttribute("currentSessionUser");
        
        // Ottiene i dati dalla richiesta
        String userName = request.getParameter("userName");
        String valutazioneStr = request.getParameter("valutazione");
        String descrizione = request.getParameter("descrizione");
        String productIDStr = request.getParameter("productID");

        if (userName == null || valutazioneStr == null || descrizione == null || productIDStr == null) {
            // Gestisci il caso in cui uno o più parametri sono nulli
            response.sendRedirect("erroreInserimento.jsp");
            return;
        }
        
        try {
            int valutazione = Integer.parseInt(valutazioneStr);
            int userID = user.getUser_ID();
            int productID = Integer.parseInt(productIDStr);

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
        } catch (NumberFormatException e) {
            // Gestisci il caso in cui i parametri non possono essere convertiti in interi
            response.sendRedirect("erroreInserimento.jsp");
        }
    }
}