function startClient() {
	var socket = io();
	$('#start').click(function(){
		socket.emit('chat message', $('').val());
		return false;
	});
	var i=0;
	var j=0;
	socket.on('chat message', function(msg){
	if(j<10){
	document.getElementById("start").innerHTML = "Next Question";
		if(i==0){
			if(j>0)			getResult();
			$('#messages').empty();
			$('#messages').append($('<p>'+msg+'</p><form>'));
			i++;j++;
		}
		else{
			$('#messages').append($('<input type="radio" name="greetings" id="r' + i + '">'+msg+'</input><br>'));
		i++;
		if(i==5){
			i=0;
			$('#messages').append($('</form>'));
			setTimeout(function(){socket.emit('chat message', $('').val());return false;},5000)
		}
		}
	}
	else{
		var ans="Utilizatorul "+localStorage.user_id+" are scorul "+score;
		socket.emit('return score',ans);
	}
	});
	
socket.on('getWinner',function(msg){
	document.getElementById("messages").innerHTML = msg;
})

}

function openPlayMulti() 
{
	//deschide a doua pagina
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() 
	{
		
		if (xhttp.readyState == 4 && xhttp.status == 200) 
		{
			//document - json intern al browser-ului
			document.getElementById("messages").innerHTML = xhttp.responseText;
		}
	};
	
	xhttp.open("GET", "http://localhost/ProTw/FunWeb/assets/form-parts/inside_game.html", true);
	xhttp.send();
}
localStorage.times=0;
var score=0;
function getResult(){
	if(localStorage.times<1)
		localStorage.times++;
	else{
		localStorage.times++;
	if (document.getElementById('r1').checked) {
		score=score+1;
		document.getElementById("previous").innerHTML = "You answered your last question right!";
	}
	else{
		document.getElementById("previous").innerHTML = "You answered your last question wrong!";
	}
	}
}
function getScore(){
	document.getElementById("messages").innerHTML = "You answered correctly "+score+" questions.";
}
	