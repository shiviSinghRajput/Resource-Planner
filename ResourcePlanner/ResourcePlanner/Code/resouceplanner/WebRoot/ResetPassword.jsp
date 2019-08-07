
<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<head>
<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>

<body Class=SC>
<center>

<BR><BR>
<FONT FACE="Century Gothic">

  

<% 
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String Userid,Password;
    Userid = request.getParameter("uid");

try
{

	con=com.pms.ConnectionPool.getConnection();
	stmt =  con.createStatement();

	String Query = "SELECT * from Login where Userid = \'"+Userid+"\' ";
	//System.out.println(Query);
	rs = stmt.executeQuery(Query);
		
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
/* If user provides valid username & password then update the new password to database*/
if(rs!=null)
{
String UpdateQuery = 
"Update Login set Password = \'"+Userid+"\' where Userid= \'"+Userid+"\'";
//System.out.println(UpdateQuery);
	int rowsAffected=stmt.executeUpdate(UpdateQuery);		
	//System.out.println("Rows Affected = " + rowsAffected);
if(rowsAffected==1)
	{%>
	
	<script>
		for(i=1;i<=10;i++) document.write("<br>");
	</script>
		<H3 align="center">Successfully updated database</H3>
	<BR>
	<center>
		<A href="ResetPassword1.jsp"> Back </A>
	</center>
	<%}
/* If user provides invalid password or username*/
else{%>
	<script>
		for(i=1;i<=6;i++) document.write("<br>");
	</script>
		<H3 align="center">UserName/Password Invalid Please Try again </H3>
	<BR>
	<center>
		<A href="ResetPassword1.jsp"> Back </A>
	</center>
<%
}
}
%>


<FONT size="2" color="blue" FACE="Century Gothic">

</BODY>
</HTML>




