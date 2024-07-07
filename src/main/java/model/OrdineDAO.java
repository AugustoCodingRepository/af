package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class OrdineDAO {

    public static void insert(Ordine ordine, User user) throws SQLException {
        if (user != null) {
            try (Connection connection = ConnectToDB.getConnection();
                 PreparedStatement statement = connection.prepareStatement("INSERT INTO Ordine (Order_ID, User_ID, Order_Data, Delivery_Data, Cost, product_list) VALUES (?, ?, ?, ?, ?, ?)")) {
                statement.setInt(1, ordine.getOrder_ID());
                statement.setInt(2, ordine.getUser_ID());
                statement.setDate(3, ordine.getOrder_Data());
                statement.setDate(4, ordine.getDelivery_Data());
                statement.setDouble(5, ordine.getCost());
                statement.setArray(6, connection.createArrayOf("VARCHAR", ordine.getProdottiAcquistati().toArray()));
                statement.executeUpdate();
                System.out.println("Ordine registrato");
            }
        } else {
            throw new SQLException("Solo gli utenti registrati possono effettuare un ordine.");
        }
    }

    public static List<Ordine> getAll() throws SQLException {
        List<Ordine> ordini = new ArrayList<>();
        try (Connection connection = ConnectToDB.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM Ordine");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Ordine ordine = new Ordine(
                        resultSet.getInt("Order_ID"),
                        resultSet.getInt("User_ID"),
                        resultSet.getDate("Order_Data"),
                        resultSet.getDate("Delivery_Data"),
                        resultSet.getDouble("Cost"),
                        convertArrayToArrayList(resultSet.getArray("product_list"))
                );
                ordini.add(ordine);
            }
        }
        return ordini;
    }

    public static List<Ordine> getOrdiniByUser(User user) throws SQLException {
        List<Ordine> ordini = new ArrayList<>();
        if (user != null) {
            try (Connection connection = ConnectToDB.getConnection();
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM Ordine WHERE User_ID = ?")) {
                statement.setInt(1, user.getUser_ID());
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Ordine ordine = new Ordine(
                                resultSet.getInt("Order_ID"),
                                resultSet.getInt("User_ID"),
                                resultSet.getDate("Order_Data"),
                                resultSet.getDate("Delivery_Data"),
                                resultSet.getDouble("Cost"),
                                convertArrayToArrayList(resultSet.getArray("product_list"))
                        );
                        ordini.add(ordine);
                    }
                }
            }
        }
        return ordini;
    }

    public static Ordine getOrderByID(int orderID) throws SQLException {
        Ordine ordine = null;
        try (Connection connection = ConnectToDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM Ordine WHERE Order_ID = ?")) {
            pstmt.setInt(1, orderID);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    ordine = new Ordine(
                            resultSet.getInt("Order_ID"),
                            resultSet.getInt("User_ID"),
                            resultSet.getDate("Order_Data"),
                            resultSet.getDate("Delivery_Data"),
                            resultSet.getDouble("Cost"),
                            convertArrayToArrayList(resultSet.getArray("product_list"))
                    );
                }
            }
        }
        return ordine;
    }

    private static Collection<Integer> convertArrayToArrayList(Array array) throws SQLException {
        if (array == null) {
            return null;
        }
        int[] data = (int[]) array.getArray();
        Collection<Integer> list = new ArrayList<>(data.length);
        for (Integer s : data) {
            list.add(s);
        }
        return list;
    }
}
