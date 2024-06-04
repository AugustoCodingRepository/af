package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrdineDAO {

    public void insert(Ordine ordine) throws SQLException {
        Connection connection = ConnectToDB.getConnection();
        PreparedStatement statement = connection.prepareStatement("INSERT INTO Ordine (Order_ID, User_ID, Order_Data, Delivery_Data) VALUES (?, ?, ?, ?)");
        statement.setInt(1, ordine.getOrder_ID());
        statement.setInt(2, ordine.getUser_ID());
        statement.setDate(3, ordine.getOrder_Data());
        statement.setDate(4, ordine.getDelivery_Data());
        statement.executeUpdate();
    }

    public List<Ordine> getAll() throws SQLException {
        Connection connection = ConnectToDB.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM Ordine");
        ResultSet resultSet = statement.executeQuery();
        List<Ordine> ordini = new ArrayList<>();
        while (resultSet.next()) {
            Ordine ordine = new Ordine();
            ordine.setOrder_ID(resultSet.getInt("Order_ID"));
            ordine.setUser_ID(resultSet.getInt("User_ID"));
            ordine.setOrder_Data(resultSet.getDate("Order_Data"));
            ordine.setDelivery_Data(resultSet.getDate("Delivery_Data"));
            ordini.add(ordine);
        }
        return ordini;
    }
}