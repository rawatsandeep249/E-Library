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
			$(".including").load("LibrarianNavBar.html");

		});
	
	
</script>	
	 <div class="including"> </div>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	if(session.getAttribute("id") != null){
		String user = (String)session.getAttribute("id"); //we change the attribute value to user 
%>
		<div align="center">
		<h3>Welcome <%= user %></h3>
		</div>		


	<%
	}
	else{ %>
 <script type="text/javascript">
				alert("Please Loggin First");
				</script>  
<%				response.sendRedirect("LibrarianLogin.html");
	}	%>
			

</body>
</html>