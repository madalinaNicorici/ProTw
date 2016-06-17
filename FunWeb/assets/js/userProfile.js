function getUserInfo()
{
	var getInfo = new ajaxRequest()
	
	getInfo.onreadystatechange=function()
	{
		
		if (getInfo.readyState==4)
		{
			if (getInfo.status==200 || window.location.href.indexOf("http")==-1)
			{
				
				var jsonresp = JSON.parse(getInfo.responseText)
				//document - json intern al browser-ului
				document.getElementById("uEmail").innerHTML = jsonresp.message.email;
				document.getElementById("userName").innerHTML = jsonresp.message.username;
				document.getElementById("uName").innerHTML = jsonresp.message.name;
				document.getElementById("uSurname").innerHTML = jsonresp.message.surname;
			}
			else
			{
				alert("An error has occured making the request")
			}
		}
	}
	
	getInfo.open("GET", "http://localhost/ProTw/FunWeb/users/user/"+localStorage.user_id, true)
	getInfo.setRequestHeader("X-API-Key", "123456")
	getInfo.send()
	
	
	var getStatus = new ajaxRequest()
	
	getStatus.onreadystatechange=function()
	{
		
		if (getStatus.readyState==4)
		{
			if (getStatus.status==200 || window.location.href.indexOf("http")==-1)
			{
				
				var json = JSON.parse(getStatus.responseText)
				//document - json intern al browser-ului
				document.getElementById("uLevel").innerHTML = json.message.level_id;
				document.getElementById("uPoints").innerHTML = json.message.points;
	
			}
			else
			{
				alert("An error has occured making the request")
			}
		}
	}
	
	getStatus.open("GET", "http://localhost/ProTw/FunWeb/scores/score/"+localStorage.user_id, true)
	getStatus.setRequestHeader("X-API-Key", "123456")
	getStatus.send()
	
}