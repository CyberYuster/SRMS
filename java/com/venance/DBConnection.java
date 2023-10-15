package com.venance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
private static String host="jdbc:mysql://localhost:3306/srms";
private static String username="root";
private static String password="";
private static Connection conn;

  public static Connection getConnection() {
	  try {
		  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
			conn=DriverManager.getConnection(host,username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return conn; 
  }
 
}
