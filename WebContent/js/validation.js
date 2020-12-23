function checkEmpty(data) {
	if(data.length==0)
		return false;
	else
		return true;
	
}
function checkLength(data,no) {
	if(data.length<no)
		return false;
	else
		return true;
	
	
}
function checkCombo(data) {
	
	if(data=="def")
		return false;
	else
		return true;
	
}
function checkCtrl(chkarr) {
	
	flag=0;
	//alert("in js");
	for(i=0;i<chkarr.length;i++)
		{
		
		if(chkarr[i].checked)
			{
			flag=1;
			break;
			}
		}
	if(flag==0)
		return false;
	else
		return true;
}