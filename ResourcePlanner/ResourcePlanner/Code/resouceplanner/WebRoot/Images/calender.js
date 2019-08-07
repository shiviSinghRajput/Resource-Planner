function fnCalendar(e) 
{
    var temp;
    //var presentvalue=e.parentElement.children(0).value;
	var presentvalue="";
    /*
    if(chkdate(e.parentElement.children(0))==true)
    {
      presentvalue=e.parentElement.children(0).value;
    }
    else
    {
      presentvalue="";
    } 
    */
     temp = window.showModalDialog("Images/ComCalendar.html",presentvalue,"dialogHeight:14; dialogWidth:15;  center:yes;toolbar: false;status: 0;scroll:0;unadorned:0;help:no");
      if(temp!=null)
     {
       e.parentElement.children(0).value =temp;
     }
    

}
function fnEnableCalLookup(e)
{
 e.src = "Images/CalEn.gif";
}
function fnDisableCalLookup(e)
{
 e.src = "Images/CalDis.gif";
}