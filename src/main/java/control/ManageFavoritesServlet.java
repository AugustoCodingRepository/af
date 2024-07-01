package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ManageFavoritesServlet")
public class ManageFavoritesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String productId = request.getParameter("productId");
        String action = request.getParameter("action");

        // Log received parameters
        System.out.println("Received productId: " + productId);
        System.out.println("Received action: " + action);

        if (productId == null || action == null) {
            response.getWriter().write("fail");
            return;
        }

        @SuppressWarnings("unchecked")
        List<String> favorites = (List<String>) session.getAttribute("favorites");
        if (favorites == null) {
            favorites = new ArrayList<>();
        }

        // Log the current state of favorites
        System.out.println("Current favorites: " + favorites);

        if ("add".equals(action)) {
            if (!favorites.contains(productId)) {
                favorites.add(productId);
                System.out.println("Added product: " + productId);
            } else {
                System.out.println("Product already in favorites: " + productId);
            }
        } else if ("remove".equals(action)) {
            if (favorites.contains(productId)) {
                favorites.remove(productId);
                System.out.println("Removed product: " + productId);
            } else {
                System.out.println("Product not in favorites: " + productId);
            }
        }

        // Log the updated state of favorites
        System.out.println("Updated favorites: " + favorites);

        session.setAttribute("favorites", favorites);
        response.getWriter().write("success");
    }
}
