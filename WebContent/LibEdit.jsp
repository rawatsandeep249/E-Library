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
<%@page
	import="com.sandeep.Bean.*,com.sandeep.DAOs.*"
 %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

session=request.getSession(false);//get the session if the session is not there then do not create it(false attribute workking here)
	if(session.getAttribute("id") != null){
		int Id=Integer.parseInt(request.getParameter("id"));
		LibrarianBean bean = AdminDAO.viewById(Id);
	
		%>
			 <div class="including"> </div>
		
		<h3 align="center">UPDATE INFORMATION</h3>
		<form action="LibEdit2.jsp" method="post" style ="width:300px">
			 <input type="hidden" name="currentId" value="<%=bean.getId() %>" id="Id">	
		<label for="Name">Name</label>
			 <input type="text" class="form-control" name="Name" value="<%=bean.getName() %>" id="name" placeholder="Name"/><br>
		<label for="Email">Email</label>
		 	 <input type="email" class="form-control" name="Email" value="<%=bean.getEmail() %>"  id="email1" placeholder="Email"/><br>
		<label for="Password">Password</label>
		 <input type="Password" class="form-control" name="Password" value="<%= bean.getPassword()%>"  id="Password" placeholder="Password"/><br>
		<label for="Mobile">Mobile</label>
		   <input type="number" class="form-control" name="Mobile" value="<%=bean.getMobile() %>"  id="Mobile" placeholder="Mobile"/><br>
		 <br>
	 	 <button type="submit" class="btn btn-primary">Add</button>

			</form>	
	<%
	}
	else{
		//out.println("Please Loggin First");
		response.sendRedirect("AdminLogin.html");
	}

	
	%>
</body>
</html>