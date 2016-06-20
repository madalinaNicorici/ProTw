function openLogin() 
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
	
	xhttp.open("GET", "http://localhost/ProTw/Site/form-parts/login.html", true);
	xhttp.send();
	
}
function gotoSingle(){
	location.href = "http://localhost/ProTw/Site/form-parts/single_player.html";
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
				var param = "?user_id="+json.message;
				window.location.href = "http://localhost/ProTw/Site/form-parts/user_logged.html"+param;
			}
			else
			{
				return confirm("USERNAME or PASSWORD are invalid!")
			}
		}
	}

	var username = document.getElementById("inputUsername").value;
	localStorage.username=username;
	var pass = document.getElementById("inputPassword").value;
	var parameters = "username="+username;
	parameters += "&user_password="+pass;
	mypostrequest.open("POST", "http://localhost/ProTw/FunWeb/users/user", true)
	mypostrequest.setRequestHeader("X-API-Key", "123456")
	mypostrequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
	mypostrequest.send(parameters)
	
}

