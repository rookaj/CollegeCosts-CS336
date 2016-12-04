<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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

		String name = request.getParameter("name");
		int score = Integer.parseInt(request.getParameter("score"));
		String comment = request.getParameter("comment");

		//Make an insert statement for the Sells table:3
		String insert = "INSERT INTO siteReviews(Name, Score, Comment)"
				+ "VALUES (";
		String items = "\"" + name + "\", " + score + ", \"" + comment + "\");";
		
		insert = insert + items;
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		//Run the query against the DB
		int up = stmt.executeUpdate(insert);

		String showResults = "Select * FROM siteReviews";
		ResultSet result = stmt.executeQuery(showResults);

		out.print("Reviews: <br><br>");
		
		//Make an HTML table to show the results in:
		out.print("<table>");
		out.print("<tr>");
			out.print("<td>");
				out.print("Name");
			out.print("</td>");
			out.print("<td>");
				out.print("Score");
			out.print("</td>");
			out.print("<td>");
				out.print("Comment");
			out.print("</td>");
		out.print("</tr>");

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
		out.print("Insert Failed");
	}
%>
</body>
</html>