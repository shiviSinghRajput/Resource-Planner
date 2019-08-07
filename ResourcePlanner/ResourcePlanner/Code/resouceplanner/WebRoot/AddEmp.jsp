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
			var frm = document.AddEmp;
		    if(ChkNumField(frm.EmpNo,'Employee Number')==false) return false;
			if(ChkMandatoryField(frm.EmpName,'Employee Name')==false) return false;
			if(ChkNameField(frm.EmpName,'Employee Name')==false) return false;
			if(ChkMandatoryField(frm.mailId,'Email Id')==false) return false;
			if(ChkEmailField(frm.mailId,'Email Id')==false) return false;
			if(ChkMandatoryField(frm.Location,'Location')==false) return false;
			if(ChkNameField(frm.Location,'Location')==false) return false;
			if(ChkMandatoryField(frm.Role,'Role')==false) return false;
			if(ChkNameField(frm.Role,'Role')==false) return false;
			if(ChkMandatoryField(frm.Skill,'Skills')==false) return false;
			if(ChkNameField(frm.Skill,'Skills')==false) return false;
			if(ChkMandatoryField(frm.JoiningDate,'JoiningDate')==false) return false;
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
		function ChkEmailField(F,T){
				 		
	  			var val=F.value;
				var pattern = /^[a-zA-Z0-9\_\.]+\@[a-zA-Z\.]+\.([a-z]{2,4})$/;
				if(!(pattern.test(val))) {
				alert("Please enter valid Email ID");
				return false;
			}
			else 
				return true;
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
<h2 align=center>Add new employee</h2>
<FORM Name="AddEmp" ACTION="AddEmployee.jsp" onsubmit="return validate()">
	<TABLE align=center>
	<TR class=row_odd>
		<TD>Employee Number <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="EmpNo"></TD>
	</TR>
	<TR>
		<TD>Name <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="EmpName"></TD>
	</TR>
	<TR class=row_odd>
		<TD>Email id <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="mailId"></TD>
	</TR>
	<TR>
		<TD>Current Location <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Location"></TD>
	</TR>
	<TR class=row_odd>
		<TD>Project Code</TD>
		<TD><INPUT TYPE="text" NAME="ProjectCode" Value="NA"></TD>
	</TR>
	<TR>
		<TD>Role <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Role"></TD>
	</TR>
	<TR class=row_odd>
		<TD>Skills <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Skill"></TD>
	</TR>
	<TR>
		<TD>Visa</TD>
		<TD><INPUT TYPE="text" NAME="Visa" Value="NA"></TD>
	</TR>
	<TR class=row_odd>
		<TD>Passport number</TD>
		<TD><INPUT TYPE="text" NAME="PassportNo" Value="NA"></TD>
	</TR>
	
	<TR>
		<TD>JoiningDate<FONT COLOR="red">*</FONT></TD>
		<TD><Input type="text" name='JoiningDate' value='' readonly>
		<img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
	<TR class=row_odd>
		<TH><INPUT TYPE="submit" class="button" value="Submit"></TH>
		<TH><INPUT TYPE="reset" class="button" NAME="Clear"></TH>
	</TR>

</TABLE>
</FORM>
</BODY>

<%
  }
  %>
