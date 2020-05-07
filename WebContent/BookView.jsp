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
	 background-image:url("C:/Users/Asus/eclipse-workspace/E-Lib-By-Sandeep/WebContent/images/5.jpg");
		 background-size:cover;
}
</style>
<script type="text/javascript">

	
		$(function(){
			$(".including").load("LibrarianNavBar.html");

		});
	
	
</script>	
	 <div class="including"> </div>
	<h3 align="center">Book Details</h3>
	<%@page 
	import ="com.sandeep.DAOs.*,com.sandeep.Bean.*,java.util.*" %>
	
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	if(session.getAttribute("id") != null){	
	List<BookBean> list = BookDAO.View();
	%>
	
	<table align="center" class='table table-bordered table-striped'>
		<tr><th>Call No</th><th>Name</th><th>Author</th><th>Publisher</th><th>Quantity</th><th>Issued</th><th>Delete</th></tr>
		<%
		for(BookBean bean :list){	%>
			<tr><th><%=bean.getCall()  %></th><th><%=bean.getName()  %></th><th><%=bean.getAuthor()  %></th><th><%=bean.getPublisher()  %></th><th><%=bean.getQuantity()  %></th><th><%=bean.getIssued()  %></th><th><a href="BookDelete?CallNo=<%= bean.getCall() %>">Delete</a></th></tr>

				<% } //we have  href="BookDelete?CallNo=<%= bean.getCall() this to delete and for this it call a servlet BookDelete which call db to delete
				%>
	</table>
	<% }
				
		else{
		//out.println("Please Loggin First");
		response.sendRedirect("LibrarianLogin.html");
	}
		
		%>
		</body>
</html>