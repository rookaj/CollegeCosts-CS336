<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analytics</title>
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
		<h2>Analytics</h2>
		<h4>Correlations are calculated using the <a href="https://en.wikipedia.org/wiki/Correlation_and_dependence">Pearson's Product-Moment Correlation Coefficient</a></h4>
		<img src="correlationFormula.PNG" alt="Pearson's Product-Moment Correlation Coefficient" style="width:400px;height:100px;">
	</div>
	<form method="get" action="schoolCorr.jsp" enctype=text/plain>
	<div class="form-group">
		<label for="query">Select a Query to View:</label>
		<select class="form-control" name="query" size="1">
			<option value="admRate_tuitFee">Is there a correlation between admission rate and tuition fee?</option>
			<option value="admRate_SATAvg">Is there a correlation between admission rate and SAT average?</option>
			<option value="tuitFee_SATAvg">Is there a correlation between tuition fee and SAT average?</option>
			<option value="pGradEarn_SATAvg">Is there a correlation between 10yr post-grad wages and SAT average?</option>
			<option value="gradDebt_tuitFee">Is there a correlation between average debt upon graduating and tuition fee?</option>
			<option value="SATAvg_pGradEarn">Is there a correlation between SAT average and 10yr post-grad wages?</option>
			<option value="tuitFee_pell">Is there a correlation between tuition fee and percent of students who receive Pell grants?</option>
			<option value="tuitFee_fLoan">Is there a correlation between tuition fee and percent of students who receive federal loans?</option>
		</select>
		<button type="submit" class="btn btn-primary">View</button>
	</div>
	</form>
</div>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>