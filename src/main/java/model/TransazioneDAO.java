package model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class TransazioneDAO {


	    public List<Transazione> getAll() throws SQLException {
	        List<Transazione> listTransazione = new ArrayList<>();
	        String sql = "SELECT * FROM metododipagamento";

	        try (Connection con = ConnectToDB.getConnection();
	             Statement statement = con.createStatement();
	             ResultSet resultSet = statement.executeQuery(sql)) {

	            while (resultSet.next()) {
	                int paymentId = resultSet.getInt("Payment_ID");
	                String paymentType = resultSet.getString("Payment_Type");
	                int userId = resultSet.getInt("User_ID");
	                String paypalEmail = resultSet.getString("PayPal_Email");
	                Date cardExpiration = resultSet.getDate("Card_Expiration");
	                long cardNumber = resultSet.getLong("Card_Number");
	                int cvv = resultSet.getInt("CVV");

	                Transazione transazione = new Transazione(paymentId, paymentType, userId, paypalEmail, cardExpiration, cardNumber, cvv);
	                listTransazione.add(transazione);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw e;
	        }

	        return listTransazione;
	    }

	    public boolean insert(Transazione transazione) throws SQLException {
	        String sql = "INSERT INTO metododipagamento (Payment_Type, User_ID, PayPal_Email, Card_Expiration, Card_Number, CVV) VALUES (?, ?, ?, ?, ?, ?)";
	        boolean rowInserted;

	        try (Connection con = ConnectToDB.getConnection();
	             PreparedStatement statement = con.prepareStatement(sql)) {

	            statement.setString(1, transazione.getPaymentType());
	            statement.setInt(2, transazione.getUserId());
	            statement.setString(3, transazione.getPaypalEmail());
	            statement.setDate(4, new java.sql.Date(transazione.getCardExpiration().getTime()));
	            statement.setLong(5, transazione.getCardNumber());
	            statement.setInt(6, transazione.getCvv());

	            rowInserted = statement.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw e;
	        }

	        return rowInserted;
	    }
	}


