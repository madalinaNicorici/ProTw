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

function openPlaySingle() 
{
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			//document - json intern al browser-ului
			document.getElementById("playsingle").innerHTML = xhttp.responseText;
		}
	};
	
	xhttp.open("GET", "http://localhost/ProTw/Site/form-parts/inside_game.html", true);
	xhttp.send();
	
}

function openPlayMulti() 
{
	var user_id=window.location.href;
	user_id=user_id.split('=')[1];
			
	if (user_id != null)
	{
		var param = "?user_id="+user_id;
		location.href = "http://localhost:3000"+param;
	}
	else
		alert("You need to Sign In or Register");
}