function openContact() 
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
	
	xhttp.open("GET", "assets/form-parts/contact.html", true);
	xhttp.send();
}
