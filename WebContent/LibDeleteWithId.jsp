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
	 <div class="including"> </div>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	session=request.getSession(false);//get the session if the session is not there then do not create it(false attribute workking here)
	if(session.getAttribute("id") != null){
		%>
		<div align="center">
	<h3>DELETE THE LIBRARIAN</h3>	
	
		
<form action="LibDelete" method="get" style ="width:300px">
		<label for="id">Id</label>
 	    <input type="number" class="form-control" name="id" id="Id" placeholder="Id"/><br>

  <button type="submit" class="btn btn-primary">Delete</button>


	
</form>
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