<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member Management</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a href="#" class="navbar-brand">Tokyo Manji</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse8">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
</header>
 <br>
 <div class="row">
 <div class="container">
 <h3 class="text-center">Tokyo Manji</h3>
 <hr>
 <div class="container text-left">
 <a href="<%=request.getContextPath()%>/addMember.jsp" class="btn btn-outline-primary">Add Member</a>
 </div>
 <br>
 <table class="table table-bordered">
 <thead>
 <tr>
 	<th>Member Name</th>
 	<th>Rank</th>
 	<th>Action</th>
 </tr>
 </thead>
 <tbody><!-- for (Todo todo: todos) { -->
 <c:forEach var="members" items="${listMembers}">
	 <script>
	 	console.log("${members.name}");
	 </script>
	 <tr>
	 	<td>
	 		<c:out value="${members.name}" />
	 	</td>
	 	<td>
	 		<c:out value="${members.rank}" />
	 	</td>
	 	<td>
	 		<a href="ActionServlet/edit?name=<c:out value='${members.name}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; 
	 		<a href="ActionServlet/delete?name=<c:out value='${members.name}' />">Delete</a>
 		</td>
	 </tr>
 </c:forEach>
 <!-- } -->
 </tbody>
 </table>
 </div>
 </div>
</body>
</html>