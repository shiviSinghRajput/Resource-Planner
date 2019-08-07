<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="">
		function doAction(s)
		{
		
				if(s.value!=""){
					URL="DelProject.jsp?ProjectCode="+s.value;
					document.DelProj.action=URL;
					document.DelProj.submit();
				}
				else{
					alert("Select Project number to proceed");
				}
		}
	</script>
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
<h2 align=center>Delete Project</h2>
<h3 align=center>Select Project Code to delete</h3>
<FORM Name="DelProj" ACTION="">
<Table align=center border=0>
<TR class="Row_Odd">
<TH>Project Code</TH>
<TD><SELECT NAME="ProjectCode" onchange="doAction(this)">
		<OPTION VALUE="">Project Code</OPTION>
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String ProjectCode="";
	int NumRows=0;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Select ProjectCode from Projects";
			rs = stmt.executeQuery(Query);
			while( rs.next())	{
				ProjectCode = rs.getString(1);
				NumRows++;
				%>
						<OPTION VALUE="<%=ProjectCode%>"><%=ProjectCode%></OPTION>
				<%
			}

		con.close();}catch(Exception e){%><%=e%><%}
		
%>
</SELECT></TD>
</TR>
</TABLE>
<%
			if(NumRows==0){
					%><h3 align=center>No Projects to delete</h3><% 
			}
%>
</FORM>
</BODY>

<%
  }
  %>

