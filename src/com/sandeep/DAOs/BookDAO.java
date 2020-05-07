package com.sandeep.DAOs;
import java.sql.*;
import java.util.*;

import com.sandeep.Bean.*;

public class BookDAO {

	public static int AddBook(BookBean bean) {
		
		int status=0;
		try {
		Connection con=ConnnectionDAO.getConnection();
		PreparedStatement ps=con.prepareStatement("insert into bookdb values(?,?,?,?,?,?)");
		ps.setString(1,bean.getCall());
		ps.setString(2,bean.getName());
		ps.setString(3,bean.getAuthor());
		ps.setString(4,bean.getPublisher());
		ps.setInt(5,bean.getQuantity());
		ps.setInt(6,0);
		status = ps.executeUpdate();
		con.close();

		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static List<BookBean> View(){
		
		List<BookBean> list = new ArrayList<BookBean>();
		try {
			Connection con=ConnnectionDAO.getConnection();
			PreparedStatement ps= con.prepareStatement("SELECT * FROM bookdb");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				BookBean bean = new BookBean();
				bean.setCall(rs.getString("CallNo"));
				bean.setName(rs.getString("Name"));
				bean.setAuthor(rs.getString("Author"));
				bean.setPublisher(rs.getString("Publisher"));
				bean.setQuantity(rs.getInt("Quantity"));
				bean.setIssued(rs.getInt("Issued"));
				list.add(bean);
			
			}con.close();
			
			}catch(Exception e) {
				System.out.println(e);
				}
		return list;
	}
	
	public static void delete(String callNo) {
		
		try {
			Connection con=ConnnectionDAO.getConnection();
			PreparedStatement ps= con.prepareStatement("DELETE FROM bookdb WHERE CALLNO=?");
			ps.setString(1,callNo);
			int status = ps.executeUpdate();
			con.close();
		
		}catch(Exception e){System.out.println(e);}
		}
	
	public static boolean CheckIssue(String callno) {
		boolean status=false;
		try {
			Connection con=ConnnectionDAO.getConnection();
			PreparedStatement ps= con.prepareStatement("SELECT * FROM bookdb WHERE CALLNO=? AND Quantity > Issued");
			ps.setString(1,callno);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
				 status=true;
			 }
			//testing		 System.out.println("checkissue status "+status);
			con.close();
		
		}catch(Exception e){System.out.println("checkIssue exception"+e);}
		return status;
		}
	
	
	public static int IssueBook(IssueBookBean bean) {
		String callno = bean.getCallno();
		boolean checkissue = CheckIssue(callno);
		if(checkissue) {
			int status=0;
			try {
				Connection con=ConnnectionDAO.getConnection();
				PreparedStatement ps= con.prepareStatement("INSERT INTO issuebook VALUES(?,?,?,?,?,?)");
				ps.setString(1,bean.getCallno());
				ps.setInt(2,bean.getStudentid());
				ps.setString(3,bean.getStudentname());
				ps.setLong(4,bean.getStudentmobile());
				System.out.println("mob :"+bean.getStudentmobile());
				java.sql.Date currentDate=new java.sql.Date(System.currentTimeMillis());
				ps.setDate(5,currentDate);
				ps.setString(6,"No");
				status =ps.executeUpdate();
				//testing		 System.out.println("status of insert into command"+status);

				if(status>0) {
					//testing			 System.out.println("inside status> 0 block with status "+status);

					PreparedStatement pss=con.prepareStatement("UPDATE bookdb SET Issued=? WHERE CallNo=?");
					pss.setInt(1, getIssued(callno)+1);
					pss.setString(2,callno);
					status=pss.executeUpdate();
			//testing		 System.out.println("STATUS after update set issued command with status: "+status);

				}

				con.close();
			}
			catch(Exception e){System.out.println("BOokIssued exception"+e);}
			return status;
		}
		else{
				return 0;
			}
		}
		
	

	private static int getIssued(String callno) {
		int issued=0;
		try {
			Connection con=ConnnectionDAO.getConnection();
			PreparedStatement ps= con.prepareStatement("SELECT * FROM bookdb WHERE CALLNO=?");
			ps.setString(1,callno);
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
				 issued=rs.getInt("Issued"); //here we fetch the column (holding the no of book issued) Issued and pass it to the issued variable which is send back to the called place and add +1 to the database (column Issued)
			 }
			//testing		 System.out.println("How mny issued "+issued);

			con.close();
		}catch(Exception e){System.out.println("getIssued exception"+e);}
		
	return issued;
	}
	
	
	public static int ReturnBook(String callno,int studentid) {
		int status=0;
		try {
			Connection con=ConnnectionDAO.getConnection();
			PreparedStatement ps= con.prepareStatement("UPDATE issuebook SET ReturnStatus='yes' WHERE CALLNO=? AND STUDENTID=?");
			ps.setString(1, callno);
			ps.setInt(2, studentid);
			status=ps.executeUpdate();
			if(status>0) {
				PreparedStatement pss= con.prepareStatement("UPDATE bookdb SET Issued=? WHERE CALLNO=?");
				pss.setInt(1, getIssued(callno)-1);
				pss.setString(2,callno);
				status=pss.executeUpdate();
			}
		}catch(Exception e) {
			System.out.print("returnbook exception"+e);
		}
		return status;
		
	}
	
	public static List<IssueBookBean> ViewIssuedBooks(){
		List<IssueBookBean> list=new ArrayList<IssueBookBean>();
		try{
			Connection con=ConnnectionDAO.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from issuebook order by issuedate desc");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				IssueBookBean bean=new IssueBookBean();
				bean.setCallno(rs.getString("CallNo"));
				bean.setStudentid(rs.getInt("StudentId"));
				bean.setStudentname(rs.getString("StudentName"));
				bean.setStudentmobile(rs.getLong("Mobile"));
				bean.setIssueddate(rs.getDate("IssueDate"));
				bean.setReturnstatus(rs.getString("ReturnStatus"));
				list.add(bean);
			}
			con.close();
			
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}

}
	

