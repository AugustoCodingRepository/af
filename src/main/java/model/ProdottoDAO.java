package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class ProdottoDAO {
	
	public static Prodotto getProductByID(String ID) {
	    final String query = "SELECT * FROM prodotto WHERE Product_ID = ?";
	    try {
	        Connection con = ConnectToDB.getConnection();
	        if (con == null)
	            System.out.println("Connessione NON riuscita");
	        else
	            System.out.println("Connessione riuscita");
	        PreparedStatement st = con.prepareStatement(query);
	        st.setString(1, ID);
	        ResultSet rs = st.executeQuery();
	        if (rs.next()) {
	            return new Prodotto(rs.getInt("Product_ID"), rs.getString("Product_Name"), rs.getString("Brand"),
	                    rs.getString("model"), rs.getInt("quantity"), rs.getDouble("price"), rs.getInt("IVA"),
	                    rs.getInt("categoria_ID"), rs.getString("descrizione"), null);
	        } else {
	            // Nessun prodotto trovato con l'ID specificato
	            System.out.println("Nessun prodotto trovato con ID: " + ID);
	            return null;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	public static Collection<Prodotto> getAllProducts() {
		Collection<Prodotto> prodotti = new LinkedList<>();
		Connection con;
		try {
			con = ConnectToDB.getConnection();
			if (con == null)
				System.out.println("Connessione NON Riuscita");
			else
				System.out.println("SONO CONNESSO!");
			ResultSet rs = con.createStatement().executeQuery("SELECT * FROM Prodotto ORDER BY Categoria_ID ASC;");
			if (rs != null)
				System.out.println("query riuscita!");
			else
				System.out.println("Q non riuscita");
			while (rs.next())
				prodotti.add(new Prodotto(rs.getInt("Product_ID"), rs.getString("Product_Name"), rs.getString("Brand"),
						rs.getString("Model"), rs.getInt("Quantity"), rs.getDouble("Price"), rs.getInt("IVA"),
						rs.getInt("Categoria_ID"), rs.getString("Descrizione"), null));
			rs.close();
			con.close();
		} catch (SQLException e) {
			// Gestione delle eccezioni in caso di errore nella connessione
			System.err.println("Errore durante la connessione al database:");
			e.printStackTrace();
		}
		return prodotti;
	}

	public static void addProductONdb(String Name, String brand, String model, int quantity, double price, int iva,
			int categoria_id, String descrizione, byte[] img) {
		try {
			Connection con = ConnectToDB.getConnection();
			String query = "INSERT INTO `prodotto`(`Product_Name`, `Brand`, `Model`, `Quantity`, `Price`, `IVA`, `Categoria_ID`, `Descrizione`, `imgProduct`)"
					+ "		VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, Name);
			pstm.setString(2, brand);
			pstm.setString(3, model);
			pstm.setInt(4, quantity);
			pstm.setDouble(5, price);
			pstm.setInt(6, iva);
			pstm.setInt(7, categoria_id);
			pstm.setString(8, descrizione);
			pstm.setBytes(9, img);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void deleteProdottoByID(String ID) {
		final String query = "DELETE FROM prodotto WHERE Product_ID = ?";
		try {
			Connection con = ConnectToDB.getConnection();
			if (con == null)
				System.out.println("Connessione NON riuscita");
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, ID);
			int columnAffected = st.executeUpdate();
			if (columnAffected > 0)
				System.out.println("riuscito");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}