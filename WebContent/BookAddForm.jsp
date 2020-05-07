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
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	session=request.getSession(false);//get the session if the session is not there then do not create it(false attribute workking here)
	if(session.getAttribute("id") != null){%>
	<h3 align="center">ADD BOOK TO THE DATABASE </h3>	
	
		<div align="center">
<form action="BookAdd.jsp" method="post" style="width:300px">
	    <label for="Call">Call No</label>		
    <input type="text" class="form-control" name="Call" id="Call" placeholder="Call No"/><br>
 	    <label for="Name">Name</label>		
    <input type="text" class="form-control" name="Name" id="name" placeholder="Name"/><br>
  	    <label for="Author">Name</label>		
   <input type="text" class="form-control" name="Author" id="Author" placeholder="Author"/><br>
  	    <label for="Publisher">Publisher</label>		
    <input type="text" class="form-control" name="Publisher" id="Publisher" placeholder="Publisher"/><br>
  	    <label for="Quantity">Quantity</label>		
    <input type="number" class="form-control" name="Quantity" id="Quantity" placeholder="Quantity"/><br>

  <button type="submit" class="btn btn-primary">Add Book</button>

</form>
</div>
<%
	}
	else{
	//	out.println("Please Loggin First");
		response.sendRedirect("LibrarianLogin.html");
	}

%>



</body>
</html>