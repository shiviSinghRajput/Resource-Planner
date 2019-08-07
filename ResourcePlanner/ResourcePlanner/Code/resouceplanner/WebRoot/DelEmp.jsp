<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="">
		function doAction(s)
		{
		
				if(s.value!=""){
					URL="DelEmployee.jsp?EmpNo="+s.value;
					document.DelEmp.action=URL;
					document.DelEmp.submit();
				}
				else{
					alert("Select Employee number to proceed");
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
if(auth!=1){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
<h2 align=center>Delete Employee</h2>
<h3 align=center>Select Employee number to delete</h3>
<FORM Name="DelEmp" ACTION="">
<Table align=center border=0>
<TR class="Row_Odd">
<TH>Employee Number</TH>
<TD><SELECT NAME="EmpNo" onchange="doAction(this)">
		<OPTION VALUE="">Emp No</OPTION>
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String EmpNo="";
	int NumRows=0;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Select EmpNo from employees";
			rs = stmt.executeQuery(Query);
			while( rs.next())	{
				EmpNo = rs.getString(1);
				NumRows++;
				%>
						<OPTION VALUE="<%=EmpNo%>"><%=EmpNo%></OPTION>
				<%
			}

		con.close();}catch(Exception e){%><%=e%><%}
		
%>
</SELECT></TD>
</TR>
</TABLE>
<%
			if(NumRows==0){
					%><h3 align=center>No Employees to delete</h3><% 
			}
%>
</FORM>
</BODY>

<%
  }
  %>

