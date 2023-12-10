function isName(){
	var uname=document.getElementById("uname").value;
	var error=document.getElementById("isName");
	if(uname==""){
		error.innerText="用户名不能为空!";
	}
	else
	{
			document.getElementById("uname").style.border="1px solid #669933";
			error.innerText="";
			return true;
	}
	document.getElementById("uname").style.border="1px solid red";
	return false;
}

function isPhone(){
	var phone=document.getElementById("phone").value;
	var error=document.getElementById("isPhone");
	var reg=/0?(13|14|15|18)[0-9]{9}$/;
	if(phone=="")
		error.innerText="手机不能为空!";
	else
	{
		if(reg.test(phone))
		{
			document.getElementById("phone").style.border="1px solid #669933";
			error.innerText="";
			return true;
		}
		else
			error.innerText="手机格式不正确!";
	}
	document.getElementById("phone").style.border="1px solid red";
	return false;
}

function isPwd1(){
	var pwd1=document.getElementById("pwd1").value;
	var error=document.getElementById("isPwd1");
	var reg=/^[A-Za-z0-9_-]+$/;
	if(pwd1=="")
		error.innerText="密码不能为空!";
	else
	{
		if(reg.test(pwd1))
		{
			document.getElementById("pwd1").style.border="1px solid #669933";
			error.innerText="";
			return true;
		}
		else
			error.innerText="密码格式不正确!";
	}
	document.getElementById("pwd1").style.border="1px solid red";
	return false;
}

function isPwd2(){
	var pwd2=document.getElementById("pwd2").value;
	var pwd1=document.getElementById("pwd1").value;
	var error=document.getElementById("isPwd2");
	if(pwd2=="")
		error.innerText="不能为空!";
	else
	{
		if(pwd2==pwd1)
		{
			document.getElementById("pwd2").style.border="1px solid #669933";
			error.innerText="";
			return true;
		}
		else
			error.innerText="密码不一致!";
	}
	document.getElementById("pwd2").style.border="1px solid red";
	return false;
}

function isLogin() {

}





