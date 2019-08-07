<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<html>
<!-- Table for displaying the graph-->
<table align="left" valign="top" cellpadding="0" cellspacing="0" bgcolor="black" text="lightGreen" width="40%" height="10%">
<tr></tr>

<%
//System.out.println("-------1--------");
	/*Declaration of variables*/

	int[][] HorCount= new int[500][500];
	int[] HorTotal= new int[500];
	int iHorCategory;
	int xaxis = 0;

	HorTotal = (int[])session.getAttribute("HorTotal");//System.out.println("-------2--------");

	HorCount=(int[][])session.getAttribute("HorCount");//System.out.println("-------3--------");

	String[] HorCategory=(String[])session.getAttribute("HorCat");//System.out.println("-------4--------");

	String[] Colors = {"RED","GREEN","BLUE","PINK","YELLOW","ORANGE","CREAM","LIGHTBLUE","LIGHTGREEN","GRAY"};
	String[] VerCategory=(String[])session.getAttribute("VerCat");//System.out.println("-------5--------");

	int Gtotal = ((Integer)session.getAttribute("Gtotal")).intValue();
	int VCount = ((Integer)session.getAttribute("VCount")).intValue();
	int HCount = ((Integer)session.getAttribute("HCount")).intValue();

	int[][] HorCountSeperatedArray = new int[500][500];
	String width = "";
	int HorCountSize = -1;
	//System.out.println("-------6--------"+HCount);
	for(int ii=0;ii<HCount;ii++){
		HorCountSeperatedArray[ii] = HorCount[ii];
		//System.out.println(HorCount[ii]);
	}
	int[] yaxis = new int[VCount];
	int heightCalculator = Gtotal;
	/*Getting the y-axis values from the HorCountSeperatedArray*/		
	for(int i=0;i<VCount;i++)
	{
		for(int j=0;j<HCount;j++)
		{
			yaxis[i] = yaxis[i]+HorCountSeperatedArray[j][i];
		}
		//System.out.println(i+"-!-"+yaxis[i]);
	}
%>
<!-- Displaying the HorCount HorCategorys in the graph -->
<tr>
<th rowspan="<%=(HCount)%>" colspan="<%=(((yaxis.length)*2)+2)%>">
</th>
<%
    String HorCountColor="";
    for(int i=0;i<HCount;i++)
    {
		//System.out.println(Colors[i]+"#"+HorCategory[i]);
  	  %><th bgcolor=<%=Colors[i]%>>&nbsp;&nbsp;</th><th><font size="2" color="white"><%=HorCategory[i]%></th></tr><%
    }
%>

<%
	/*Initialization for graph generation*/
	if(null != yaxis)
	{
		int yMax = 0;
		xaxis = VCount;// yaxis.length;
		String bgcolor = "black";
		width = (""+(100/((xaxis*2)+2)))+"%";
		
		/*Finding maximum height among all the y co-ordinates*/
		for(int i=0;i<xaxis;i++)
		{
			if(yMax < yaxis[i])
			{
				yMax = yaxis[i];
			}
		}
		yMax=yMax+6;
		
		/*Determining the height of each cell in the graph*/
		while(yMax>heightCalculator)
		{
			heightCalculator = heightCalculator;
		}
		String height = (""+((heightCalculator*2)/(yMax)));

		for(int j=0;j<yMax;j=(j+1))
		{
			//System.out.println("**"+j);
%>
	<!-- Generation of the graph using the HorCount values -->

	<tr>
	<th bgcolor="black">
	</th>
	<th bgcolor="black" width="0.5" height="<%=height%>"><font color="white" size="0.5">

<%
	if(((yMax-j)%5)==0)
	{
%>
	<%=(yMax-j)%>
<%
	}
%>
	</font></th>
	<th bgcolor="gray" width="2%" height="<%=height%>"></th>

<%
				//System.out.println("*** before for");
			for(int i=0;i<xaxis;i++)
			{
				//System.out.println("*in for*"+i);
				if(yaxis[i] >= (yMax-j))
				{
					for(int x=0;x<HCount;x++)
					{
						int temp = 0;
						int y = 0;
						while(y <= x)
						{
							temp = temp+HorCountSeperatedArray[y][i];
							y++;
						}
												
						if((yMax-j)<=temp)
						{
							bgcolor=Colors[x%HCount];
							//System.out.println(Colors[x%HCount]+"--"+x+"--"+x%HCount);
							if((yMax-j) == (temp))
							{
								HorCountSize = HorCountSeperatedArray[x][i];
							}
							else
							{
								HorCountSize = -1;
							}
							break;
						}
					}
				}
%>
		<th bgcolor="black" width="<%=width%>" height="<%=height%>">
		</th>
		<th bgcolor="<%=bgcolor%>" width="<%=width%>" height="<%=height%>">
		</th>
<%
				bgcolor="black";
			}
%>
	</tr>
<%
		}
	}
%>
<!-- Displaying the y-axis -->
<tr height="4%">
<th width="20" bgcolor="black">
</th>
<th width="20" bgcolor="black">
</th>
<th colspan="<%=(xaxis*2)+1%>">
<hr size="3" NOSHADE>
</th>
<th width="20" bgcolor="black">
</th>
</tr>

<!-- Displaying the x-axis HorCategorys-->
<%
if(null != VerCategory)
{
%>
<tr>
	<th width="20" bgcolor="black">&nbsp;
	</th>
	<th width="20" bgcolor="black">&nbsp;
	</th>
	<th width="20" bgcolor="black">&nbsp;
	</th>
	<th></th>
	<%
	for(int i=0;i<VCount;i++)
	{
	%>
		<th width="<%=width%>" bgcolor="black">
		<font color="#999999" size="2"><center><%=VerCategory[i]%></center></font>
		</th>
		<th width="<%=width%>" bgcolor="black">&nbsp;&nbsp;
		</th>
	<%
	}
	%>
</tr>
<%
}
%>
</table>
</html>