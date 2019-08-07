<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.StringTokenizer"%>
<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="validate.js"></script>
</HEAD>
<BODY class=SC>
<%
	System.out.println("------------------------------");
	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
		int on=0,off=0;
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
		String EMPOnsiteList = request.getParameter("OnsiteList");
		String EMPOffshoreList = request.getParameter("OffshoreList");
		String EmpOnsite[] = new String[500];
		String EmpOffshore[] = new String[500];
		
		StringTokenizer stOnsite = new StringTokenizer(EMPOnsiteList,"~~");
		int countOnsite=0;
		while (stOnsite.hasMoreTokens())
		{
			EmpOnsite[countOnsite] = stOnsite.nextToken();
			System.out.println(EmpOnsite[countOnsite]);
			countOnsite++;
		}

		StringTokenizer stOffshore = new StringTokenizer(EMPOffshoreList,"~~");
		String Rows[] = new String[500];
		int countOffshore=0;
		while (stOffshore.hasMoreTokens())
		{
			EmpOffshore[countOffshore] = stOffshore.nextToken();
			System.out.println(EmpOffshore[countOffshore]);
			countOffshore++;
		}



	try{
			
			con=com.pms.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Update Availability set NoEmpOnsite=(Availability.NoEmpOnsite+"+NoEmpOnsite+"),NoEmpOffshore=(Availability.NoEmpOffshore+"+NoEmpOffshore+") where ProjectCode=\'"+ProjectCode+"\' and ReqID=\'"+ReqID+"\' and Role=\'"+Role+"\' and Location=\'"+Location+"\' and Skill=\'"+Skill+"\'";
			//String Query = "Insert into allocations values('"+ProjectCode+"',"+ReqID+","+EmpNo+",'"+Location+"')";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0){
				for(int a=0;a<countOnsite;a++){
					String QueryOn = "Insert into allocations values('"+ProjectCode+"',"+ReqID+","+EmpOnsite[a]+",'Onsite')";
								System.out.println(QueryOn);
					on+= stmt.executeUpdate(QueryOn);
					String QryUpdateOn = "Update Employees set ProjectCode = \'"+ProjectCode+"\' where EmpNo = "+EmpOnsite[a];
					if(on>0){
						int Reson = stmt.executeUpdate(QryUpdateOn);
					}
				}
				for(int a=0;a<countOffshore;a++){
					String QueryOff = "Insert into allocations values('"+ProjectCode+"',"+ReqID+","+EmpOffshore[a]+",'Offshore')";
								System.out.println(QueryOff);
					off+= stmt.executeUpdate(QueryOff);
					String QryUpdateOff = "Update Employees set ProjectCode = \'"+ProjectCode+"\' where EmpNo = "+EmpOffshore[a];
					if(off>0){
						int Resoff = stmt.executeUpdate(QryUpdateOff);
					}
				}
				int res = on+off;
				if(res>0){
					%><P align=center><B><FONT  COLOR="green">Inserted into database sucessfully</FONT></B></P><%
				}
				else{
					%><P align=center><B><FONT  COLOR="red">Error in updating..please try again</FONT></B></P><%
				}
				
			}
			else{
				%><P align=center><B><FONT  COLOR="red">Error in updating..please try again</FONT></B></P><% 
			}
		con.close();
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>
