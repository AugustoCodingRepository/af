package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectToDB
{
	private static final String URL = "jdbc:mysql://localhost:3306/altafrequenza";
	private static final String USER = "root";
	private static final String PASSWORD = "Team4project!!";
	
	// Metodo per ottenere la connessione al database
	public static Connection getConnection() throws SQLException{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection(URL, USER, PASSWORD);
	}
}