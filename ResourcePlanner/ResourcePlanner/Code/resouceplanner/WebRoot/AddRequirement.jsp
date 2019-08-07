<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC=""></script>
</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<BODY class=SC>
<h2 align = center>Add new requirement</h2>

<%

	Connection con;
	ResultSet rs=null,rs1=null;
	Statement stmt=null,stmt1=null;
	String ProjectCode = request.getParameter("ProjectCode");	String Role = request.getParameter("Role");	String Location = request.getParameter("Location");	String Skill = request.getParameter("Skill");	String NoEmpOnsite = request.getParameter("NoEmpOnsite");	String NoEmpOffshore = request.getParameter("NoEmpOffshore");	
	int ReqID=1;
	try{
			
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			stmt1 = con.createStatement();
			String Query1 = "Select max(ReqID) from requirement where ProjectCode =\'"+ProjectCode+"\'";
			rs1 = stmt1.executeQuery(Query1);
			if(rs1==null){
				ReqID = 1;
			}
			else if(rs1.next()){
				ReqID = rs1.getInt(1);
				ReqID = ReqID+1;
			}
			else{
				ReqID = 1;
			}
			String Query = "Insert into requirement values('"+ProjectCode+"','"+Role+"','"+Location+"','"+Skill+"',"+NoEmpOnsite+","+NoEmpOffshore+","+ReqID+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				String QueryAvailability = "Insert into Availability values('"+ProjectCode+"','"+Role+"','"+Location+"','"+Skill+"',0,0,"+ReqID+")";
				int res = stmt.executeUpdate(QueryAvailability);
				if(res>0){
					%>
					<h3 align=center>Inserted into database sucessfully</h3>
					<P align=center><A HREF="AddReq.jsp">Add another</A></P>
					<%
				}
				else{
					%>
					<h3 align=center>Unknown Error..please try again</h3>
					<P align=center><A HREF="AddReq.jsp">Try again</A></P>						
					<% 
				}
			}
			else{
				%>
				<h3 align=center>Unknown Error..please try again</h3>
				<P align=center><A HREF="AddReq.jsp">Try again</A></P>						
				<% 
			}
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


