<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choosing the Right College For You</title>
</head>
<body>
<% out.println("CS336 Project on College Costs"); %> <!-- output the same thing, but using 
                                      jsp programming -->									  
<br>
<form action="schools.jsp">
    <input type="submit" value="Search for Schools" />
</form>
<br>
<form action="athletics.jsp">
    <input type="submit" value="Search for Athletic Programs" />
</form>
<br>
<form action="jobs.jsp">
    <input type="submit" value="View Job Outlook Info" />
</form>

</body>
</html>