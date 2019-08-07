<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@page contentType="application/vnd.ms-excel"%>
<%response.setHeader("Content-Disposition","attachment;filename=Report.xls");%>

<HEAD>

<Style>
	.row_title {
		FONT-SIZE: 8pt; BACKGROUND-COLOR: #999966 ;FONT-WEIGHT: bold; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
	.row_odd {
		FONT-SIZE: 8pt; BACKGROUND-COLOR: #c8c8c8 ;FONT-WEIGHT: normal; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
	.row_even {
		FONT-SIZE: 8pt; BACKGROUND-COLOR: #E8E8E8 ;FONT-WEIGHT: normal; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
	TABLE.notebook {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; WIDTH: 90%; BORDER-BOTTOM: 0px
	}
	Body.SC {
     scrollbar-arrow-color:#00000;
     scrollbar-base-color:#c8c8c8;
     scrollbar-face-color:#e8e8e8;
     scrollbar-darkshadow-color:#b8b8b8;
	 BACKGROUND-COLOR: #E8E8E8
	 FONT-WEIGHT: normal; FONT-SIZE: 10pt; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
</Style>

</HEAD>
<BODY class=SC>
<h2>Project Allocation</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from availability order by projectcode";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width='60%' align=center border=1>
							<tr class=row_title>
							<th class=row_title>ProjectCode</th>
							<th class=row_title>Requirement ID</th>
							<th class=row_title>Role</th><th class=row_title>Location</th><th class=row_title>Skill</th><th class=row_title>NoEmpOnsite</th><th class=row_title>NoEmpOffshore</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td>
					</tr>
					<%
				rCount++;
			}
			%></table><%if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


