<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Outlook Info</title>
</head>
<body>

<div>
	<% out.println("Display Average Wages per State: "); %>								  
	<br>
	<form action="stateWages.jsp" enctype=text/plain>
	  <input type="submit" value="Average Wages by State" />
	</form>
</div>
<br>
<div>
	<% out.println("Compare Average Wage to Average 10 year Post-Grad Wages: "); %>
	<br>
	<form method="get" action="jobWageCompare.jsp" enctype=text/plain>
	  <input type="radio" name="command" value="state"/>Sort by Highest State Averages
	  <br>
	  <input type="radio" name="command" value="school"/>Sort by Highest School Averages
	  <br>
	  <input type="submit" value="Search" />
	</form>
</div>

</body>
</html>