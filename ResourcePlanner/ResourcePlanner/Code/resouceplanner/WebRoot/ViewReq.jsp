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
if(auth!=2){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
<center>
<h2>Project Requirement</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from Requirement order by projectcode";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width='60%' align=center>
							<tr class=row_title>
							<th class=row_title>ProjectCode</th>
							<th class=row_title>Requirement ID</th>			
							<th class=row_title>Role</th>
							<th class=row_title>Location</th>
							<th class=row_title>Skill</th>
							<th class=row_title>NoEmpOnsite</th>
							<th class=row_title>NoEmpOffshore</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td align=center><%=rs.getString(1)%></td>
						<td align=center><%=rs.getString(7)%></td>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><%=rs.getString(3)%></td>
						<td align=center><%=rs.getString(4)%></td>
						<td align=center><%=rs.getString(5)%></td>
						<td align=center><%=rs.getString(6)%></td>
					</tr>
					<%
				rCount++;
			}
			%></table><%if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
			else{%>
				<CENTER><INPUT TYPE="Button" Value="Download to Excel" onclick="location.replace('ViewReqExcel.jsp')"></CENTER>
			<%}
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</center>
</BODY>

<%
  }
  %>

