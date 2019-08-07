<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
		<script LANGUAGE="Javascript" SRC="">
		function validate()
		{
			var frm = document.AddProj;
		    if(ChkMandatoryField(frm.ProjectCode,'Project Code')==false) return false;
			if(ChkMandatoryField(frm.Role,'Role')==false) return false;
			if(ChkMandatoryField(frm.Role,'Role')==false) return false;
			if(ChkNameField(frm.Location,'Location')==false) return false;
			if(ChkMandatoryField(frm.Skill,'Skill')==false) return false;
			if(ChkNameField(frm.Skill,'Skill')==false) return false;
			if(ChkMandatoryField(frm.NoEmpOnsite,'Onsite Requirement')==false) return false;
			if(ChkNumField(frm.NoEmpOnsite,'Onsite Requirement')==false) return false;
			if(ChkMandatoryField(frm.NoEmpOffshore,'Offshore Requirement')==false) return false;
			if(ChkNumField(frm.NoEmpOffshore,'Offshore Requirement')==false) return false;
		}
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function ChkNameField(F,T){
			var val = F.value;
			var Npattern = /^([a-zA-Z\_\. ]{1,25})$/;

			if(Npattern.test(val)) 
			return true
				{alert("Please enter valid name for "+T);
			 	return false;}
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
<h2 align=center>Add new Requirement</h2>
<FORM Name="AddProj" ACTION="AddRequirement.jsp" onsubmit="return validate()">
	<TABLE align=center>
	<TR class=row_odd>

		<TD>Project Code <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="ProjectCode" readonly><input type="button" class="button" value="..." onclick="fnEmpPopUp('ListProjects.jsp',300,300)" alt="select projects" ></TD>
	</TR>
	<TR>
		<TD>Role <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Role"></TD>
	</TR>
	<TR class=row_odd>
		<TD>Location <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Location"></TD>
	</TR>
	<TR>
		<TD>Skill <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Skill"></TD>
	</TR>
	<TR class=row_odd>
		<TD>Onsite Requirement <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="NoEmpOnsite" ></TD>
	</TR>
	<TR>
		<TD>Offshore Requirement <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="NoEmpOffshore"></TD>
	</TR>
	<TR class=row_odd>
		<TH><INPUT TYPE="submit" class="button" value="Submit"></TH>
		<TH><INPUT TYPE="reset"  class="button" NAME="Clear"></TH>
	</TR>

</TABLE>
</FORM>
</BODY>

<%
  }
  %>

