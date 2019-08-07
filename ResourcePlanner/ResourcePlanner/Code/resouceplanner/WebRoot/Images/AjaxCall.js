function ajaxFunction(URL,divobj){ 
	URL=URL+"&Date="+Date();
	//alert(URL);
		  var xmlHttp;
		  try
			{      xmlHttp=new XMLHttpRequest();    }
		  catch (e)
			{    
			try
			  {      xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");      }
				catch (e)
				{		try
						{        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");        }
						catch (e){
							alert("Your browser does not support AJAX!");        
							return false;        
						}      
				}    
			  }
			  if (xmlHttp==null)
		  {
		  alert ("Your browser does not support AJAX!");
		  return;
		  } 

			xmlHttp.onreadystatechange=function()
			  {
			  if(xmlHttp.readyState==4)
				{
				//document.GenCodeForm.Code.value=xmlHttp.responseText;
				
				divobj.innerHTML=xmlHttp.responseText;
				//document.writeln(xmlHttp.responseText);
				}
			  else{
				//document.GenCodeForm.Code.value = "Error";
				divobj.innerHTML="Loading data....";
			  }
			  }
			  //alert(URL);
			xmlHttp.open("GET",URL,true);
			xmlHttp.send(null);  
}
function fnPopUp(strUrl,w,h)
	{
		window.open(strUrl,"PopUp","menubar=no,toolbar=no,scrollbars=Yes,resizable=Yes,height="+h+",width="+w+",top=10").focus();
	}
function chkStatus(CBox)
	{
		return CBox.checked;
	}
/*
function getTaskList(Sel,ii)
	{
			ConVal = Sel.value;
			var URL = "GetTaskList.jsp?ConVal="+ConVal;
			//alert(URL+" "+ii);		
			var divid = "TaskList_"+ii+"_"+Sel.value;
			//alert(divid);	
			var divobj = document.getElementById(divid);
			ajaxFunction(URL,divobj);

	}
*/