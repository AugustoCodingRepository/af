package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrdineDAO {

	public static void insert(Ordine ordine, User user) throws SQLException {
	    if (user != null) {
	        Connection connection = ConnectToDB.getConnection();
	        PreparedStatement statement = connection.prepareStatement("INSERT INTO Ordine (Order_ID, User_ID, Order_Data, Delivery_Data, Cost) VALUES (?, ?, ?, ?, ?)");
	        statement.setInt(1, ordine.getOrder_ID());
	        statement.setInt(2, ordine.getUser_ID());
	        statement.setDate(3, ordine.getOrder_Data());
	        statement.setDate(4, ordine.getDelivery_Data());
	        statement.setDouble(5, ordine.getCost());
	        statement.executeUpdate();
	    } else {
	        throw new SQLException("Solo gli utenti registrati possono effettuare un ordine.");
	    }
	}

    public static List<Ordine> getAll() throws SQLException {
        Connection connection = ConnectToDB.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM Ordine");
        ResultSet resultSet = statement.executeQuery();
        List<Ordine> ordini = new ArrayList<>();
        while (resultSet.next()) {
            Ordine ordine = new Ordine(
                resultSet.getInt("Order_ID"),
                resultSet.getInt("User_ID"),
                resultSet.getDate("Order_Data"),
                resultSet.getDate("Delivery_Data"),
                resultSet.getInt("Cost")
            );
            ordini.add(ordine);
        }
        return ordini;
    }

    public static List<Ordine> getOrdiniByUser(User user) throws SQLException {
        List<Ordine> ordini = new ArrayList<>();
        if (user != null) {
            Connection connection = ConnectToDB.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM Ordine WHERE User_ID = ?");
            statement.setInt(1, user.getUser_ID());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Ordine ordine = new Ordine(
                    resultSet.getInt("Order_ID"),
                    resultSet.getInt("User_ID"),
                    resultSet.getDate("Order_Data"),
                    resultSet.getDate("Delivery_Data"),
                    resultSet.getInt("Cost")
                );
                ordini.add(ordine);
            }
        }
        return ordini;
    }
    
    public Ordine getOrderByID(int orderID) {
        Ordine ordine = null;

        try {
            // Connessione al database
        	 Connection connection = ConnectToDB.getConnection();

            // Query per recuperare l'ordine dato l'ID
            String query = "SELECT * FROM ordini WHERE Order_ID = ?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, orderID);

            // Esecuzione della query
            ResultSet rs = pstmt.executeQuery();

            // Verifica se l'ordine è stato trovato
            if (rs.next()) {
                // Recupera i dati dell'ordine dal ResultSet
                int userID = rs.getInt("User_ID");
                Date orderDate = rs.getDate("Order_Data");
                Date deliveryDate = rs.getDate("Delivery_Data");
                double cost = rs.getDouble("Cost");

                // Crea un oggetto Ordine con i dati recuperati
                ordine = new Ordine(orderID, userID, orderDate, deliveryDate, cost);
            }

            // Chiusura delle risorse
            rs.close();
            pstmt.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ordine;
    }
}