package com.sandeep.logfiles;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.sandeep.DAOs.*;
@WebServlet("/LibrarianLogiN")
public class CheckLibrarian extends HttpServlet{
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		PrintWriter out=res.getWriter();
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>Librarian Section</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("<script type=\"text/javascript\" src=\"jquery-3.5.0.min.js\"></script>");
		out.println("</head>");
		out.println("<body>");
		String id=req.getParameter("email");
		String pswd=req.getParameter("password");
		boolean status = false;
		try {
		status = LibrarianDAO.LibrarianCheck(id,pswd);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		if(status == true) {
			
			
			HttpSession session=req.getSession();
			session.setAttribute("id",id);
			res.sendRedirect("LibrarianSection.jsp");
			}
		else {

			out.println("<script type=\"text/javascript\">");
			out.println("alert(\"User Not Found\");");
			out.println("</script>");
//			out.println("");
			req.getRequestDispatcher("HomeNavBar.html").include(req, res);

			req.getRequestDispatcher("LibrarianLoginAgain.html").include(req, res);

			out.println("</body>");
			out.println("</html>");


		}
		
		
	}

	
}
