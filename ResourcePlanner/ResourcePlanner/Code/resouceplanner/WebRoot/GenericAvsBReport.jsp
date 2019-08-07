
<HTML>
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
<!--
function ToggleGraph(bid){
	var bValue = document.newForm.B1.value;
	if(bValue=="ShowGraph"){
		myid.style.display='block';
		document.newForm.B1.value = "HideGraph";
	}
	else if(bValue=="HideGraph"){
		myid.style.display='none';
		document.newForm.B1.value = "ShowGraph";
		location.reload();
	}
}

//-->
</SCRIPT>
</HEAD>

<jsp:include page="MultiLevelmenu.htm"/><BR><BR><BR><BODY  Class=SC>

<form name="newForm" action="GenericAvsBReport_Excel.jsp">
<%
System.out.println("-------------------");
String AccessCodes="BU";
if(AccessCodes.indexOf("BU")>-1 || AccessCodes.indexOf("BR")>-1 ) {
/*Declaration of variables*/
		%><center><INPUT TYPE="submit" class="Button"   value="Download to Excel" ></center><%

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
ResultSet VerRs=null,HorRs=null;
//String Role[]={"JE", "SE", "TA", "CON", "PM", "SCON" , "SPM"};
//String Role[]=new String[500];// = ims.du1.DEN.ServletListenerTimer.Roles;
//String TRole[]=new String[500];//={"JRENGR", "SE", "ANALYST", "CONS", "PM", "SCONS" , "SPMGR"};
int iCount=0;
int jCount=0;
//int iCityCount=0;

int[] HorTotal= new int[100];
//String Locations[]=new String[500];//={"Bangalore", "Hyderabad", "Pune","Chennai","Mysore","Chandigarh"};
int Total=0;
int Gtotal=0;
int pos=0;
int[][] HorCount= new int[100][100];
String TableName = request.getParameter("TableName");//"ConsolidatedData";
String VerCategory = request.getParameter("VerCategory");//"Status";
String HorCategory = request.getParameter("HorCategory");//"Role Capability";
String Condition = (request.getParameter("Condition")==null)? "" : request.getParameter("Condition");
String Title = (request.getParameter("Title")==null)? "" : request.getParameter("Title");

String[] VerCat = new String[500];
String[] HorCat = new String[500];
int Vi=0,Hi=0,VCount=0,HCount=0;
String VerQry = "Select distinct "+VerCategory+" from "+TableName;
String HorQry = "Select distinct "+HorCategory+" from "+TableName;
System.out.println(VerQry+","+HorQry);

try
{
	/*Getting the connection variable from session*/
				con=com.pms.ConnectionPool.getConnection();
				stmt =  con.createStatement();

				VerRs  = stmt.executeQuery(VerQry);


				//Getting Vertical category list
				while(VerRs.next()){
					VerCat[Vi] = VerRs.getString(1);
					System.out.println(VerCat[Vi]);
					Vi++;
				}
				VCount= Vi;
				VerRs.close();
				HorRs  = stmt.executeQuery(HorQry);
				//Getting Horizontal category list
				while(HorRs.next()){
					HorCat[Hi] = HorRs.getString(1);
					System.out.println(HorCat[Hi]);
					Hi++;
				}
				HCount= Hi;
				HorRs.close();

				stmt.close();
				//Role = VerCat;
				//TRole = VerCat;
				HorCat = HorCat;
				stmt =  con.createStatement();
for(int i=0;i<20;i++){
	for(int j=0;j<20;j++)
		HorCount[i][j]=0;
	HorTotal[i]=0;
}


	for(iCount=0;iCount<VCount;iCount++)
	{
		//String TempQry ="SELECT Count("+VerCategory+"),"+HorCategory+" FROM "+TableName+" WHERE ("+VerCategory+"='"+VerCat[iCount]+"' OR "+VerCategory+"='"+TRole[iCount]+"' ) GROUP BY "+HorCategory+"" ;
		String TempQry ="SELECT Count("+VerCategory+"),"+HorCategory+" FROM "+TableName+" WHERE ("+VerCategory+"='"+VerCat[iCount]+"' ) GROUP BY "+HorCategory+"" ;
		if(!(Condition==null||Condition.equals("")))
		{
			TempQry = "SELECT Count("+VerCategory+"),"+HorCategory+" FROM "+TableName+" WHERE ("+VerCategory+"='"+VerCat[iCount]+"' ) and "+Condition+" GROUP BY "+HorCategory+"" ;
		}
		System.out.println(TempQry);
		rs = stmt.executeQuery(TempQry);

	
		if(rs!=null)
		{
			while(rs.next())
			{
				
				String myLoc=rs.getString(2);
				int iTemp=rs.getInt(1);
				//Finding the position of location read from database in HorCat array
				for(int j=0;j<HCount;j++){
					if(HorCat[j].equalsIgnoreCase(myLoc)){
						pos=j;
						break;
					}
				}
					HorCount[pos][jCount]=iTemp;
					HorTotal[pos] += HorCount[pos][jCount];
			}
		 	jCount=jCount+1;
		}
		rs.close();	
	}
		for(int ii=0;ii<HCount;ii++){
			System.out.println("Total-:---"+HorTotal[ii]);
		}

}
catch(Exception e)
{
	%><%=e%><%
}
if(rs!=null){
if((Title==null||Title.equals(""))){
	%><h2 align =center> <%=VerCategory%> v/s <%=HorCategory%> </h2><%
}
else{
	%><h2 align =center> <%=Title%> </h2><%

}%>
<table width="60%" align=center >
<tr class=row_title>
	<th class=row_title>&nbsp;</th>
		<%
			for(iCount=0;iCount<VCount;iCount++){
			%><th class=row_title><%=VerCat[iCount]%></th><%
			}
		%>
	<th class=row_title><font color="black">Total</font></th>
</tr>
	<%
	for(int k=0;k<HCount;k++){
	%><tr class=row_odd><th ><%=HorCat[k]%></th><%
		for(iCount=0;iCount<VCount;iCount++)
		{
			%><td  align="center"><%=HorCount[k][iCount]%></td><%
		}
		%><td  align="center"><font color="red"><b><%=HorTotal[k]%></b></font></td><%
	}
	%>
</tr>
<tr class=row_odd>
	<th ><font color="Red">Total</font></th>
	<%
		for(iCount=0;iCount<VCount;iCount++)
		{
			for(int k=0;k<HCount;k++){
				Total+=HorCount[k][iCount];
			}
			Gtotal=Gtotal+Total;
			%><td  align="center"><font color="Red"><b><%=Total%></b></font></td><%
			Total=0;
		}
		%><td  align="center"><font color="Red"><b><%=Gtotal%></b></font></td><%
	%>
</tr>
<%
}
else
{
	/*To write to the server if the resultset is null*/
	System.out.println("Result set is null\n");

}


%>
</table>
</form>
<%
		session.setAttribute("HorTotal",HorTotal);
	session.setAttribute("Total",new Integer(Total));
	session.setAttribute("HorCount",HorCount);
	session.setAttribute("VerCategory",VerCategory);
	session.setAttribute("HorCategory",HorCategory);
	session.setAttribute("VerCat",VerCat);
	session.setAttribute("HorCat",HorCat);
	session.setAttribute("VCount",new Integer(VCount));
	session.setAttribute("HCount",new Integer(HCount));
	session.setAttribute("Gtotal",new Integer(Gtotal));
	session.setAttribute("Title",Title);

}
else{
	%><H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to view this page.</H5><%
}
%>
<%
	// Saveing the variables in session to generate excel & graph.
%>
</BODY>
</HTML>

