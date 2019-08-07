<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class=SC>
<h3 align=center>Employee Allocations</h3>
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String ProjectCode = request.getParameter("ProjectCode");
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select a.ReqID,a.EmpNo,b.EmpName from allocations a,Employees b where a.projectcode=\'"+ProjectCode+"\' and a.EmpNo = b.EmpNo";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width="60%" align=center>
							<tr class=row_title>
							<th class=row_title>ReqID</th><th class=row_title>Employee No</th><th class=row_title>Employee Name</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</table>
<P align=center><INPUT TYPE="button" onclick="window.close()" value="Close"></P>
</BODY>