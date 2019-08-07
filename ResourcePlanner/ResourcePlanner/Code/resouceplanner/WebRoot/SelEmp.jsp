
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
	String ID = request.getParameter("ID");
	String Count = request.getParameter("Count");
%>
<HEAD>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Kalyan">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<LINK href="styles.css" type="text/css" rel="stylesheet">

<title>Available Employees</title>
<center>
<h2>Available Employees</h2>
<center>
<SCRIPT LANGUAGE="JavaScript">

<!--
var i=0;
var max = window.opener.document.AllocateForm.NumOfFields.value;

function sendInfo(txtVal){
		var ID = "<%=ID%>";
		var Cnt = "<%=Count%>";
		var txt = window.opener.document.getElementsByName(ID);
		txt[Cnt].value = txtVal;
		window.close();
}

//-->
</SCRIPT>
</HEAD>


<BODY  class="SC">
<form name="EmpForm" action="">
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String filedata="";
String filestr="";
File file=null;
FileWriter fr=null;

String EmpName,EmpMailId;
int EmpNo;
%>
<br>
	<table class=notepad width='60%' align=center>
		<tr class=row_title>
		<th>Emp Name</th>
		<th>Emp NO</th>
		<th>Mail ID</th>
		</tr>
<%
try
{

	con=com.pms.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "SELECT EmpNo, EmpName, mailId  from employees where projectcode = 'NA' " ;
	rs = stmt.executeQuery(Query);
	while(rs.next())
	{
	  EmpNo=rs.getInt(1);
	  EmpName=rs.getString(2);
	  EmpMailId=rs.getString(3);
		%>
		<tr class=row_odd>
			<td><%=EmpName%></td>
			<td><a id="x" href="#" onClick="sendInfo(<%=EmpNo%>)"><%=EmpNo%>  </a></td>
		  	<td><%=EmpMailId%></td>
		</tr>
		<%
	}
			rs.close();
con.close();}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}

%>


</table>
<P align=center><a id="x" href="" onclick="window.close()">Close</a></P>

</form>
</BODY>
</HTML>

