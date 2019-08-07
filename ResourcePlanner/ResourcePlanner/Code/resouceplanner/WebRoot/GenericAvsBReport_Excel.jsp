<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="Kalyan">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<%@page contentType="application/vnd.ms-excel"%>
<%response.setHeader("Content-Disposition","attachment;filename=Report.xls");%>


<%
int iCount= 0;//Integer.parseInt((String)session.getAttribute("iCount"));
int pos=0;
int[] HorTotal= (int[])session.getAttribute("HorTotal");
int Total=((Integer)session.getAttribute("Total")).intValue();
int Gtotal=0;//((Integer)session.getAttribute("Gtotal")).intValue();
int[][] HorCount=  (int[][])session.getAttribute("HorCount");
String VerCategory = (String) session.getAttribute("VerCategory");
String HorCategory = (String) session.getAttribute("HorCategory");
String[] VerCat =   (String[])session.getAttribute("VerCat");
String[] HorCat =  (String[])session.getAttribute("HorCat");
int VCount = ((Integer)session.getAttribute("VCount")).intValue();
int HCount = ((Integer)session.getAttribute("HCount")).intValue();
String Title = (String) session.getAttribute("Title");

%>

<BODY>
<%if((Title==null||Title.equals(""))){
	%><h2 align =center> <%=VerCategory%> v/s <%=HorCategory%> </h2><%
}
else{
	%><h2 align =center> <%=Title%> </h2><%

}%>
<table border=1 cellpadding=2 cellspacing=2>
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
	%><tr class=row_odd><th class=results><%=HorCat[k]%></th><%
		for(iCount=0;iCount<VCount;iCount++)
		{
			%><td class=results align="center"><%=HorCount[k][iCount]%></td><%
		}
		%><td class=results align="center"><font color="red"><b><%=HorTotal[k]%></b></font></td><%
	}
	%>
</tr>
<tr class=row_odd>
	<th class=results><font color="Red">Total</font></th>
	<%
		for(iCount=0;iCount<VCount;iCount++)
		{
			for(int k=0;k<HCount;k++){
				Total+=HorCount[k][iCount];
			}
			Gtotal=Gtotal+Total;
			%><td class=results align="center"><font color="Red"><b><%=Total%></b></font></td><%
			Total=0;
		}
		%><td class=results align="center"><font color="Red"><b><%=Gtotal%></b></font></td><%
	%>
</tr>

</BODY>

</HTML>
