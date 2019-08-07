<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC=""></script>



</HEAD><jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<BODY class='SC'>
<center>
<h2>List of Employees</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from Employees order by Empno ";
			System.out.println(Query);
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width='60%' align=center align=center border=1>
							<tr class=row_title>
							<th class="row_title">EmpNo</th><th class="row_title">EmpName</th><th class="row_title">mailId</th><th class="row_title">Location</th><th class="row_title">ProjectCode</th><th class="row_title">Role</th><th class="row_title">Skill</th><th class="row_title">Visa</th><th class="row_title">PassportNo</th><th class="row_title">JoiningDate</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td align=center><%=rs.getString(1)%></td><td align=center><%=rs.getString(2)%></td><td align=center><%=rs.getString(3)%></td><td align=center><%=rs.getString(4)%></td><td align=center><%=rs.getString(5)%></td><td align=center><%=rs.getString(6)%></td><td align=center><%=rs.getString(7)%></td><td align=center><%=rs.getString(8)%></td><td align=center><%=rs.getString(9)%></td><td align=center><%=rs.getString(10)%></td>
					</tr>
					<%
				rCount++;
			}
			%></table><%if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
			else{%>
				<CENTER><INPUT TYPE="Button" Value="Download to Excel" onclick="location.replace('ViewEmpExcel.jsp')"></CENTER>
			<%}
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</center>
</BODY>
