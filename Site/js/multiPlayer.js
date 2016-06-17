function gotoMulti()
{
	location.href = "../../assets/form-parts/multi_player.html";	
}
function openPlayMulti(){
	//deschide a doua pagina
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			//document - json intern al browser-ului
			document.getElementById("playsingle").innerHTML = xhttp.responseText;
		}
	};
	
	xhttp.open("GET", "http://localhost/chat/index.html", true);
	xhttp.send();
	
}