package model;

import java.sql.SQLException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PhotoDB {
	public synchronized static byte[] load(String id) throws SQLException {

		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		byte[] bt = null;

		try {
			connection = ConnectToDB.getConnection();
			String sql = "SELECT imgProduct FROM prodotto WHERE Product_ID = " + id;
			stmt = connection.prepareStatement(sql);
			rs = stmt.executeQuery();

			if (rs.next()) {
				bt = rs.getBytes("imgProduct");
			}

		} catch (SQLException sqlException) {
			System.out.println(sqlException);
		} 
			finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException sqlException) {
				System.out.println(sqlException);
			} finally {
				if (connection != null) 
					connection.close();
			}
		}
		return bt;
	}

	public synchronized static void updatePhoto(String idA, String photo) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			con = ConnectToDB.getConnection();

			stmt = con.prepareStatement("UPDATE prodotto SET imgProduct = ? WHERE Product_ID = ?");
			
			File file = new File(photo);
			try {
				FileInputStream fis = new FileInputStream(file);
				stmt.setBinaryStream(1, fis, fis.available());
				stmt.setString(2, idA);
				
				stmt.executeUpdate();
				con.commit();
			} catch (FileNotFoundException e) {
				System.out.println(e);
			} catch (IOException e) {
				System.out.println(e);
			}
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException sqlException) {
				System.out.println(sqlException);
			} finally {
				if (con != null)
					con.close();
			}
		}
	}	
}