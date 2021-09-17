<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tokyo Manji</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark" style="background-color: #c5aa6a">
		<div class="navbar-brand">
			Add Member
		</div>
	</nav>
	<br/>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form action="addServlet" method="post">
					<fieldset class="form-group">
						<label>Member Name:</label><br/>
						<input type="text" name="name"/><br/><br/>
			
						<label>Member Rank:</label><br/>
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
						  
						 <label>Has Tattoo:</label><br/>
						  <select id="tattoo" name="tattoo">
						  	<option class="form-control" value="Yes">Yes</option>
						  	<option class="form-control" value="No">No</option>
						  </select>
						 						
 						<br/><br/><input type="submit" value="Submit"/>
 					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>