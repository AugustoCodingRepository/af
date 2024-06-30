package control;

import java.io.IOException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Prodotto;
import model.ProdottoDAO;

@WebServlet("/FilterServlet")
public class ProductFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 2016348502478631800L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        String sort = request.getParameter("sort");

        // Debugging output
        System.out.println("Category: " + category);
        System.out.println("Min Price: " + minPriceStr);
        System.out.println("Max Price: " + maxPriceStr);
        System.out.println("Sort: " + sort);

        // Convert price strings to numbers
        Double minPrice = minPriceStr != null && !minPriceStr.isEmpty() ? Double.parseDouble(minPriceStr) : 0;
        Double maxPrice = maxPriceStr != null && !maxPriceStr.isEmpty() ? Double.parseDouble(maxPriceStr) : 999999999;

        // Get filtered products from ProdottoDAO
        Collection<Prodotto> prodotti = ProdottoDAO.getFilteredProducts(category, minPrice, maxPrice, sort);

        // Set the products as a request attribute
        request.setAttribute("prodotti", prodotti);
        
        // Debugging output for products
        for (Prodotto p : prodotti) {
            System.out.println("Product ID: " + p.getProduct_ID());
        }
        System.out.println("----------------------------------------");
        // Forward to a JSP that only renders the product items
        request.getRequestDispatcher("/shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
