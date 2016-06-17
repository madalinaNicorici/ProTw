function prepareRoom(){
	document.getElementById('logon1').style.display='';
}
function createRoom(){
	var name = document.getElementById("roomName").value;
	var pass = document.getElementById("password").value;
	document.getElementById("room-name").innerHTML = name;
}
	
	