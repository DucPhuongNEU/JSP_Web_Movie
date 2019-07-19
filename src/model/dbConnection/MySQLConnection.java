package model.dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {

	private static Connection connection;
		
		static {
			try {
				System.out.println(">>>Connecting to the database");
				if (connection == null || connection.isClosed()) {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					
					connection = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/one_dimension"
							+ "?useUnicode=true&characterEncoding=UTF-8",
							"root", "123456");
				}
				System.out.println(">>>Connecting successfully");
			}catch (Exception e) {
				System.out.println(">>>>>can not connect to the database");
				e.printStackTrace();
			}
		}
	
		public void closeConnection() throws SQLException {
			connection.close();
		}
		
		public static Connection getConnection() {
			return connection;
		}
		
		public static void setConnection(Connection connection) {
			MySQLConnection.connection = connection;
		}
		
		public static void main(String[] args) {
			MySQLConnection mySQLConnection = new MySQLConnection();
			System.out.println(mySQLConnection.getConnection());
		}

}
