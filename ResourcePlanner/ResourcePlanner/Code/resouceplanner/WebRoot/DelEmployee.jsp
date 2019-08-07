<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<BODY class=SC>
<FORM Name="DelEmp" ACTION="">
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	int result=0;
	String EmpNo=request.getParameter("EmpNo");
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Delete from employees where EmpNo="+EmpNo;
			result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%>
				<h3 align=center>Successfully deleted employee record from database</h3>
				<P align=center><A HREF="DelEmp.jsp">Delete another record</A></P>
				<%
			}
			else{
				%>
				<h3 align=center>Error in deleting..please try again</h3>
				<P align=center><A HREF="DelEmp.jsp">Try again</A></P>
				<% 
			}

		con.close();}catch(Exception e){%><%=e%><%}
		
%>

</FORM>
</BODY>


