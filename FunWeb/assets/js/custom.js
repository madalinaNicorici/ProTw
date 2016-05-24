function ajaxRequest()
{
	var activexmodes=["Msxml2.XMLHTTP", "Microsoft.XMLHTTP"] //activeX versions to check for in IE
	if (window.ActiveXObject)
	{ //Test for support for ActiveXObject in IE first (as XMLHttpRequest in IE7 is broken)
		for (var i=0; i<activexmodes.length; i++)
		{
			try
			{
				return new ActiveXObject(activexmodes[i])
			}
			catch(e){	//suppress error 
			}
		}
	}
	else if (window.XMLHttpRequest) // if Mozilla, Safari etc
		return new XMLHttpRequest()
	else
		return false
}

function submitLogin()
{
	var mypostrequest=new ajaxRequest()
	mypostrequest.onreadystatechange=function()
	{
		if (mypostrequest.readyState==4)
		{
			if (mypostrequest.status==200 || window.location.href.indexOf("http")==-1)
			{
				document.getElementById("logon").innerHTML=mypostrequest.responseText
			}
			else
			{
				alert("An error has occured making the request")
			}
		}
	}
	var parameters = "username=Lacota_Mckenzie"
	parameters += "&user_password=AIf96GEm0PP"
	mypostrequest.open("POST", "users/user", true)
	mypostrequest.setRequestHeader("X-API-Key", "123456")
	mypostrequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
	mypostrequest.send(parameters)
}

function openLogin() 
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			document.getElementById("logon").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET", "assets/form-parts/login.html", true);
	xhttp.send();
}

function openSignup() 
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			document.getElementById("logon").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET", "assets/form-parts/signup.html", true);
	xhttp.send();
}