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
public class UpdateUserDatas extends HttpServlet {
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
            if (user != null) {
                String nome = request.getParameter("nome");
                String cognome = request.getParameter("cognome");
                String via = request.getParameter("via");
                String civicoStr = request.getParameter("civico");
                String capStr = request.getParameter("cap");
                String citta = request.getParameter("citta");
                String provincia = request.getParameter("provincia");
                String nazione = request.getParameter("nazione");
                String telefono = request.getParameter("telefono");

                int civico = 0;
                int cap = 0;

                // Controllo per il campo "nome"
                if (nome == null || nome.isEmpty()) {
                    nome = ""; // Assegna un valore predefinito o gestisci diversamente
                }

                // Controllo per il campo "cognome"
                if (cognome == null || cognome.isEmpty()) {
                    cognome = ""; // Assegna un valore predefinito o gestisci diversamente
                }

                // Controllo per il campo "via"
                if (via == null || via.isEmpty()) {
                    via = ""; // Assegna un valore predefinito o gestisci diversamente
                }

                // Controllo per il campo "civico"
                if (civicoStr != null && !civicoStr.isEmpty()) {
                    civico = Integer.parseInt(civicoStr);
                }

                // Controllo per il campo "cap"
                if (capStr != null && !capStr.isEmpty()) {
                    cap = Integer.parseInt(capStr);
                }

                // Controllo per il campo "citta"
                if (citta == null || citta.isEmpty()) {
                    citta = ""; // Assegna un valore predefinito o gestisci diversamente
                }

                // Controllo per il campo "provincia"
                if (provincia == null || provincia.isEmpty()) {
                    provincia = ""; // Assegna un valore predefinito o gestisci diversamente
                }

                // Controllo per il campo "nazione"
                if (nazione == null || nazione.isEmpty()) {
                    nazione = ""; // Assegna un valore predefinito o gestisci diversamente
                }

                // Controllo per il campo "telefono"
                if (telefono == null || telefono.isEmpty()) {
                    telefono = ""; // Assegna un valore predefinito o gestisci diversamente
                }

                if (UserDAO.UpdateUser(
                        user.getUser_ID(),
                        nome,
                        cognome,
                        via,
                        civico,
                        cap,
                        citta,
                        provincia,
                        nazione,
                        telefono)) {
                    // Codice per la gestione del successo dell'update
                    RequestDispatcher view = request.getRequestDispatcher("./iMieiDati.jsp");
                    view.forward(request, response);
                } else {
                    // Codice per la gestione del fallimento dell'update
                }

            } else {
                RequestDispatcher view = request.getRequestDispatcher("./index.jsp");
                view.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
