 package com.sandeep.logfiles;
import com.sandeep.DAOs.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLogiN")
public class CheckAdmin extends HttpServlet{

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		PrintWriter out =res.getWriter();
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>Librarian Section</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("<script type=\"text/javascript\" src=\"jquery-3.5.0.min.js\"></script>");
		out.println("</head>");
		out.println("<body>");
		String id =req.getParameter("email");
		String pswd =req.getParameter("pass");
//checking		out.println(pswd);
//checking		out.println(id);
		boolean check=false;
		
		UserDAO calling =new UserDAO();
		try {
			check = calling.userlogin(id,pswd);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		if(check==true) {
		
			HttpSession session = req.getSession();
			session.setAttribute("id",id);
			res.sendRedirect("AdminSection.jsp");
		}
		else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert(\"User Not Found\");");
			out.println("</script>");
//			out.println("");
			req.getRequestDispatcher("HomeNavBar.html").include(req, res);

			req.getRequestDispatcher("AdminLoginAgain.html").include(req, res);

			out.println("</body>");
			out.println("</html>");
		}

	}
}
