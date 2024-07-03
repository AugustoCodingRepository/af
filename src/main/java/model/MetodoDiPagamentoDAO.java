package model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class MetodoDiPagamentoDAO {


	    public static List<MetodoDiPagamento> getAll() throws SQLException {
	        List<MetodoDiPagamento> listTransazione = new ArrayList<>();
	        String sql = "SELECT * FROM metododipagamento";

	        try (Connection con = ConnectToDB.getConnection();
	             Statement statement = con.createStatement();
	             ResultSet resultSet = statement.executeQuery(sql)) {

	            while (resultSet.next()) {
	                int paymentId = resultSet.getInt("Payment_ID");
	                String paymentType = resultSet.getString("Payment_Type");
	                int userId = resultSet.getInt("User_ID");
	                String paypalEmail = resultSet.getString("PayPal_Email");
	                int monthExp = resultSet.getInt("Month_Expiration");
	                int yearExp = resultSet.getInt("Year_Expiration");
	                long cardNumber = resultSet.getLong("Card_Number");
	                int cvv = resultSet.getInt("CVV");

	                MetodoDiPagamento MetodoDiPagamento = new MetodoDiPagamento(paymentId, paymentType, userId, paypalEmail, monthExp, yearExp, cardNumber, cvv);
	                listTransazione.add(MetodoDiPagamento);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw e;
	        }

	        return listTransazione;
	    }

	    public static boolean insert(MetodoDiPagamento MetodoDiPagamento) throws SQLException {
	        String sql = "INSERT INTO metododipagamento (Payment_Type, User_ID, PayPal_Email, Month_Expiration, Year_Expiration, Card_Number, CVV) VALUES (?, ?, ?, ?, ?, ?, ?)";
	        boolean rowInserted;

	        try (Connection con = ConnectToDB.getConnection();
	             PreparedStatement statement = con.prepareStatement(sql)) {

	            statement.setString(1, MetodoDiPagamento.getPaymentType());
	            statement.setInt(2, MetodoDiPagamento.getUserId());
	            statement.setString(3, MetodoDiPagamento.getPaypalEmail());
	            statement.setInt(4, MetodoDiPagamento.getMonthExpiration());
	            statement.setInt(5, MetodoDiPagamento.getYearExpiration());
	            statement.setLong(6, MetodoDiPagamento.getCardNumber());
	            statement.setInt(7, MetodoDiPagamento.getCvv());

	            rowInserted = statement.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw e;
	        }

	        return rowInserted;
	    }
	}


