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

	String StudentName =request.getParameter("StudentName");
	long Mobile =Long.parseLong(request.getParameter("Mobile"));
	System.out.println("call"+CallNo);
	System.out.println("id"+StudentId);
	System.out.println("name"+StudentName);
	System.out.println("mob"+Mobile);

	IssueBookBean beann =new IssueBookBean(CallNo,StudentId,StudentName,Mobile);
	int status =BookDAO.IssueBook(beann);
	System.out.println(status);
	if(status !=0){
		out.println("Book Issued Sucessfully");
		request.getRequestDispatcher("BookIssueForm.jsp").include(request,response);

	}
	else{
	out.println("some error occured ");
	}

}
%>
</body>
</html>