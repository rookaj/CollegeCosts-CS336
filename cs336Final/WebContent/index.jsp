<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Choosing the Right College For You</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="page-header">
		<h2>CS336 Project on College Costs</h2>		
	</div>						  
<br>
<div class="form-group">
	<form action="schools.jsp">
	    <button type="submit" class="btn btn-primary">Search for Schools</button>
	</form>
</div>
<div class="form-group">
	<form action="athletics.jsp">
	    <button type="submit" class="btn btn-success">Search for Athletic Programs</button>
	</form>
</div>
<div class="form-group">
	<form action="jobs.jsp">
	    <button type="submit" class="btn btn-info">View Job Outlook Info</button>
	</form>
</div>
<div>
<br>
<h4>Rate this site's effectiveness:</h4>
	<form method="post" action="submitReview.jsp">
	<div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" name="name" id="name">
    </div>
    <div class="form-group">
      <label for="score">Score:</label>
        <select class="form-control" name="score" id="score">
		    <option value="1">1</option>
		    <option value="2">2</option>
		    <option value="3">3</option>
		    <option value="4">4</option>
		    <option value="5">5</option>
		  </select>
    </div>
    <div class="form-group">
      <label for="comment">Comment(150 Char Max):</label>
      <input type="text" class="form-control" name="comment" id="comment">
    </div>
	<button type="submit" class="btn btn-primary">Submit</button>
	</form>
	<form action="viewReviews.jsp">
		<button type="submit" class="btn btn-success">View All Reviews</button>
	</form>
</div>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>