<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="">
	function fnPopup(URL,h,w)
		{ 
			var strTitle ='Details';
			var strUrl = URL;
			var strOptions= 'menubar=no,toolbar=no,scrollbars=Yes,status=no,resizable=no,height='+h+',width='+w+',left=300,top=0';
			window.open(strUrl,strTitle,strOptions).focus();
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
<center>
<h2>List of Projects</h2>
 
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from Projects order by projectcode";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width='60%' align=center>
							<tr class="row_title">
							<th class="row_title">ProjectCode</th><th class="row_title">ProjectManager</th><th class="row_title">OnsiteManager</th><th class="row_title">ClientName</th><th class="row_title">ClientLocation</th><th class="row_title">DealCost</th><th class="row_title">DealDate</th><th class="row_title">StartDate</th><th class="row_title">Duration</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
				String PCode = rs.getString(1);
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td align=center><A onclick="fnPopup('ViewMembers.jsp?ProjectCode=<%=PCode%>',200,300)"><%=PCode%></A></td><td align=center><%=rs.getString(2)%></td><td align=center><%=rs.getString(3)%></td><td align=center><%=rs.getString(4)%></td><td align=center><%=rs.getString(5)%></td><td align=center><%=rs.getString(6)%></td><td align=center><%=rs.getString(7)%></td><td align=center><%=rs.getString(8)%></td><td align=center><%=rs.getString(9)%></td>
					</tr>
					<%
				rCount++;
			}
			%></table><%if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
			else{%>
				<CENTER><INPUT TYPE="Button" Value="Download to Excel" onclick="location.replace('ViewProjExcel.jsp')"></CENTER>
			<%}
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</center>
</BODY>
<%
  }
  %>


