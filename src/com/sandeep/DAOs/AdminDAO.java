package com.sandeep.DAOs;
import java.util.*;
import com.sandeep.Bean.*;
import java.sql.*;
import com.sandeep.DAOs.ConnnectionDAO;
public class AdminDAO {

	public static int Addlibrarian(LibrarianBean bean) {
		int status=0;
		try {
			Connection con=ConnnectionDAO.getConnection();
			PreparedStatement ps= con.prepareStatement("INSERT INTO addlib(Name,Email,Password,Mobile) VALUES(?,?,?,?)");
		//	PreparedStatement ps= con.prepareStatement("SELECT * FROM addlib");

			ps.setString(1,bean.getName());
	//		System.out.println("name "+bean.getName());
			ps.setString(2,bean.getEmail());
	//		System.out.println("mail : "+bean.getEmail());

			ps.setString(3,bean.getPassword());
	//		System.out.println("pass : "+bean.getPassword());

			ps.setLong(4,bean.getMobile());
			status=ps.executeUpdate();
			
			con.close();
			

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static int Update(LibrarianBean bean) {
		int status=0;
		try {
		Connection con=ConnnectionDAO.getConnection();
		PreparedStatement ps= con.prepareStatement("UPDATE addlib SET Name=?,Email=?,Password=?,Mobile=? WHERE Id=?");
		ps.setString(1,bean.getName());
		ps.setString(2,bean.getEmail());
		ps.setString(3,bean.getPassword());
		ps.setLong(4,bean.getMobile());		
		ps.setInt(5,bean.getId());

		status = ps.executeUpdate();
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return status;
		
	}
	
	
	public static List<LibrarianBean> view(){
		
		List<LibrarianBean> list= new ArrayList<LibrarianBean>();
		try {
			Connection con=ConnnectionDAO.getConnection();
			PreparedStatement ps= con.prepareStatement("SELECT * FROM addlib");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				LibrarianBean bean=new LibrarianBean();
				bean.setId(rs.getInt("Id"));
				bean.setName(rs.getString("Name"));
				bean.setEmail(rs.getString("Email"));
				bean.setPassword(rs.getString("Password"));
				bean.setMobile(rs.getLong("Mobile"));
				list.add(bean);
			}
			
			con.close();
			}
			catch(Exception e){System.out.println(e);}
			
			return list;			
		}
	
	public static  LibrarianBean viewById(int id) throws ClassNotFoundException, SQLException{
		LibrarianBean bean =new LibrarianBean();
		Connection con=ConnnectionDAO.getConnection();
		PreparedStatement ps= con.prepareStatement("SELECT * FROM addlib WHERE ID=?");
		ps.setInt(1,id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			
			bean.setId(rs.getInt(1));
			bean.setName(rs.getString(2));
			bean.setEmail(rs.getString(3));
			bean.setPassword(rs.getString(4));
			bean.setMobile(rs.getLong(5));
		}
		con.close();
		return bean;
	}
	

	
	public static void delete(int id) throws ClassNotFoundException, SQLException {
		
		int status=0;
		try {
		Connection con=ConnnectionDAO.getConnection();
		PreparedStatement ps= con.prepareStatement("DELETE FROM addlib WHERE ID=?");
		ps.setInt(1, id);
		status = ps.executeUpdate();
		con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
		
	}
	

