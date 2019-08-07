<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC=""></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal)
{
		var txt = window.opener.document.forms(0).ProjectCode;
		txt.value = txtVal;
		window.close();
}

//-->
</SCRIPT>
</HEAD>
<BODY class=SC>
<h2></h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from Projects order by ProjectCode";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width='60%' align=center>
							<tr class=row_title>
							<th class=row_title>ProjectCode</th><th class=row_title>ProjectManager</th><th class=row_title>OnsiteManager</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					String ProjectCode = rs.getString(1);
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
					<td><a href="#" onclick="sendInfo('<%=ProjectCode%>')"><%=ProjectCode%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td>
					</tr>
					<%
				rCount++;
			}
			%></table><%if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


