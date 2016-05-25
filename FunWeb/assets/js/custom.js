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
	var mypostrequest = new ajaxRequest()
	
	mypostrequest.onreadystatechange=function()
	{
		
		if (mypostrequest.readyState==4)
		{
			if (mypostrequest.status==200 || window.location.href.indexOf("http")==-1)
			{
				var json = JSON.parse(mypostrequest.responseText)
				document.getElementById("logon").innerHTML = json.message + '<br><a href="assets/form-parts/user_logged.html">Go to next page</a>'
			}
			else
			{
				alert("An error has occured making the request")
			}
		}
	}

	var username = document.getElementById("inputUsername").value;
	var pass = document.getElementById("inputPassword").value;
	var parameters = "username="+username;
	parameters += "&user_password="+pass;
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
			//document - json intern al browser-ului
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