<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
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
	<%
	try {

		//Create a connection string
		String url = "jdbc:mysql://cs336project.cfvtshahrvco.us-east-1.rds.amazonaws.com:3306/CollegeCosts";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");

		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "admin", "adminadmin");

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String showResults = "Select * FROM siteReviews";
		ResultSet result = stmt.executeQuery(showResults);

		//Make an HTML table to show the results in:
		out.print("<table class=\"table table-striped table-bordered\">");
		out.print("<thead>");
		out.print("<tr>");
			out.print("<th>");
				out.print("Name");
			out.print("</th>");
			out.print("<th>");
				out.print("Score");
			out.print("</th>");
			out.print("<th>");
				out.print("Comment");
			out.print("</th>");
		out.print("</tr>");
		out.print("</thead>");
		//parse out the results
		while (result.next()) {
			out.print("<tr>");
			out.print("<td>");
				out.print(result.getString("Name"));
			out.print("</td>");
			out.print("<td>");
				out.print(result.getString("Score"));
			out.print("</td>");
			out.print("<td>");
				out.print(result.getString("Comment"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	} catch (Exception ex) {
	}
%>
<script src="<c:url value="bootstrap/js/bootstrap.min.js"/>"></script>
</body>
</html>