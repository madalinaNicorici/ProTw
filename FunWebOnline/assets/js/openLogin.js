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
function gotoSingle(){
	location.href = "../../assets/form-parts/single_player.html";
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
				document.getElementById("logon").innerHTML = '<h2>Login successful!</h2>' + '<br><a href="assets/form-parts/user_logged.html">Go to next page</a>'
				localStorage.user_id = json.message;
				setTimeout(function() { 
						window.location.href = "assets/form-parts/user_logged.html";
				 }, 1000);
				
				//location.href = "assets/form-parts/user_logged.html";
			}
			else
			{
				return confirm("USERNAME or PASSWORD are invalid!")
			}
		}
	}

	var username = document.getElementById("inputUsername").value;
	var pass = document.getElementById("inputPassword").value;
	var parameters = "username="+username;
	parameters += "&user_password="+pass;
	mypostrequest.open("POST", "http://students.info.uaic.ro/~madalina.nicorici/FunWeb/index.php/users/user", true)
	mypostrequest.setRequestHeader("X-API-Key", "123456")
	mypostrequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
	mypostrequest.send(parameters)
	
}

