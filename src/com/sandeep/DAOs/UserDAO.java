package com.sandeep.DAOs;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

	public boolean userlogin(String id, String pswd) throws SQLException, ClassNotFoundException {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost/FreshApp","root","");
		String Id=id;
		String Pswd=pswd;
	
		PreparedStatement ps= con.prepareStatement("SELECT * FROM Admins WHERE Username=? AND Password=?");
		ps.setString(1, Id);
		ps.setString(2, Pswd);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			
		return true;
			}
		else {
		return  false;
	}
	}
}
