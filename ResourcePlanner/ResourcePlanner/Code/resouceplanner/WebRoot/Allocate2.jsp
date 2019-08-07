<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" >
		function chk(a,b,c){
			var btnname = "S_"+c;
			var divname = "EID_"+c;
			var btn = document.getElementById(btnname);
			divid = document.getElementById(divname);
			Str="";
			if(b.value>a || b.value <= 0){
				alert("Value should not exceed Requirement");
				b.value=0;
				btn.disabled = true;
				divid.innerHTML = "";
			}
			else{
				btn.disabled = true;
				document.AllocateForm.NumOfFields.value = b.value;
				for(i=0;i<b.value;i++){
					Str+="<Input type='text' name='empno_"+c+"_"+i+"'><BR>";
				}
				divid.innerHTML = Str+"<input type='button' value='Select Employees' name='emp' onclick='fnEmpPopUp(\"SelEmp.jsp\",300,200);'>";

			}
		}
	
	</script>

</HEAD>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br>



<BODY class=SC>
<form name="AllocateForm">
<center>
<h2>Project Requirement</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	String projectcode=request.getParameter("ProjectCode");
	String ReqID="";
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			//String Query = "Select * from Requirement where projectcode='"+projectcode+"'";
			String Query = "select a.projectcode,a.reqID,a.Role,a.Location,a.Skill,a.noemponsite - b.noemponsite, a.noempoffshore-b.noempoffshore from requirement a, availability b where a.projectcode = b.projectcode and a.ReqID = b.ReqID  where projectcode='"+projectcode+"'";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width="60%"> 
							<tr class=row_title>
							<th class=row_title>ProjectCode</th>
							<th class=row_title>Requirement ID</th>
							<th class=row_title>Role</th>
							<th class=row_title>Location</th>
							<th class=row_title>Skill</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					int onReq = Integer.parseInt(rs.getString(5));
					int offReq = Integer.parseInt(rs.getString(6));
					ReqID = rs.getString(7);

					%>
					<tr>
						<th align=center colspan=2>&nbsp;</th>
					</tr>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<th align=center><%=rs.getString(1)%></th>
						<th align=center><%=ReqID%></th>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><%=rs.getString(3)%></td>
						<td align=center><%=rs.getString(4)%></td>
					</tr>
					<tr>
						<th align=center colspan=2>&nbsp;</th>
					</tr>
					<tr class= "row_title">
						<th align=center colspan=2 class= "row_title"><FONT SIZE="2" face='verdana'>Employees Required</FONT></th><th align=center colspan=2 class= "row_title"><FONT SIZE="2" face='verdana'>Employees Available</FONT></th>
						<TD rowspan=3 class=row_even>
								<DIV style="position:relative;visibility:visible" ID="EID_<%=ReqID%>"></DIV>
						</TD>
						</tr>
					<tr  class= "row_odd">
						<th align=center>Onsite</th><td><%=onReq%></td><td align=center>Onsite</td>
						<td>
						<% if(onReq!=0){%>
						<INPUT TYPE="text" Name='NoEmpOnsite' Value="0" size=5 onchange="chk('<%=onReq%>',this,'<%=ReqID%>')">
						<%}else{%>
						<INPUT TYPE="text" Name='NoEmpOnsite' Value="0" size=5 Disabled><%}%>
						</td>
					</tr>
					<tr class= "row_even">
						<td align=center >Offshore</td>
						<td><%=offReq%></td>
						<td align=center>Offshore</td>
						<td>
						<% if(offReq!=0){%><INPUT TYPE="text" Name='NoEmpOffshore' Value="0" size=5 onchange="chk('<%=offReq%>',this,'<%=ReqID%>')"><%}else{%>
						<INPUT TYPE="text" Name='NoEmpOffshore' Value="0" size=5 Disabled><%}%></td>

					</tr>
					<tr>
						<th align=center colspan=2>&nbsp;</th>
						<th class=noborder>
							 <INPUT TYPE="submit" class="Button"  ID="S_<%=ReqID%>" value="Allocate" Disabled>
						</th>
						<th class=noborder>
						 <INPUT TYPE="reset" NAME="Clear" value="Clear">
						 </th>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }

		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</table>
</center>
<input type=hidden name="NumOfFields" value="">
</Form>
</BODY>


