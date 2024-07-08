package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransazioneDAO {

    public static List<Transazione> getAll() throws SQLException {
        List<Transazione> listTransazione = new ArrayList<>();
        String sql = "SELECT * FROM transazione";

        try (Connection con = ConnectToDB.getConnection();
             Statement statement = con.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                int transactionId = resultSet.getInt("Transaction_ID");
                int orderId = resultSet.getInt("Order_ID");
                int userId = resultSet.getInt("User_ID");
                String esito = resultSet.getString("Esito");

                Transazione transazione = new Transazione(transactionId, orderId, userId, esito);
                listTransazione.add(transazione);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return listTransazione;
    }

    public static boolean insert(Transazione transazione) throws SQLException {
        String sql = "INSERT INTO transazione (Order_ID, User_ID, Esito) VALUES (?, ?, ?)";
        boolean rowInserted;

        try (Connection con = ConnectToDB.getConnection();
             PreparedStatement statement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        	System.out.println(transazione.getOrderId());
            statement.setInt(1, transazione.getOrderId());
            statement.setInt(2, transazione.getUserId());
            statement.setString(3, transazione.getEsito());

            rowInserted = statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return rowInserted;
    }
}