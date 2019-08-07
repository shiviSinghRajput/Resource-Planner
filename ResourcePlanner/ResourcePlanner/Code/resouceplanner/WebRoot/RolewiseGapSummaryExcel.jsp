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
<center>
<h2>Role wise Gap summary</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select a.Role,sum(a.NoEmpOffshore),sum(b.NoEmpOffshore),sum(a.NoEmpOffshore - b.NoEmpOffshore) as OffshoreGap, sum(a.NoEmpOnsite), sum(b.NoEmpOnsite),sum(a.NoEmpOnsite - b.NoEmpOnsite) as OnsiteGap from requirement a, availability b where a.ProjectCode = b.ProjectCode and a.ReqID = b.ReqID group by a.Role";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width='60%' align=center border=1> 
							<tr class=row_title>
							<th class=row_title>Role</th>			
							<th class=row_title>Offshore Requirement</th>
							<th class=row_title>Offshore Availability</th>
							<th class=row_title>GAP</th>
							<th class=row_title>Onsite Requirement</th>
							<th class=row_title>Onsite Availability</th>
							<th class=row_title>GAP</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td align=center><B><%=rs.getString(1)%></B></td>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><%=rs.getString(3)%></td>
						<td align=center><FONT COLOR="#660066"><B><%=rs.getString(4)%></B></FONT></td>
						<td align=center><%=rs.getString(5)%></td>
						<td align=center><%=rs.getString(6)%></td>
						<td align=center><FONT COLOR="#660066"><B><%=rs.getString(7)%></B></FONT></td>
					</tr>
					<%
				rCount++;
			}
			%></table><%if( rCount == 0){%><h3 align=center>Sorry No records Found</h3><% }
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</center>
</BODY>


