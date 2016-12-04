<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>School Search Results</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Create a connection string
			String url = "jdbc:mysql://cs336project.cfvtshahrvco.us-east-1.rds.amazonaws.com:3306/CollegeCosts";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "admin", "adminadmin");

			//Create a SQL statement
			Statement stmt = con.createStatement();
			String item = request.getParameter("command");
			String str = "SELECT a.UNITID, a.School, a.State, a.ClassificationName, a.TotalUndergraduates, (a.UnduplicatedCountMensParticipation + a.UnduplicatedCountWomensParticipation) as totalStudAthletes, ((a.UnduplicatedCountMensParticipation + a.UnduplicatedCountWomensParticipation)/a.TotalUndergraduates) as percentStudAthletes, a.GrandTotalExpenses, a.GrandTotalRevenue, ((a.MensTeamAthleticStudentAid + a.WomensTeamAthleticStudentAid)/(a.UnduplicatedCountMensParticipation + a.UnduplicatedCountWomensParticipation)) as avgScholarship, s.TUITIONFEE_IN, s.TUITIONFEE_OUT FROM schoolData s, athleticprograms a WHERE s.UNITID = a.UNITID ORDER BY percentStudAthletes ";
			
			if(item.equals("highest")) {
				str = str + "DESC";
			} else if(item.equals("lowest")) {
				str = str + "ASC";
			}

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");
			out.print("<tr>");
				out.print("<td>");
					out.print("General Information Unit ID");
				out.print("</td>");
				out.print("<td>");
					out.print("Institution");
				out.print("</td>");
				out.print("<td>");
					out.print("State");
				out.print("</td>");
				out.print("<td>");
					out.print("Percentage of Student-Athletes");
				out.print("</td>");
				out.print("<td>");
					out.print("NCAA Division");
				out.print("</td>");
				out.print("<td>");
					out.print("Total Undergrads");
				out.print("</td>");
				out.print("<td>");
					out.print("Number of Student-Athletes");
				out.print("</td>");
				out.print("<td>");
					out.print("Athletic Expenses");
				out.print("</td>");
				out.print("<td>");
					out.print("Athletic Revenues");
				out.print("</td>");
				out.print("<td>");
					out.print("Average Scholarship per Athlete");
				out.print("</td>");
				out.print("<td>");
					out.print("In-State Tuition");
				out.print("</td>");
				out.print("<td>");
					out.print("Out-of-State Tuition");
				out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				out.print("<tr>");
				out.print("<td>");
					out.print(result.getString("a.UNITID"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("a.School"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("a.State"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("percentStudAthletes"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("a.ClassificationName"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("a.TotalUndergraduates"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("totalStudAthletes"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("a.GrandTotalExpenses"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("a.GrandTotalRevenue"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("avgScholarship"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.TUITIONFEE_IN"));
				out.print("</td>");
				out.print("<td>");
					out.print(result.getString("s.TUITIONFEE_OUT"));
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>