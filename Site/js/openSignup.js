function openSignup() 
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			document.getElementById("logon").innerHTML = xhttp.responseText;
			document.getElementById("rows").innerHTML = '';
		}
	};
	xhttp.open("GET", "http://localhost/ProTw/Site/form-parts/signup.html", true);
	xhttp.send();
}

function registerUser()
{
	var mypostrequest = new ajaxRequest()
	mypostrequest.onreadystatechange=function()
	{
		if (mypostrequest.readyState==4)
		{
			if (mypostrequest.status==200 || window.location.href.indexOf("http")==-1)
			{
				var json = JSON.parse(mypostrequest.responseText)
				localStorage.user_id = json.message;
				setTimeout(function() { 
						window.location.href = "http://localhost/ProTw/Site/form-parts/user_logged.html";
				 }, 1000);
				//location.href = "assets/form-parts/user_logged.html";
			}
			else
			{
				alert("Cannot create user " + mypostrequest.responseText);
			}
		}
	}

	var name = document.getElementById("inputName").value;
	var surname = document.getElementById("inputSurname").value;
	var username = document.getElementById("inputUsername").value;
	var email = document.getElementById("inputEmail").value;
	var pass = document.getElementById("inputPassword").value;
	var repass = document.getElementById("inputRetypePassword").value;
	var parameters = "email="+email+"&user_password="+pass+"&name="+name+"&surname="+surname+"&username="+username;
	
	mypostrequest.open("POST", "http://localhost/ProTw/FunWeb/users/user", true)
	mypostrequest.setRequestHeader("X-API-Key", "123456")
	mypostrequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
	mypostrequest.send(parameters)
	
}