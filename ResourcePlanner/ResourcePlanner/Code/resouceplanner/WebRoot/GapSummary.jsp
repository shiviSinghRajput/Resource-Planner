<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC=""></script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>



<BODY class=SC>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=1){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
<center>
<h2>Gap summary</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select a.ProjectCode,a.ReqID,a.NoEmpOffshore,b.NoEmpOffshore,a.NoEmpOffshore - b.NoEmpOffshore as OffshoreGap, a.NoEmpOnsite, b.NoEmpOnsite,a.NoEmpOnsite - b.NoEmpOnsite as OnsiteGap from requirement a, availability b where a.ProjectCode = b.ProjectCode and a.ReqID = b.ReqID";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width='60%' align=center>
							<tr class=row_title>
							<th class=row_title>ProjectCode</th>
							<th class=row_title>Requirement ID</th>			
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
						<td align=center><%=rs.getString(1)%></td>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><%=rs.getString(3)%></td>
						<td align=center><%=rs.getString(4)%></td>
						<td align=center><FONT COLOR="#660066"><B><%=rs.getString(5)%></B></FONT></td>
						<td align=center><%=rs.getString(6)%></td>
						<td align=center><%=rs.getString(7)%></td>
						<td align=center><FONT COLOR="#660066"><B><%=rs.getString(8)%></B></FONT></td>
					</tr>
					<%
				rCount++;
			}
			%></table><%if( rCount == 0){%><h3 align=center>Sorry No records Found</h3><% }
			else{%>
				<CENTER><INPUT TYPE="Button" Value="Download to Excel" onclick="location.replace('GapSummaryExcel.jsp')"></CENTER>
			<%}
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</center>
</BODY>

<%
  }
  %>

