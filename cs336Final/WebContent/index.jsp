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
		<h2>CollegeSearch:</h2>
		<h4>CS336 Final Project on College Costs</h4>
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
<div class="form-group">
	<form action="analytics.jsp">
	    <button type="submit" class="btn btn-warning">View Analytics</button>
	</form>
</div>
<div>
<br>
<h4>Rate this site's helpfulness:</h4>
	<form method="post" action="submitReview.jsp">
	<div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" name="name" id="name">
    </div>
    <div class="form-group">
      <label for="score">Score:</label>
        <select class="form-control" name="score" id="score">
		    <option value="5">5</option>
		    <option value="4">4</option>
		    <option value="3">3</option>
		    <option value="2">2</option>
		    <option value="1">1</option>
		  </select>
    </div>
    <div class="form-group">
      <label for="comment">Comment(150 Char Max):</label>
      <textarea class="form-control" rows="3" name="comment" id="comment"></textarea>
    </div>
	<button type="submit" class="btn btn-primary">Submit Review</button>
	</form>
	<form action="viewReviews.jsp">
		<button type="submit" class="btn btn-success">View All Reviews</button>
	</form>
</div>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>