<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC=""></script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<BODY class=SC>
<h2 align=center>Add new Project</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String ProjectCode = request.getParameter("ProjectCode");	String ProjectManager = request.getParameter("ProjectManager");	String OnsiteManager = request.getParameter("OnsiteManager");	String ClientName = request.getParameter("ClientName");	String ClientLocation = request.getParameter("ClientLocation");	String DealCost = request.getParameter("DealCost");	String DealDate = request.getParameter("DealDate");	String StartDate = request.getParameter("StartDate");	String Duration = request.getParameter("Duration");	
	try{
			
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into projects values('"+ProjectCode+"','"+ProjectManager+"','"+OnsiteManager+"','"+ClientName+"','"+ClientLocation+"',"+DealCost+",'"+DealDate+"','"+StartDate+"',"+Duration+")";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
					%>
					<h3 align=center>Inserted into database sucessfully</h3>
					<P align=center><A HREF="AddProj0.jsp">Add another</A></P>
					<%
			}
			else{
					%>
					<h3 align=center>Error in addition..please try again</h3>
					<P align=center><A HREF="AddProj0.jsp">Try again</A></P>					
					<% 
			}
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


