<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>Tokyo Manji</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-md navbar-dark" style="background-color: grey">
				<div class="navbar-brand">
					Member Management Page
				</div>
				<ul class="navbar-nav">
					<li>
						<a href="<%=request.getContextPath()%>/ActionServlet" class="nav-link"> Back to Main Page</a>
					</li>
				</ul>
			</nav>
		</header>
		<br>
		<div class="container col-md-5">
			<div class="card">
				<div class="card-body">
					<c:if test="${member.name != null}">
						<form action="update" method="post">
					</c:if>
					<c:if test="${member.name == null}">
						<form action="add" method="post">
					</c:if>
							<caption>
								<h2>
									<c:if test="${member != null}"> Edit Member </c:if>
									<c:if test="${member == null}"> Add Member </c:if>
								</h2>
							</caption>
							<c:if test="${member != null}">
								<input type="hidden" name="oriMemberName" value="<c:out value='${member.name}' />" />
							</c:if>
							<fieldset class="form-group">
								<label>Selected Member's Name</label> 
								<input type="text" value="<c:out value='${member.name}' />" class="form-control" name="name" required="required">
							</fieldset>
							<fieldset class="form-group">
								<label>Selected Member's Ranking</label><br>
								<p class="text-muted">Current Rank : <c:out value='${member.rank}' /></p>
								<select id="rank" name="rank">
									<option class="form-control" value="Commander">Commander</option>
								  	<option class="form-control" value="Vice-Commander">Vice-Commander</option>
								  	
								    <option class="form-control" value="1st Division Captain">1st Division Captain</option>
								    <option class="form-control" value="1st Division Vice Captain">1st Division Vice Captain</option>
								    <option class="form-control" value="1st Division Member">1st Division Member</option>
								    
								    <option class="form-control" value="2nd Division Captain">2nd Division Captain</option>
								    <option class="form-control" value="2nd Division Vice Captain">2nd Division Vice Captain</option>
								    <option class="form-control" value="2nd Division Member">2nd Division Member</option>
								    
								    <option class="form-control" value="3rd Division Captain">3rd Division Captain</option>
								    <option class="form-control" value="3rd Division Vice Captain">3rd Division Vice Captain</option>
								    <option class="form-control" value="3rd Division Member">3rd Division Member</option>
								    
								    <option class="form-control" value="4th Division Captain">4th Division Captain</option>
								    <option class="form-control" value="4th Division Vice Captain">4th Division Vice Captain</option>
								    <option class="form-control" value="4th Division Member">4th Division Member</option>
								    
								    <option class="form-control" value="5th Division Captain">5th Division Captain</option>
								    <option class="form-control" value="5th Division Vice Captain">5th Division Vice Captain</option>
								    <option class="form-control" value="5th Division Member">5th Division Member</option>
								    
								    <option class="form-control" value="6th Division Captain">6th Division Captain</option>
								    <option class="form-control" value="6th Division Vice Captain">6th Division Vice Captain</option>
								    <option class="form-control" value="6th Division Member">6th Division Member</option>
								  </select>
									<%-- <input type="text" value="<c:out value='${member.rank}' />" class="form-control" name="rank"> --%>
									
								<label>Has Tattoo:</label><br/>
								  <select id="tattoo" name="tattoo">
								  	<option class="form-control" value="Yes">Yes</option>
								  	<option class="form-control" value="No">No</option>
								  </select>
								
							</fieldset>
							<br/><button type="submit" class="btn btn-light" data-mdb-ripple-color="dark">Save</button>
						</form>
				</div>
			</div>
		</div>
	</body>
</html>