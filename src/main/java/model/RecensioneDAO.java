package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecensioneDAO {

    // Metodo per ottenere recensioni per ID del prodotto
    public static List<Recensione> getReviewByProductID(int productID) {
        List<Recensione> listRecensione = new ArrayList<>();
        String sql = "SELECT * FROM recensioni WHERE Product_ID = ?";

        try (Connection con = ConnectToDB.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, productID);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int recensioneID = resultSet.getInt("Recensione_ID");
                    String userName = resultSet.getString("UserName");
                    int valutazione = resultSet.getInt("Valutazione");
                    String descrizione = resultSet.getString("Descrizione");
                    int userID = resultSet.getInt("User_ID");

                    Recensione recensione = new Recensione(recensioneID, userName, valutazione, descrizione, userID, productID);
                    listRecensione.add(recensione);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Log e gestione dell'eccezione
        }

        return listRecensione;
    }

    // Metodo per ottenere recensioni per ID dell'utente
    public static List<Recensione> getReviewByUserID(int userID) {
        List<Recensione> listRecensione = new ArrayList<>();
        String sql = "SELECT * FROM recensioni WHERE User_ID = ?";

        try (Connection con = ConnectToDB.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setInt(1, userID);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int recensioneID = resultSet.getInt("Recensione_ID");
                    String userName = resultSet.getString("UserName");
                    int valutazione = resultSet.getInt("Valutazione");
                    String descrizione = resultSet.getString("Descrizione");
                    int productID = resultSet.getInt("Product_ID");

                    Recensione recensione = new Recensione(recensioneID, userName, valutazione, descrizione, userID, productID);
                    listRecensione.add(recensione);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Log e gestione dell'eccezione
        }

        return listRecensione;
    }

    // Metodo per inserire una nuova recensione nel database
    public static boolean insertRecensione(Recensione recensione) {
        String sql = "INSERT INTO recensioni (UserName, Valutazione, Descrizione, User_ID, Product_ID) VALUES (?, ?, ?, ?, ?)";
        boolean rowInserted = false;

        try (Connection con = ConnectToDB.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setString(1, recensione.getUserName());
            statement.setInt(2, recensione.getValutazione());
            statement.setString(3, recensione.getDescrizione());
            statement.setInt(4, recensione.getUserID());
            statement.setInt(5, recensione.getProductID());

            rowInserted = statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // Log e gestione dell'eccezione
        }

        return rowInserted;
    }
}
