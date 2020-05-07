<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
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

	<%@page 
	import ="com.sandeep.DAOs.*,com.sandeep.Bean.*,java.util.*" %>
	
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	if(session.getAttribute("id") != null){	
	List<IssueBookBean> list = BookDAO.ViewIssuedBooks();
	%>
	<table align="center" class='table table-bordered table-striped'>
		<tr><th>Call No</th><th>Student ID</th><th>Student Name</th><th>Student Mobile</th><th>Issue Date</th><th>Return Status</th></tr>
		<%
		for(IssueBookBean bean :list){	%>
			<tr><th><%=bean.getCallno()  %></th><th><%=bean.getStudentid()  %></th><th><%=bean.getStudentname()  %></th><th><%=bean.getStudentmobile()  %></th><th><%=bean.getIssueddate()  %></th><th><%=bean.getReturnstatus()  %></th></tr>

				<% } 		%>
				
	</table>
	
	<% }
				
		else{
		//out.println("Please Loggin First");
		response.sendRedirect("LibrarianLogin.html");
	}
		
		%>
</body>
</html>