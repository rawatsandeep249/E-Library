<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css"/>
<script type="text/javascript" src="jquery-3.5.0.min.js"></script>

</head>
<body>

	<style>
	
	
body{
	 background-image:url("C:/Users/Asus/eclipse-workspace/E-Lib-By-Sandeep/WebContent/images/10.jpg");
		 background-size:cover;
	
}
</style>
 
<script type="text/javascript">

	
		$(function(){
			$(".including").load("AdminNavBar.html");

		});
	
	
</script>	
	 <div class="including"></div>
	<h3 align="center">Librarian Details</h3>
	<%@page 
	import ="com.sandeep.DAOs.*,com.sandeep.Bean.*,java.util.*" %>
	<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	session=request.getSession(false);//get the session if the session is not there then do not create it(false attribute workking here)
	if(session.getAttribute("id") != null){
		List<LibrarianBean> list =AdminDAO.view();
	
			%>
			<div align="center" >
		<table class='table table-bordered table-striped'>
	
		<tr><th>Id</th><th>Librarian Name</th><th>Email Id</th><th>Password</th><th>Contact No</th><th>Edit</th><th>Delete</th></tr>
		<% for(LibrarianBean bean :list){ %>
	
			<tr><th><% out.println(bean.getId()); %></th><th><% out.println(bean.getName());%></th><th><% out.println(bean.getEmail());%></th><th><% out.println(bean.getPassword());%></th><th><% out.println(bean.getMobile());%></th><td><a href="LibEdit.jsp?id=<%= bean.getId() %>">Edit</a></td><td><a href="LibDelete?id=<%= bean.getId() %>">Delete</a></td></tr>
	
			<% } %>
			
		</table>
		</div>
		<%

	}
else{
	//out.println("Please Loggin First");
	response.sendRedirect("AdminLogin.html");
}	
		%>

</body>
</html>