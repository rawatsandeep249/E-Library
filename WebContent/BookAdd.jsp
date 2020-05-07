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
		
		String Call=request.getParameter("Call");
		String Name=request.getParameter("Name");
		String Author=request.getParameter("Author");
		String Publisher =request.getParameter("Publisher");
		int Quantity=Integer.parseInt(request.getParameter("Quantity"));
	
		BookBean bean =new BookBean(Call,Name,Author,Publisher,Quantity);
		int status=BookDAO.AddBook(bean);
		if(status !=0){
			out.println("Book Added Sucessfully");
			request.getRequestDispatcher("BookAddForm.jsp").include(request,response);
	
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