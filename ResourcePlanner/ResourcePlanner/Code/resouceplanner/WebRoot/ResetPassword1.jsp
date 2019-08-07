<HTML>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<BODY class=SC>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=0){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>
<center>

<BR><BR><br>
<FONT FACE="Century Gothic">



<FONT size="2" color="blue" FACE="Century Gothic">

<FORM NAME="LOGIN" ACTION="ResetPassword.jsp" METHOD="POST">


<TABLE Border=0 align=center>
<TR class=row_title ALIGN="center">
	   <TH COLSPAN="2"> Enter user id</TH>
</TR>

<TR class=row_even>
	<TD>Userid</TD>
	<TD><input TYPE=text name=uid size="8"></TD>
</TR>
<TR class=row_odd>
	<TD><INPUT  Type=submit class="Button"  name=submit value="Submit">
</TD>
	<TD><INPUT TYPE=reset name=resett value="Clear" class="Button"> 
</TD>
</TR>
</TABLE>


</FORM>
</BODY>
</HTML>

<%
  }
  %>



