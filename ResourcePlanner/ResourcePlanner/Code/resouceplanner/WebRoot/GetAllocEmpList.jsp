<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY CLASS=SC>
<FORM NAME="SaveEmpForm">
	

<P align=center><B>Select Employee numbers to allocate</B></P>
	<%
		String ProjectCode = request.getParameter("ProjectCode");
		String Role = request.getParameter("Role");
		String ReqID = request.getParameter("ReqID");
		String Location = request.getParameter("Location");
		String Skill = request.getParameter("Skill");
		String onReq = request.getParameter("onReq");
		String offReq = request.getParameter("offReq");
		String SNoEmpOnsite = request.getParameter("NoEmpOnsite");
		String SNoEmpOffshore = request.getParameter("NoEmpOffshore");
		int NoEmpOnsite = Integer.parseInt(SNoEmpOnsite);
		int NoEmpOffshore = Integer.parseInt(SNoEmpOffshore);
	%>	
<INPUT TYPE="hidden" Id="ProjectCode" Value="<%=ProjectCode%>">
<INPUT TYPE="hidden" Id="Role" Value="<%=Role%>">
<INPUT TYPE="hidden" Id="ReqID" Value="<%=ReqID%>">
<INPUT TYPE="hidden" Id="Location" Value="<%=Location%>">
<INPUT TYPE="hidden" Id="Skill" Value="<%=Skill%>">
<INPUT TYPE="hidden" Id="onReq" Value="<%=onReq%>">
<INPUT TYPE="hidden" Id="offReq" Value="<%=offReq%>">
<INPUT TYPE="hidden" Id="NoEmpOnsite" Value="<%=SNoEmpOnsite%>">
<INPUT TYPE="hidden" Id="NoEmpOffshore" Value="<%=SNoEmpOffshore%>">

<TABLE class=notepad width="30%" ALIGN=CENTER>
<%if(NoEmpOnsite!=0){%>
	<TR>
	<TD colspan=2 class=row_odd><B>Onsite</B></TD>
	</TR>
	<%for(int i=0;i<(NoEmpOnsite);i++){%>
		<TR>
			<TD width=30%><B>Employee No#</B></TD>
			<TD width=30%><INPUT TYPE="text" NAME="EMPNOOnsite" id="EMPNOOnsite"><INPUT TYPE="Button" class="Button" Value="..." onclick="fnPopUp('SelEmp.jsp?ID=EMPNOOnsite&Count=<%=i%>',200,200)"></TD>
		</TR>
	<%}%>
<%}%>
<%if(NoEmpOffshore!=0){%>
	<TR>
	<TD  colspan=2 class=row_odd><B>Offshore</B></TD>
	</TR>
	<%for(int i=0;i<(NoEmpOffshore);i++){%>
		<TR>
			<TD width=30%><B>Employee No#</B></TD>
			<TD width=30%><INPUT TYPE="text" NAME="EMPNOOffshore" id="EMPNOOffshore"><INPUT TYPE="Button" class="Button" Value="..." onclick="fnPopUp('SelEmp.jsp?ID=EMPNOOffshore&Count=<%=i%>',200,200)"></TD>
		</TR>
	<%}%>
<%}%>
<%if(NoEmpOnsite!=0||NoEmpOffshore!=0){%>
	<TR>
		<TD colspan=2><INPUT TYPE="Button" Class="Button" Value="Save" onclick="this.disabled=true;saveData()"></TD>
	</TR>

<%}%>

</TABLE>
</FORM>
<div id="SaveObj"></div>
</BODY>

