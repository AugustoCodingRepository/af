package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	        statement.setInt(5, ordine.getCost());
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
}