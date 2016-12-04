<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Outlook Info</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="page-header">
		<h2>Job Outlook Info</h2>		
	</div>

	<form action="stateWages.jsp" enctype=text/plain>
	<div class="form-group">
		<button type="submit" class="btn btn-success">Display Average Wages by State</button>
	</div>
	</form>
<br>
	<h5><b>Compare Average Wage to Average 10 year Post-Grad Wages:</b></h5>
	<form method="get" action="jobWageCompare.jsp" enctype=text/plain>
		<div class="form-group">
		<div class="radio">
		  <label><input type="radio" name="command" value="state"/>Sort by Highest State Averages</label>
		</div>
		<div class="radio">  
		  <label><input type="radio" name="command" value="school"/>Sort by Highest School Averages</label>
		</div>
		  <button type="submit" class="btn btn-primary">Search</button>
		</div>
	</form>
<br>
	<form method="get" action="jobSchoolSearch.jsp" enctype=text/plain>
	<div class="form-group">
		<label for="name">Compare State Wages to a Specific School</label>
      	<input type="text" class="form-control" name="name" id="name">
      	<button type="submit" class="btn btn-primary">Search</button>
	</div>
	</form>
</div>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>