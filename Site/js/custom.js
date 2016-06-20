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

function goHome() {
	var user_id=window.location.href;
	user_id=user_id.split('=')[1];
	var param = "?user_id="+user_id;
	location.href='http://localhost/ProTw/Site/form-parts/user_logged.html'+param;
}


