package com.sandeep.DAOs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnnectionDAO {

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost/FreshApp","root","");
		return con;
		
}
	}
