package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class UserDAO {

	public static boolean LoginCheck(String email, String password) {
		final String query = "SELECT * FROM utente WHERE email = ? AND Password = ?";
		try {
			Connection con = ConnectToDB.getConnection();
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, email);
			pstm.setString(2, password);
			ResultSet rs = pstm.executeQuery();
			if (rs.next())
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean RegistrationCheck(String email, String password, String nome, String cognome) {
		try {
			final String query = "INSERT INTO `utente`"
					+ "(`Email`, `Password`, `Nome`, `Cognome`) VALUES (?,?,?,?)";
			Connection con = ConnectToDB.getConnection();
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, email);
			pstm.setString(2, password);
			pstm.setString(3, nome);
			pstm.setString(4, cognome);

			int columnAffected = pstm.executeUpdate();
			if (columnAffected > 0) {
				System.out.println("Registrazione avvenuta");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static User getUserByEmail(String email) {
		final String query = "SELECT * FROM utente WHERE email = ?";
		try {
			Connection con = ConnectToDB.getConnection();
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, email);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				return new User(rs.getInt("User_ID"),
						rs.getString("Email"), rs.getString("Password"), 
						rs.getString("Nome"), rs.getString("Cognome"),
						rs.getString("Via"), rs.getInt("Civico"),
						rs.getInt("CAP"), rs.getString("Citta"),
						rs.getString("Provincia"), rs.getString("Nazione"), 
						rs.getString("Telefono"), rs.getString("Ruolo"));
			}} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public static Collection<User> getAllUsers() {
		Collection<User> users = new LinkedList<>();
		final String query = "SELECT * FROM utente";
		try {
			Connection con = ConnectToDB.getConnection();
			PreparedStatement pstm = con.prepareStatement(query);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				users.add(new User(rs.getInt("User_ID"),
						rs.getString("Email"), rs.getString("Password"), 
						rs.getString("Nome"), rs.getString("Cognome"),
						rs.getString("Via"), rs.getInt("Civico"),
						rs.getInt("CAP"), rs.getString("Citta"),
						rs.getString("Provincia"), rs.getString("Nazione"), 
						rs.getString("Telefono"), rs.getString("Ruolo")));
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
		
	}
	
	public static boolean UpdateUser(int ID, String nome, String cognome, String via, int civico,
	                                 int cap, String citta, String provincia, String nazione, String telefono) {
	    final String query = "UPDATE utente SET nome = ?, cognome = ?, via = ?, civico = ?, cap = ?, citta = ?, provincia = ?, nazione = ?, telefono = ? WHERE User_ID = ?;";
	    Connection con = null;
	    PreparedStatement pstm = null;
	    
	    try {
	        con = ConnectToDB.getConnection();
	        pstm = con.prepareStatement(query);
	        pstm.setString(1, nome);
	        pstm.setString(2, cognome);
	        pstm.setString(3, via);
	        pstm.setInt(4, civico);
	        pstm.setInt(5, cap);
	        pstm.setString(6, citta);
	        pstm.setString(7, provincia);
	        pstm.setString(8, nazione);
	        pstm.setString(9, telefono);
	        pstm.setInt(10, ID);

	        if (pstm.executeUpdate() > 0) {
	            System.out.println("Query executed successfully.");
	            return true;
	        }
	    } catch (SQLException e) {
	        System.err.println("SQL exception occurred: " + e.getMessage());
	    } catch (Exception e) {
	        System.err.println("Exception occurred: " + e.getMessage());
	    } finally {
	        try {
	            if (pstm != null) pstm.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            System.err.println("Failed to close resources: " + e.getMessage());
	        }
	    }
	    return false;
	}

}
