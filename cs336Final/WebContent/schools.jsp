<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>School Info</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">CollegeSearch</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Home</a></li>
      <li><a href="schools.jsp">Search Schools</a></li>
      <li><a href="athletics.jsp">Search Athletic Programs</a></li>
      <li><a href="jobs.jsp">Search Job Outlook</a></li>
      <li><a href="analytics.jsp">Analytics</a></li>
    </ul>
  </div>
</nav>
<div class="container">
	<div class="page-header">
		<h2>Search For Schools</h2>		
	</div>
</div>
<div class="container">
	<div class="panel panel-primary">
     <div class="panel-heading"><h4>Already Accepted to a School? Find Similar Ones:</h4></div>
     <div class="panel-body">	
	  <form method="get" action="similarSearch.jsp" enctype=text/plain>
	  <div class="form-group">
		<label for="name">Enter your school's General Information Unit ID to find similar schools(If you don't know it, Search by Name below to find it):</label>
      	<input type="text" class="form-control" name="id" id="id">
		<label for="similar">Find Schools With Similar:</label>
		<select class="form-control" name="similar" size="1">
			<option value="sat">SAT Scores</option>
			<option value="adm">Admission Rate</option>
			<option value="tuit">Tuition</option>
			<option value="num">Number of Students</option>
		</select>
		<button type="submit" class="btn btn-success">Search</button>
	 </div>
	 </form>
	</div>
    </div>
</div>
<div class="container">
	<form method="get" action="nameSearch.jsp" enctype=text/plain>
	<div class="form-group">
		<label for="name">Search For Schools By Name:</label>
      	<input type="text" class="form-control" name="name" id="name">
      	<button type="submit" class="btn btn-primary">Search</button>
	</div>
	</form>
<br>
	<form method="get" action="unitIDSearch.jsp" enctype=text/plain>
	<div class="form-group">
		<label for="id">Search For Schools By General Information Unit ID:</label>
      	<input type="text" class="form-control" name="id" id="id">
      	<button type="submit" class="btn btn-primary">Search</button>
	</div>
	</form>
<br>		  
	<form method="get" action="stateSearch.jsp" enctype=text/plain>
	<div class="form-group">
		<label for="state">Find Schools in Your State:</label>
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
	<h5><b>Show School Data for Schools:</b></h5>
	<form method="get" action="schoolHasSports.jsp" enctype=text/plain>
	<div class="form-group">
	<div class="radio">
	  <label><input type="radio" name="command" value="with"/>With NCAA Athletic Programs</label>
	</div>
	<div class="radio">  
	  <label><input type="radio" name="command" value="without"/>Without NCAA Athletic Programs</label>
	</div>
	  <button type="submit" class="btn btn-primary">Search</button>
	</div>
	</form>
</div>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>