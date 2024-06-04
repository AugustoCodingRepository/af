package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	public static User LoginCheck(String username, String password) {
		final String query = "SELECT * FROM utente WHERE NomeUtente = ? AND Password = ?";
		try {
			Connection con = ConnectToDB.getConnection();
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, username);
			pstm.setString(2, password);
			ResultSet rs = pstm.executeQuery();
			if (rs.next())
				return new User(rs.getInt("User_ID"), rs.getString("NomeUtente"), rs.getString("Email"),
						rs.getString("Password"), rs.getString("Nome"), rs.getString("Cognome"), rs.getString("Via"),
						rs.getInt("Civico"), rs.getInt("CAP"), rs.getString("Citta"), rs.getString("Provincia"),
						rs.getString("Nazione"), rs.getString("Telefono"), rs.getString("Role"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean RegistrationCheck(String nomeUtente, String email, String password, String nome, String cognome,
			String via, int civico, int cAP, String citta, String provincia, String nazione, String telefono) {
		try {
			final String query = "INSERT INTO `utente`"
					+ "(`NomeUtente`, `Email`, `Password`, `Nome`, `Cognome`, `Via`, `Civico`, `CAP`, `citta`, `provincia`, `Nazione`, `Telefono`, `Role`)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			Connection con = ConnectToDB.getConnection();
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, nomeUtente);
			pstm.setString(2, email);
			pstm.setString(3, password);
			pstm.setString(4, nome);
			pstm.setString(5, cognome);
			pstm.setString(6, via);
			pstm.setInt(8, civico);
			pstm.setInt(9, cAP);
			pstm.setString(10, citta);
			pstm.setString(11, provincia);
			pstm.setString(12, nazione);
			pstm.setString(13, telefono);
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
}