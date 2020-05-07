<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page
	import ="com.sandeep.DAOs.*,com.sandeep.Bean.*"
 %>

	<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	session=request.getSession(false);//get the session if the session is not there then do not create it(false attribute workking here)
	if(session.getAttribute("id") != null){
		int Id=Integer.parseInt(request.getParameter("currentId"));

		String Name=request.getParameter("Name");
		String Email =request.getParameter("Email");
		String Password=request.getParameter("Password");
		Long Mobile=Long.parseLong(request.getParameter("Mobile"));
		LibrarianBean bean = new LibrarianBean(Id,Name,Email,Password,Mobile);
		

		int status = AdminDAO.Update(bean);
		out.println("STATUS IS:"+status);
		if(status != 0){ 
		out.println("Updated Information Sucessfull");
		response.sendRedirect("LibView.jsp");
		}
		else{
			out.println("Some Error Occurred ! Sorry");
			}
		}
	else{
	out.println("Please Loggin First");
	response.sendRedirect("MainPage.html");
}
	%>		
			
	
</body>
</html>