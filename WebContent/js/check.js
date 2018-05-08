/**
 * 
 */
function checkGender(){
	var genderNum=document.getElementsByName("gender");
	var gender="";
	for(var i=0;i<genderNum.length;i++){
		if(genderNum[i].checked){
			gender=genderNum[i].value;
		}
	}
	if(gender==""){
		document.getElementById("tips_gender").innerHTML="<em style = 'color:#FF0000'>至少选择其中一项</em>";
		return false;
	}
	else 
		{
		document.getElementById("tips_gender").innerHTML="OK";
		}
}

    function checkName()
    {
	var username= document.getElementById("txtUser").value;
    	if(username.length<6||username.length>18)    
    {
    	
    	document.getElementById("tips_username").innerHTML="<em style='color:#FF0000'>用户名由6-18位字符组成</em>";
    	document.getElementById("txtUser").focus();
        return false;
    }
    else{
    	document.getElementById("tips_username").innerHTML="OK!";
    }
    }
    
    function checkPwd(){
    //var reg=/[^A-Za-z0-9_]+/;
    //var regs=/^[a-zA-z0-9_\u4e00-\u9fa5]+$/;
    if(document.getElementById("txtPwd").value.length<6
    		||document.getElementById("txtPwd").value.length>18)
    	{
    	document.getElementById("tips_password").innerHTML=
    		"<em style ='color:#FF0000'>密码由6-18位字符组成</em>";
    		document.getElementById("txtPwd").focus();
    		return false;
    	}
    else{
    	document.getElementById("tips_password").innerHTML="OK!";
    }
    }
    
    function checkRpt(){
    if(document.getElementById("txtRpt").value!=document.getElementById("txtPwd").value)
    	{
    	document.getElementById("tips_repeat").innerHTML="<em style='color:#FF0000'>两次输入密码不一致</em>";
    		document.getElementById("txtRpt").focus();
    		return false;
    	}
    else{
    	document.getElementById("tips_repeat").innerHTML="OK!";
    }
    }
    
    function checkNewpassword(){
        if(document.getElementById("newpassword").value.length<6)
        	{
        	document.getElementById("tips_newpassword").innerHTML="<em style='color:#FF0000'>密码由6-18位字符组成</em>";
        		document.getElementById("newpassword").focus();
        		return false;
        	}
        else{
        	document.getElementById("tips_newpassword").innerHTML="OK!";
        }
        }
    
    function checkUser(){
    if(document.getElementById("selUser").selectedIndex==0)
    	{
    	document.getElementById("tips_usertype").innerHTML= 
    		"<em style='color:#FF0000'>没有选择用户类型</em>";
    	document.getElementById("selUser").focus();
    	return false;
    	}
    else{
    	document.getElementById("tips_usertype").innerHTML="OK!";
    }
    }
    
    function checktxtDate(){
    if(document.getElementById("txtDate").value==""){
    	document.getElementById("tips_birthdate").innerHTML= 
    		"<em style='color:#FF0000'>没有填写出生日期</em>";
    	document.getElementById("txtDate").focus();
    	return false;
    }
    else{
    	document.getElementById("tips_birthdate").innerHTML="OK!";
    }
    }
    
    function checkEmail(){
    var email=document.getElementById("txtMail").value;
    var pattern=/^[a-zA-z0-9#_\^\$\.\*\+\-\?\=\!\:\|\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
    if(email.length==0){
    	document.getElementById("tips_email").innerHTML= 
    		"<em style='color:#FF0000'>电子邮箱不能空</em>";
    	document.getElementById("txtMail").focus();
    	return false;
    }
    else if(!pattern.test(email))
    	{
    	document.getElementById("tips_email").innerHTML=
    		"<em style='color:#FF0000'>Email不合法</em>";
    	document.getElementById("txtMail").focus();
    	return false;
    	}
    else{
    	document.getElementById("tips_email").innerHTML="OK!";
    }
    }
    
    function checktxtIntro(){
    if(document.getElementById("txtIntro").value.length>100)
    	{
    	document.getElementById("tips_introduction").innerHTML=
    		"<em style='color:#FF0000'>长度不能超过100个字符</em>";
    	document.getElementById("txtIntro").focus();
    	return false;
    	}
    else{
    	document.getElementById("tips_introduction").innerHTML="OK!";
    }
    }
    
    function checkHobby(){
    	var hobby=0;
    	var objNum=document.getElementsByName("hobby");
    	for(var i=0;i<objNum.length;i++){
    		if(objNum[i].checked==true)
    			hobby++;
    	}
    if(hobby>=1){
    	document.getElementById("tips_hobby").innerHTML="OK!";
    }    
    else{
    	document.getElementById("tips_hobby").innerHTML="<em style='color:#FF0000'>至少选择其中一项</em>";
    	return false;
    }
    }
    
    function checkPhone(){
    	var phone= document.getElementById("phone").value;
    	if(phone.length!=11)    
    {
    	
    	document.getElementById("tips_phone").innerHTML="<em style='color:#FF0000'>请输入你的11位手机号码</em>";
    	document.getElementById("phone").focus();
        return false;
    }
    else{
    	document.getElementById("tips_phone").innerHTML="OK!";
    }
    }
    
    function checkAddress(){
    	var address = document.getElementById("address").value;
    	if(address.length<2)    
    {
    	
    	document.getElementById("tips_address").innerHTML="<em style='color:#FF0000'>请输入你的住址</em>";
    	document.getElementById("address").focus();
        return false;
    }
    else{
    	document.getElementById("tips_address").innerHTML="OK!";
    }
    }
    
    function checkStaff()
    {
	var staff= document.getElementById("staff").value;
    	if(staff.length<6)    
    {
    	
    	document.getElementById("tips_staff").innerHTML="<em style='color:#FF0000'>请正确输入销售人员工号</em>";
    	document.getElementById("staff").focus();
        return false;
    }
    else{
    	document.getElementById("tips_staff").innerHTML="OK!";
    }
    }
    
    function checkCount()
    {
	var count= document.getElementById("count").value;
    	if(count.length==0)    
    {
    	
    	document.getElementById("tips_count").innerHTML="<em style='color:#FF0000'>请输入购买数量</em>";
    	document.getElementById("count").focus();
        return false;
    }
    else{
    	document.getElementById("tips_count").innerHTML="OK!";
    }
    }
    
    
    
    