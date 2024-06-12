package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
				return new User(rs.getInt("User_ID"), rs.getString("Email"),
						rs.getString("Password"), rs.getString("Nome"),
						rs.getString("Cognome"), rs.getString("Via"),
						rs.getInt("Civico"), rs.getInt("CAP"),
						rs.getString("Citta"), rs.getString("Provincia"),
						rs.getString("Nazione"), rs.getString("Telefono"),
						rs.getString("Ruolo"));
			}} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
