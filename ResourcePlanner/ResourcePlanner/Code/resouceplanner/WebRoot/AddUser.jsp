<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);
function validate(){
 x = document.NewUser.uid;
 y = document.NewUser.pwd;
 z = document.NewUser.auth;
 var ed=x.value;
 var pd=y.value;
 var ad=z.value;
 var pattern = /^([a-zA-Z0-9\_\. ]{4,8})$/;
 var Apattern = /^([0-2]{1})$/;
 if(!(pattern.test(ed))){
	alert("Invalid username");
    return false;
	}
 else if(!(pattern.test(pd))){
	alert("Invalid password");
    return false;
	}
 else if(!(Apattern.test(ad))){
	alert("Invalid Authentication");
	return false;
  }
 else
   return true;

}
//-->
</SCRIPT>
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

<BR><BR><br><br>
<FONT FACE="Century Gothic">



<FONT size="2" color="blue" FACE="Century Gothic">

<FORM NAME="NewUser" ACTION="AddNewUser.jsp" METHOD="POST" onsubmit="return validate()">


<TABLE Border=0 align=center>
<TR class=row_title ALIGN="center">
	   <TH COLSPAN="2"> Add user</TH>
</TR>

<TR class=row_even>
	<TD>Userid * </TD>
	<TD><input TYPE=text name=uid size="8" maxlength="20"></TD>
</TR>
<TR class=row_odd>
	<TD>Password * </TD>
	<TD><input TYPE=password name=pwd size="8"  maxlength="10"></TD>
</TR>
<TR class=row_even>
	<TD>Authentication * </TD>
	<TD><select name=auth>
			<option value=0>Admin</option>
			<option value=1>HRD</option>
			<option value=2>Project Manager</option>
		</select>
	<!--<input TYPE=text name=auth size="1"  maxlength="1"> (0-admin,1-normal User)--></TD>
</TR>
<TR class=row_odd>
	<TD><INPUT TYPE=submit name=submit value="Submit">
</TD>
	<TD><INPUT TYPE=reset name=resett value="Reset" > 
</TD>
</TR>
</TABLE>


</FORM>
</BODY>
</HTML>


<%
  }
  %>


