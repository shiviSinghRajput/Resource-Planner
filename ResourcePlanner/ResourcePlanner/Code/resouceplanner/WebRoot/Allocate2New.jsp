<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" >
		function chk(a,b,c){
			var btnname = "S_"+c;
			var btn = document.getElementById(btnname);
			Str="";
			if(b.value>a || b.value <= 0){
				alert("Value should not exceed Requirement");
				b.value=0;
				btn.disabled = true;
			}
			else{
				btn.disabled = false;
				document.AllocateForm.NumOfFields.value = b.value;
				//alert(b.value);
				/*for(i=0;i<b.value;i++){
					Str+="<Input type='text' name='empno_"+c+"_"+i+"'><BR>";
				}
				divid.innerHTML = Str+"<input type='button' value='Select Employees' name='emp' onclick='fnEmpPopUp(\"SelEmp.jsp\",300,200);'>";*/

			}
		}
		function getData(i)
		{
			onReq = document.getElementsByName("onReq")[i].value;
			offReq = document.getElementsByName("offReq")[i].value;
			NoEmpOnsite = document.getElementsByName("NoEmpOnsite")[i].value;
			NoEmpOffshore = document.getElementsByName("NoEmpOffshore")[i].value;
			ProjectCode = document.getElementsByName("ProjectCode")[i].value;
			Role = document.getElementsByName("Role")[i].value;
			ReqID	= document.getElementsByName("ReqID")[i].value;
			Location = document.getElementsByName("Location")[i].value;
			Skill = document.getElementsByName("Skill")[i].value;
			URL = "GetAllocEmpList.jsp?ProjectCode="+ProjectCode+"&Role="+Role+"&ReqID="+ReqID+"&Location="+Location+"&Skill="+Skill+"&onReq="+onReq+"&offReq="+offReq+"&NoEmpOnsite="+NoEmpOnsite+"&NoEmpOffshore="+NoEmpOffshore;
			var divid = "EmpObj";
			//alert(URL,divid);
			var divobj = document.getElementById(divid);
			ajaxFunction(URL,divobj);
		}
	   function saveData()
	   {
		    Frm = document.SaveEmpForm;
			onReq = Frm.onReq.value;
			offReq = Frm.offReq.value;
			NoEmpOnsite = Frm.NoEmpOnsite.value;
			NoEmpOffshore = Frm.NoEmpOffshore.value;
			ProjectCode = Frm.ProjectCode.value;
			Role = Frm.Role.value;
			ReqID	= Frm.ReqID.value;
			Location = Frm.Location.value;
			Skill = Frm.Skill.value;
			EMPNOOnsite = document.getElementsByName("EMPNOOnsite");
			EMPNOOffshore = document.getElementsByName("EMPNOOffshore");
			LOnsite = EMPNOOnsite.length;
			LOffshore = EMPNOOffshore.length;
			OnsiteList="";
			for(i=0;i<LOnsite;i++){
				OnsiteList+=EMPNOOnsite[i].value+"~~";
			}
			OnsiteList = OnsiteList.substring(0,OnsiteList.length-2);
			//alert(OnsiteList);
			OffshoreList="";
			for(i=0;i<LOffshore;i++){
				OffshoreList+=EMPNOOffshore[i].value+"~~";
			}
			OffshoreList = OffshoreList.substring(0,OffshoreList.length-2);
			//alert(OffshoreList);
			URL = "SaveAllocEmp.jsp?ProjectCode="+ProjectCode+"&Role="+Role+"&ReqID="+ReqID+"&Location="+Location+"&Skill="+Skill+"&onReq="+onReq+"&offReq="+offReq+"&NoEmpOnsite="+NoEmpOnsite+"&NoEmpOffshore="+NoEmpOffshore+"&OnsiteList="+OnsiteList+"&OffshoreList="+OffshoreList;
			var divid = "SaveObj";
			//alert(URL+"--"+divid);
			var divobj = document.getElementById(divid);
			ajaxFunction(URL,divobj);
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
	String ProjectCode=request.getParameter("ProjectCode");
	int rCount=0;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			//String Query = "Select * from Requirement where ProjectCode='"+ProjectCode+"'";
			String Query = "select a.ProjectCode,a.reqID,a.Role,a.Location,a.Skill,a.noemponsite - b.noemponsite, a.noempoffshore-b.noempoffshore from requirement a, availability b where a.ProjectCode = b.ProjectCode and a.ReqID = b.ReqID and ((a.noemponsite - b.noemponsite)+(a.noempoffshore-b.noempoffshore) != 0) and a.ProjectCode='"+ProjectCode+"'";
			System.out.println(Query);
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

			while(rs.next())
			{
					String ReqID = rs.getString(2);
					String Role = rs.getString(3);
					String Location = rs.getString(4);
					String Skill = rs.getString(5);
					int onReq = Integer.parseInt(rs.getString(6));
					int offReq = Integer.parseInt(rs.getString(7));
					%>
					<tr>
						<th align=center colspan=2>&nbsp;</th>
					</tr>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<th align=center><%=ProjectCode%><INPUT TYPE="hidden" NAME="ProjectCode" Value="<%=ProjectCode%>"></th>
						<th align=center><%=ReqID%><INPUT TYPE="hidden" NAME="ReqID" Value="<%=ReqID%>"></th>
						<td align=center><%=Role%><INPUT TYPE="hidden" NAME="Role" Value="<%=Role%>"></td>
						<td align=center><%=Location%><INPUT TYPE="hidden" NAME="Location" Value="<%=Location%>"></td>
						<td align=center><%=Skill%><INPUT TYPE="hidden" NAME="Skill" Value="<%=Skill%>"></td>
					</tr>
					<tr>
						<th align=center colspan=2>&nbsp;</th>
					</tr>
					<tr class= "row_title">
						<th align=center colspan=2 class= "row_title"><FONT SIZE="2" face='verdana'>Employees Required</FONT></th><th align=center colspan=2 class= "row_title"><FONT SIZE="2" face='verdana'>Employees Available</FONT></th>
					</tr>
					<tr  class= "row_odd">
						<th align=center>Onsite</th><td><%=onReq%><INPUT TYPE="Hidden" NAME="onReq" Value="<%=onReq%>"></td><td align=center>Onsite</td>
						<td>
						<% if(onReq!=0){%>
						<INPUT TYPE="text" Name='NoEmpOnsite' Value="0" size=5 onchange="chk('<%=onReq%>',this,'<%=ReqID%>')">
						<%}else{%>
						<INPUT TYPE="text" Name='NoEmpOnsite' Value="0" size=5 Disabled><%}%>
						</td>
					</tr>
					<tr class= "row_even">
						<td align=center >Offshore</td>
						<td><%=offReq%><INPUT TYPE="Hidden" NAME="offReq" Value="<%=offReq%>"></td>
						<td align=center>Offshore</td>
						<td>
						<% if(offReq!=0){%><INPUT TYPE="text" Name='NoEmpOffshore' Value="0" size=5 onchange="chk('<%=offReq%>',this,'<%=ReqID%>')"><%}else{%>
						<INPUT TYPE="text" Name='NoEmpOffshore' Value="0" size=5 Disabled><%}%></td>

					</tr>
					<tr>
						<th align=center colspan=2>&nbsp;</th>
						<th class=noborder>
							 <INPUT TYPE="Button" class="button" ID="S_<%=ReqID%>" value="Allocate" Disabled onclick="this.disabled=true;getData(<%=rCount%>)">
						</th>
						<th class=noborder>
						 <INPUT TYPE="reset" NAME="Clear" value="Clear" class="button">
						 </th>
					</tr>
					<tr class=resultdiv>
						<TD colspan=4 class=resultdiv>
						</TD>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><TR><TD align=center colspan=5><B>Allocations is completed for this project</B> </TD></TR><TR><TD align=center colspan=5><A HREF="Allocate0.jsp">&lt;&lt;Back</A> </TD></TR><% }

		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</table>
</center>
<input type=hidden name="NumOfFields" value="">
</Form>
<div id="EmpObj"></div>
</BODY>



