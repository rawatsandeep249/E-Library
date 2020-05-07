package com.sandeep.DAOs;

import java.sql.*;

public class LibrarianDAO {
	
	public static boolean LibrarianCheck(String id, String pswd) throws SQLException, ClassNotFoundException {
		boolean status=false;
		
			String Id=id;
			String Pswd=pswd;
		
			Connection con=ConnnectionDAO.getConnection();
			PreparedStatement ps= con.prepareStatement("SELECT * FROM addlib WHERE Email=? AND Password=?");
			ps.setString(1, Id);
			ps.setString(2, Pswd);
			ResultSet rs=ps.executeQuery();
		
			if(rs.next()) {
				return true;
			}
			else {
				return false;
			}
		
		
	}


}
