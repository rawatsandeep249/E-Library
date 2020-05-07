<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css"/>

</head>
<body>


	<%@page 
	import="com.sandeep.DAOs.*,com.sandeep.Bean.*"%>
	<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	session=request.getSession(false);//get the session if the session is not there then do not create it(false attribute workking here)
	if(session.getAttribute("id") != null){

		String Name=request.getParameter("Name");
		String Email=request.getParameter("Email");
		String Password =request.getParameter("Password");
		long Mobile=Long.parseLong(request.getParameter("Mobile"));
		// for checking
		//String Mobile=Long.parseLong(mob);
		//	out.println(mob);
		//		System.out.println("  o  :"+Name);
		//	System.out.println("   o  :"+Email);
		//	System.out.println("    o :"+Password);
		//	System.out.println("     o:"+Mobile);

		LibrarianBean bean =new LibrarianBean(Name,Email,Password,Mobile);
		int status=AdminDAO.Addlibrarian(bean);
		if(status !=0){
			out.println("Librarian Added Sucessfully");
			request.getRequestDispatcher("LibAddForm.jsp").include(request,response);
	
		}
		else{
		out.println("some error occured ");
		}
		}
	else{
		out.println("Please Loggin First");
		response.sendRedirect("MainPage.html");
	}
%>
	

</body>
</html>