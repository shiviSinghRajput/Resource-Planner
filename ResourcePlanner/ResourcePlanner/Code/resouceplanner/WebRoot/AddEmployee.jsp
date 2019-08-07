<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC=""></script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<BODY class=SC>
<h2 align=center>Add new employee</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String EmpNo = request.getParameter("EmpNo");	
	String EmpName = request.getParameter("EmpName");	
	String mailId = request.getParameter("mailId");	
	String Location = request.getParameter("Location");	
	String ProjectCode = request.getParameter("ProjectCode");	
	String Role = request.getParameter("Role");	
	String Skill = request.getParameter("Skill");	
	String Visa = request.getParameter("Visa");	
	String PassportNo = request.getParameter("PassportNo");	
	String JoiningDate = request.getParameter("JoiningDate");	
	try{
			
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into employees values("+EmpNo+",'"+EmpName+"','"+mailId+"','"+Location+"','"+ProjectCode+"','"+Role+"','"+Skill+"','"+Visa+"','"+PassportNo+"',TO_DATE('"+JoiningDate+"','yyyy-mm-dd'))";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%>
					<h3 align=center>Inserted into database sucessfully</h3>
					<P align=center><A HREF="AddEmp.jsp">Add another record</A></P>
				<%
			}
			else{
					%>
					<h3 align=center>Error in updating..please try again</h3>
					<P align=center><A HREF="DelEmp.jsp">Try again</A></P>
					<% 
			}
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


