package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrdineDAO {

    public static void insert(Ordine ordine, User user) throws SQLException {
        if (user != null) {
            try (Connection connection = ConnectToDB.getConnection()) {
                connection.setAutoCommit(false); // Start transaction

                // Insert into Ordine table
                String insertOrdineSQL = "INSERT INTO Ordine (User_ID, Order_Data, Delivery_Data, Cost) VALUES (?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(insertOrdineSQL, Statement.RETURN_GENERATED_KEYS)) {
                    statement.setInt(1, ordine.getUser_ID());
                    statement.setDate(2, ordine.getOrder_Data());
                    statement.setDate(3, ordine.getDelivery_Data());
                    statement.setDouble(4, ordine.getCost());

                    statement.executeUpdate();

                    // Get the generated order_id
                    try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            int orderId = generatedKeys.getInt(1);
                            // Insert products into prodotto_ordine table
                            insertProductsForOrder(connection, orderId, ordine.getProducts());
                        } else {
                            throw new SQLException("Failed to get generated order ID.");
                        }
                    }
                }

                connection.commit(); // Commit transaction
                System.out.println("Ordine registrato con successo.");
            } catch (SQLException e) {
                System.out.println("Errore durante l'inserimento dell'ordine: " + e.getMessage());
                throw e;
            }
        } else {
            throw new SQLException("Solo gli utenti registrati possono effettuare un ordine.");
        }
    }

    @SuppressWarnings("unused")
	private static void insertProductsForOrder(Connection connection, int orderId, List<Integer> products) throws SQLException {
        String insertProdottiOrdineSQL = "INSERT INTO prodotto_ordine (order_id, product_id) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(insertProdottiOrdineSQL)) {
            for (int productId : products) {
                statement.setInt(1, orderId);
                statement.setInt(2, productId);
                statement.addBatch();
            }
            statement.executeBatch();
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
                        getProductsForOrder(resultSet.getInt("Order_ID"), connection)
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
                                getProductsForOrder(resultSet.getInt("Order_ID"), connection)
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
                            getProductsForOrder(resultSet.getInt("Order_ID"), connection)
                    );
                }
            }
        }
        return ordine;
    }

    private static List<Integer> getProductsForOrder(int orderId, Connection connection) throws SQLException {
        List<Integer> productList = new ArrayList<>();
        String selectProdottiOrdineSQL = "SELECT product_id FROM prodotto_ordine WHERE order_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(selectProdottiOrdineSQL)) {
            statement.setInt(1, orderId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    productList.add(resultSet.getInt("product_id"));
                }
            }
        }
        return productList;
    }
}
