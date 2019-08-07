<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<script LANGUAGE="Javascript" SRC="">
		function validate()
		{
			var frm = document.AddProj;
		    if(ChkMandatoryField(frm.ProjectCode,'Project Code')==false) return false;
			if(ChkMandatoryField(frm.ProjectManager,'Project Manager')==false) return false;
			if(ChkNameField(frm.ProjectManager,'Project Manager')==false) return false;
			if(ChkMandatoryField(frm.OnsiteManager,'Onsite Manager')==false) return false;
			if(ChkNameField(frm.OnsiteManager,'Onsite Manager')==false) return false;
			if(ChkMandatoryField(frm.ClientName,'Client Name')==false) return false;
			if(ChkNameField(frm.ClientName,'Client Name')==false) return false;
			if(ChkMandatoryField(frm.ClientLocation,'Client Location')==false) return false;
			if(ChkNameField(frm.ClientLocation,'Client Location')==false) return false;
			if(ChkMandatoryField(frm.DealCost,'Deal Cost')==false) return false;
			if(ChkNumField(frm.DealCost,'Deal Cost')==false) return false;
			if(ChkMandatoryField(frm.DealDate,'Deal Date')==false) return false;
			if(ChkMandatoryField(frm.StartDate,'Start Date')==false) return false;
			if(ChkMandatoryField(frm.Duration,'Duration')==false) return false;
			if(ChkNumField(frm.Duration,'Duration')==false) return false;

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
			var Npattern = /^([a-zA-Z\_\. ]{1,20})$/;

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
<h2 align=center>Add new Project</h2>
<FORM Name="AddProj" ACTION="AddProject.jsp" onsubmit="return validate()">

	<TABLE align=center>
	<TR class=row_odd>

		<TD>Project Code <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="ProjectCode"></TD>
	</TR>
	<TR>
		<TD>Project Manager <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="ProjectManager"></TD>
	</TR>
	<TR class=row_odd>
		<TD>Onsite Manager <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="OnsiteManager"></TD>
	</TR>
	<TR>
		<TD>ClientName <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="ClientName"></TD>
	</TR>
	<TR class=row_odd>
		<TD>Client Location <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="ClientLocation" ></TD>
	</TR>
	<TR>
		<TD>Deal Cost </TD>
		<TD><INPUT TYPE="text" NAME="DealCost"> in US Dollors</TD>
	</TR>
	<TR class=row_odd>
		<TD>Deal Date <FONT COLOR="red">*</FONT></TD>
		<TD><Input type="text" name='DealDate' value='' readonly>
		<img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
	</TR>

	<TR>
		<TD>Start Date <FONT COLOR="red">*</FONT></TD>
		<TD><Input type="text" name='StartDate' value='' readonly>
		<img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
	</TR>
	<TR class=row_odd>
		<TD>Duration <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Duration"> in weeks</TD>
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

