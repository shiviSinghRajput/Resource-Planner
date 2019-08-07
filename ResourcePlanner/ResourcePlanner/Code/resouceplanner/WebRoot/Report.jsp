<!--
	File : Report.jsp
	Purpose : This jsp displays the home page containing link to change user's password
			
-->

<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
<Head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br><br><br><br><BR><BR><BR>
<body Class=SC>

<Title>Reports</Title>
<font face="Times New ROman" color=blue >
<center>




<!--Retreiving user id using Session-->

<% String Userid=(String)session.getAttribute("userr");%>

<h3 class=report align=left><FONT COLOR="#330000">Dear</FONT> <u><FONT  COLOR="#669933"><%=Userid%></FONT></u><FONT  COLOR="#330000">,<BR><BR> Please navigate through the menu or links provided</FONT></h3><br>



</center>
</font>
<p align="right">
<A href="ChangePassword1.jsp">Change Password </A><BR><BR>
</p>
</body>
</html>