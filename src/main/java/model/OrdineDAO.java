package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public class OrdineDAO {

    public static void insert(Ordine ordine, User user) throws SQLException {
        if (user != null) {
            try (Connection connection = ConnectToDB.getConnection();
                 PreparedStatement statement = connection.prepareStatement("INSERT INTO Ordine (User_ID, Order_Data, Delivery_Data, Cost, ProductList) VALUES (?, ?, ?, ?, ?)")) {

                statement.setInt(1, ordine.getUser_ID());
                statement.setDate(2, ordine.getOrder_Data());
                statement.setDate(3, ordine.getDelivery_Data());
                statement.setDouble(4, ordine.getCost());
                statement.setString(5, convertToJsonString(ordine.getProdottiAcquistati()));

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
                        convertJsonStringToArrayList(resultSet.getString("ProductList"))
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
                                convertJsonStringToArrayList(resultSet.getString("ProductList"))
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
                            convertJsonStringToArrayList(resultSet.getString("ProductList"))
                    );
                }
            }
        }
        return ordine;
    }

    // Metodo per convertire una lista di Integer in una stringa JSON
    private static String convertToJsonString(Collection<Integer> list) {
        if (list == null) {
            return "[]";
        }
        // Converte la lista di Integer in una stringa JSON
        return "[" + list.stream()
                .map(String::valueOf)
                .collect(Collectors.joining(",")) + "]";
    }

    // Metodo per convertire una stringa JSON in una lista di Integer
    private static Collection<Integer> convertJsonStringToArrayList(String json) {
        Collection<Integer> list = new ArrayList<>();
        if (json == null || json.trim().isEmpty()) {
            return list;
        }
        // Rimuove le parentesi quadre e suddivide la stringa
        String[] items = json.replace("[", "").replace("]", "").split(",");
        for (String item : items) {
            try {
                list.add(Integer.parseInt(item.trim()));
            } catch (NumberFormatException e) {
                // Ignora l'elemento se non è un numero valido
                e.printStackTrace();
            }
        }
        return list;
    }
}
