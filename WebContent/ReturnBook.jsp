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
	<%@page import="com.sandeep.DAOs.*,com.sandeep.Bean.*"%>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

session=request.getSession(false);//get the session if the session is not there then do not create it(false attribute workking here)


if(session.getAttribute("id") != null){

	String CallNo = request.getParameter("Call");
	int StudentId = Integer.parseInt(request.getParameter("StudentId"));

	int status =BookDAO.ReturnBook(CallNo, StudentId);
	System.out.println(status);
	if(status !=0){
		out.println("Book Returned Sucessfully");
		request.getRequestDispatcher("BookReturnForm.jsp").include(request,response);

	}
	else{
	out.println("some error occured ");
	}

}
%>
</body>
</html>