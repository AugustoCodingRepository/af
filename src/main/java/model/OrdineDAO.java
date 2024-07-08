package model; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrdineDAO {
	
	private static final String SELECT_ORDINE_BY_USER_ID = "SELECT * FROM ordine WHERE User_ID=?";
    private static final String INSERT_ORDINE_SQL = "INSERT INTO ordine (User_ID, Order_Data, Delivery_Data, Cost, ProductList) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_ORDINE_BY_ID = "SELECT * FROM ordine WHERE Order_ID=?";
    private static final String SELECT_ALL_ORDINI = "SELECT * FROM ordine";
    private static final String DELETE_ORDINE_SQL = "DELETE FROM ordine WHERE Order_ID=?";
    private static final String UPDATE_ORDINE_SQL = "UPDATE ordine SET User_ID=?, Order_Data=?, Delivery_Data=?, Cost=?, ProductList=? WHERE Order_ID=?";

    public OrdineDAO() {
    }

    // Metodo per inserire un nuovo ordine nel database
    public static int insertOrdine(Ordine ordine, User user) throws SQLException {
        String INSERT_ORDINE_SQL = "INSERT INTO ordine (User_ID, Order_Data, Delivery_Data, Cost, ProductList) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = ConnectToDB.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDINE_SQL, Statement.RETURN_GENERATED_KEYS)) { // Modifica qui
            preparedStatement.setInt(1, user.getUser_ID());
            preparedStatement.setDate(2, new java.sql.Date(ordine.getOrderDate().getTime()));
            preparedStatement.setDate(3, new java.sql.Date(ordine.getDeliveryDate().getTime()));
            preparedStatement.setDouble(4, ordine.getCost());
            preparedStatement.setString(5, ordine.getProductList());
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int pk = generatedKeys.getInt(1);
                        System.out.println(pk + "inOrderDAO");
                        return pk;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return 0;
    }

    // Metodo per selezionare un ordine dal database tramite Order_ID
    public static Ordine selectOrdine(int orderID) {
        Ordine ordine = null;
        try (Connection connection = ConnectToDB.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDINE_BY_ID)) {
            preparedStatement.setInt(1, orderID);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int userID = rs.getInt("User_ID");
                Date orderDate = rs.getDate("Order_Data");
                Date deliveryDate = rs.getDate("Delivery_Data");
                Double cost = rs.getDouble("Cost");
                String productList = rs.getString("ProductList");

                ordine = new Ordine(orderID, userID, orderDate, deliveryDate, cost, productList);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ordine;
    }

    // Metodo per selezionare tutti gli ordini presenti nel database
    public static List<Ordine> selectAll() {
        List<Ordine> ordini = new ArrayList<>();
        try (Connection connection = ConnectToDB.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ORDINI)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("Order_ID");
                int userID = rs.getInt("User_ID");
                Date orderDate = rs.getDate("Order_Data");
                Date deliveryDate = rs.getDate("Delivery_Data");
                Double cost = rs.getDouble("Cost");
                String productList = rs.getString("ProductList");

                ordini.add(new Ordine(orderID, userID, orderDate, deliveryDate, cost, productList));
                System.out.println("ordine recuperato");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ordine non recuperato");
        }
        return ordini;
    }

    // Metodo per eliminare un ordine dal database tramite Order_ID
    public static boolean deleteOrdine(int orderID) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = ConnectToDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_ORDINE_SQL)) {
            statement.setInt(1, orderID);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // Metodo per aggiornare un ordine nel database
    public static boolean updateOrdine(Ordine ordine) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = ConnectToDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_ORDINE_SQL)) {
            statement.setInt(1, ordine.getUserID());
            statement.setDate(2, new java.sql.Date(ordine.getOrderDate().getTime()));
            statement.setDate(3, new java.sql.Date(ordine.getDeliveryDate().getTime()));
            statement.setDouble(4, ordine.getCost());
            statement.setString(5, ordine.getProductList());
            statement.setInt(6, ordine.getOrderID());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    
    public static List<Ordine> getOrderByUserId(int userId) {
        List<Ordine> ordini = new ArrayList<>();
        try (Connection connection = ConnectToDB.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDINE_BY_USER_ID)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("Order_ID");
                Date orderDate = rs.getDate("Order_Data");
                Date deliveryDate = rs.getDate("Delivery_Data");
                Double cost = rs.getDouble("Cost");
                String productList = rs.getString("ProductList");

                ordini.add(new Ordine(orderID, userId, orderDate, deliveryDate, cost, productList));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ordini;
    }

}