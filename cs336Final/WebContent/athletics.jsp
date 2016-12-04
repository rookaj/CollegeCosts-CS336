<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Athletic Program Info</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="page-header">
		<h2>Search For Collegiate Athletic Programs</h2>		
	</div>	

	<form method="get" action="sportSchoolSearch.jsp" enctype=text/plain>
	<div class="form-group">
		<label for="name">Search For Schools with Athletic Programs by Name:</label>
      	<input type="text" class="form-control" name="name" id="name">
      	<button type="submit" class="btn btn-primary">Search</button>
	</div>
	</form>
<br>
	<form method="get" action="sportIDSearch.jsp" enctype=text/plain>
	  <div class="form-group">
		<label for="id">Search For Schools with Athletic Programs by General Information Unit ID:</label>
      	<input type="text" class="form-control" name="id" id="id">
      	<button type="submit" class="btn btn-primary">Search</button>
	</div>
	</form>

<br>
	<form method="get" action="sportStateSearch.jsp" enctype=text/plain>
	<div class="form-group">
		<label for="state">Find Schools with Athletic Programs in Your State:</label>
		<select class="form-control" name="state" size="1">
			<option value="AL">Alabama</option>
			<option value="AK">Alaska</option>
			<option value="AZ">Arizona</option>
			<option value="AR">Arkansas</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="DC">Dist of Columbia</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NV">Nevada</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WA">Washington</option>
			<option value="WV">West Virginia</option>
			<option value="WI">Wisconsin</option>
			<option value="WY">Wyoming</option>
		</select>
		<button type="submit" class="btn btn-primary">Search</button>
	</div>
	</form>
</div>
<div class="container">
	<h5><b>Sort Schools by Percentage of Student-Athletes:</b></h5>
	<form method="get" action="studAthleteSearch.jsp" enctype=text/plain>
	<div class="form-group">
	<div class="radio">
	  <label><input type="radio" name="command" value="highest"/>Sort by Highest Percentage</label>
	</div>
	<div class="radio">  
	  <label><input type="radio" name="command" value="lowest"/>Sort by Lowest Percentage</label>
	</div>
	  <button type="submit" class="btn btn-primary">Search</button>
	</div>
	</form>
</div>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>