package com.benilde.finalproject.Utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Mysql {
	static String jdbcURL = "jdbc:mysql://localhost:3307/appintr";
	static String jdbcUsername = "root";
	static String jdbcPassword = "";

	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public static void main(String[] args) {
		try {
			Connection conn = Mysql.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "CREATE TABLE IF NOT EXISTS `users` (\r\n"
					+ "  `id` int(11) NOT NULL AUTO_INCREMENT,\r\n"
					+ "  `first_name` varchar(250) NOT NULL,\r\n"
					+ "  `last_name` varchar(250) NOT NULL,\r\n"
					+ "  `role` varchar(250) NOT NULL,\r\n"
					+ "  `username` varchar(255) NOT NULL,\r\n"
					+ "  `password` varchar(255) NOT NULL,\r\n"
					+ "  PRIMARY KEY (`id`)\r\n"
					+ ") ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4";

			stmt.executeUpdate(sql);
			System.out.println("Created table in given database...");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
